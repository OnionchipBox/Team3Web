package com.team3web.shop.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team3web.shop.service.ReviewService;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewser;

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	// 리뷰 글쓰기 폼 
	@GetMapping("/review_write")
	public ModelAndView review_write(HttpServletRequest request) {
		int page=1;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
			//get으로 전달된 쪽번호가 있는 경우 정수 숫자로 변경해서 저장 	
		}
		ModelAndView wm = new ModelAndView();
		wm.addObject("page",page); //페이징 책갈피 기능때문에 page 키이름에 쪽번호 저장
		wm.setViewName("review/review_write"); 
		return wm;

	} // review_write()

	// 리뷰 저장 

	@RequestMapping(value = "/review_write_ok", method = RequestMethod.POST)
	public String insertReview(@ModelAttribute ReviewVO review, @RequestParam("uploadFile") MultipartFile file, Model model,
			HttpServletRequest request) throws IOException {
		// 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
		String savedFileName = "";
		String realPath = request.getRealPath("D:\\program\\imgUpload\\");
		System.out.println("실제 경로" + realPath);		

		// 2. 원본 파일 이름 알아오기
		String originalFileName = file.getOriginalFilename();
		// 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
		UUID uuid = UUID.randomUUID();
		savedFileName = uuid.toString()+".png";

		// 5. 외부 저장소에 파일 생성 및 저장
		File externalFile = new File(realPath + savedFileName);
		file.transferTo(externalFile);

		if (file.isEmpty()) {
			// 파일이 업로드되지 않은 경우에 대한 처리
			// 예를 들어, 에러 메시지를 설정하거나 리다이렉트하여 사용자에게 알림	
			savedFileName="";
			review.setRefile(savedFileName);
			originalFileName="";
			review.setThumbimg(originalFileName);
		}

		
		
		
		review.setRefile(savedFileName);
		review.setThumbimg(originalFileName);

		reviewser.insertReview(review);

		//model.addAttribute("originalFileName", originalFileName);
		// logger.info("insertReview()" + review);
		//model.addAttribute("review", review);
		return "redirect:/review_list"; // 리뷰 목록 페이지로 리다이렉트
	}

	// 페이징과 검색 기능이 되는 리뷰 목록 
	@RequestMapping("/review_list")
	public ModelAndView review_list(HttpServletRequest request,PageVO p) {

		int page=1;
		int limit=10; //한 페이지에 보여지는 목록 개수를 10개로 함
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}

		/* 검색과 관련된 부분 추가 */
		String find_name = request.getParameter("find_name"); //검색어
		String find_field = request.getParameter("find_field"); //검색 필드
		p.setFind_name("%"+find_name+"%");  //%는 SQL문에서 하나 이상의 임의의 모르는 문자와 매핑 대응
		p.setFind_field(find_field);

		int totalCount = this.reviewser.getRowCount(p); 
		System.out.println("레코드 개수 : "+totalCount);
		// 검색전 총 레코드 개수 , + 검색 후 레코드 개수

		p.setStartrow((page-1)*10+1); //시작행 번호
		p.setEndrow(p.getStartrow()+limit-1); //끝행 번호

		List<ReviewVO> rlist=this.reviewser.getReviewList(p); //검색전 목록
		System.out.println("목록 개수 : "+rlist.size());

		for(ReviewVO r:rlist) {
			//System.out.println("번호:"+r.getRe_no());
			//System.out.println("작성자:"+r.getRe_name());
		}
		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		ModelAndView listM=new ModelAndView("review/review_list"); 
		//생성자 인자값으로 뷰페이지 경로 설정

		listM.addObject("rlist",rlist); //rlist 키이름에 목록 저장
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);// 시작 페이지 저장
		listM.addObject("endpage",endpage); //마지막 페이지
		listM.addObject("maxpage",maxpage); //최대페이지 
		listM.addObject("listcount",totalCount); // 검색전후 레코드 개수
		listM.addObject("find_field",find_field); //검색 필드 
		listM.addObject("find_name",find_name); //검색어 

		return listM;
	}//review_list()	


	// 리뷰 내용 보기 + 답변폼 + 수정폼 + 삭제폼 
	@GetMapping("/review_cont") //get방식으로 접근하는 매핑주소를 처리 
	public ModelAndView review_cont(int reno,int page,String state,ReviewVO r) {
		if(state.equals("cont")) { // 내용보기일 때만 조회수 증가
			r=this.reviewser.getReviewCont(reno);
		}else {// 답변폼,수정폼,삭제폼일때는 조회수 증가 안 한다.
			r=this.reviewser.getReviewCont2(reno);
		}

		String review_cont=r.getRecont().replace("\n", "<br>");
		// textarea 입력박스에서 엔터키를 친 부분 \n을 <br>태그로 변경해서 웹상에서 내용을 볼 때
		//줄바꿈해서 본다. 

		ModelAndView cm=new ModelAndView();
		cm.addObject("page",page); //페이징에서 책갈피 기능때문에 쪽번호에 저장
		cm.addObject("r",r);
		cm.addObject("review_cont",review_cont);

		if(state.equals("cont")) {
			cm.setViewName("review/review_cont"); //뷰페이지 경로가
			//WEB-INF/views/review/review_cont.jsp 이다.
		}else if(state.equals("reply")) { //답변 폼일 때
			cm.setViewName("review/review_reply");
		}else if(state.equals("edit")) {//수정 폼일 때
			cm.setViewName("review/review_edit");
		}else if(state.equals("del")) {//삭제폼일 때
			cm.setViewName("review/review_del");
		}
		return cm;
	} //review_cont()				

	//답변 저장 
	@PostMapping("/review_reply_ok") // post로 접근하는 매핑주소를 처리, review_reply_ok 매핑 주소 등록
	public String review_reply_ok(ReviewVO rb,int page) {
		
		this.reviewser.replyReview(rb); //답변 레벨 증가와 답변 저장 
		return "redirect:/review_list?page="+page;
	}// review_reply_ok()	


	// 리뷰게시판 수정 
	@RequestMapping("/review_edit_ok")
	public ModelAndView review_edit_ok(@ModelAttribute ReviewVO review, @RequestParam("uploadFile") MultipartFile file, Model model,
			HttpServletRequest request,HttpServletResponse 
			response) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		//웹브라우저로 출력되는 문자와 태그 ,언어코딩 타입을 설정

		String savedFileName = "";
		String realPath = request.getRealPath("D:\\program\\imgUpload\\");
		System.out.println("실제 경로" + realPath);		

		// 2. 원본 파일 이름 알아오기
		String originalFileName = file.getOriginalFilename();
		// 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
		UUID uuid = UUID.randomUUID();
		savedFileName = uuid.toString()+".png";

		// 5. 외부 저장소에 파일 생성 및 저장
		File externalFile = new File(realPath + savedFileName);
		file.transferTo(externalFile);


		PrintWriter out=response.getWriter();//출력스트림 out생성

		int reno = Integer.parseInt(request.getParameter("reno"));

		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}

		String rename2 = request.getParameter("rename2");
		String retitle = request.getParameter("retitle");
		String repwd = request.getParameter("repwd");
		String recont = request.getParameter("recont");

		ReviewVO db_pwd = this.reviewser.getReviewCont2(reno);//조회수가 증가되지 않는 것으로
		//해서 오라클로 부터 비번을 가져옴

		
		String modifiedFileName = null; // 변수를 if 문 밖에서 미리 선언
		
		if(!db_pwd.getRepwd().equals(repwd)) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if (file != null && !file.isEmpty()) { // 수정 첨부된 파일이 있는 경우
				
				modifiedFileName = file.getOriginalFilename();
	            
				// 기존의 원본 파일명을 새로운 파일명으로 업데이트합니다.
			    originalFileName = modifiedFileName;
			    
			    modifiedFileName = uuid.toString()+".png";
			    
			    
				 File delFile = new File(realPath + db_pwd.getRefile());
	            
	            if (delFile.exists()) { // 기존 파일이 있다면
	                delFile.delete(); // 기존 첨부파일 삭제
	            }
	        }

	        review.setRename2(rename2);
	        review.setRetitle(retitle);
	        review.setRecont(recont);
	        review.setReno(reno);
	        review.setRefile(modifiedFileName); // 수정된 파일명을 VO에 저장    
			review.setThumbimg(originalFileName); // 원본 파일명을 수정된 파일명으로 설정
			
			
			this.reviewser.editReview(review);//게시판 수정

			ModelAndView em=new ModelAndView("redirect:/review_cont");
			em.addObject("reno",reno);
			em.addObject("page",page);
			em.addObject("state","cont");
			return em;//브라우저 주소창에 다음과 같이 실행된다. re_cont?re_no=번호&page=쪽번호
			//&state=cont 3개의 피라미터 값이 get방식으로 전달된다.=>쿼리스트링 방식임.
		}//if else      
		return null;

	} // review_edit_ok()



	// 리뷰게시판 삭제 
	@RequestMapping("/review_del_ok") // get or post로 전달되는 매핑주소를 처리
	public ModelAndView review_del_ok(int reno,int page,@RequestParam("del_pwd")
	String del_pwd, HttpServletResponse response,HttpServletRequest request)
			throws Exception{
		/* @RequestParam("del_pwd") 스프링의 애노테이션의 의미는 
		 *    request.getParameter("del_pwd")와 같은 기능이다.   
		 */
		response.setContentType("text/html;charset=UTF-8"); //한글 깨짐 방지
		PrintWriter out=response.getWriter();
		String delFolder =request.getRealPath("D:\\program\\imgUpload\\");
		ReviewVO db_pwd=this.reviewser.getReviewCont2(reno);
		String fileNameToDelete = db_pwd.getRefile();

		
		if(!db_pwd.getRepwd().equals(del_pwd)) { 
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {
			this.reviewser.delReview(reno);//자료실 삭제
			
			if (fileNameToDelete != null) {
	            File delFile = new File(delFolder + File.separator + fileNameToDelete);
	            // Note the usage of File.separator for cross-platform file path construction.
	            if (delFile.exists()) {
	                if (delFile.delete()) {
	                    System.out.println("파일 삭제 성공: " + fileNameToDelete);
	                } else {
	                    System.err.println("파일 삭제 실패: " + fileNameToDelete);
	                }
	            } else {
	                System.err.println("파일이 존재하지 않습니다: " + fileNameToDelete);
	            }
	        }


			ModelAndView dm=new ModelAndView();
			dm.setViewName("redirect:/review_list?page="+page);
			return dm;
		}
		return null;
	}//review_del_ok()
	
}