package com.team3web.shop.controller;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team3web.shop.service.QnAService;
import com.team3web.shop.vo.MyQnAVO;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.QnAVO;

@Controller
public class QnAController { // qna게시판

	@Autowired
	private QnAService qnaService;

	//====1:1문의 시작 (사용자는 읽기/쓰기 기능까지만 가능하게)====
	
	// 1:1 문의 폼 
	@GetMapping("/myQnA")
	public ModelAndView myQnA(HttpServletRequest request, HttpServletResponse response)throws Exception {
		ModelAndView wm = new ModelAndView();
	    response.setContentType("text/html;charset=UTF-8");
	        wm.setViewName("/user/myPage/myQnA");
	        return wm;
	}
	
	// 1:1문의 저장  
	@PostMapping("/myQnA_ok")
	public String myQnA_ok(MyQnAVO q,HttpServletRequest request,HttpServletResponse response)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		this.qnaService.insertMyQ(q);
		return "redirect:/myQnA_list";
	}
	
	//1:1 문의 목록 
	@GetMapping("/myQnA_list")
	public String myQnA_list(Model model) {
	    List<MyQnAVO> myQnAList = qnaService.getMyQnAList();
	    
	    int totalCount = this.qnaService.getRowCount(); 
	    
	    model.addAttribute("myQnAList", myQnAList);
	    model.addAttribute("listcount", totalCount);
	    return "user/myPage/myQnA_list";
	}
	
	//==== 1:1문의 끝 ====
	
	// qna 글쓰기 폼
	@GetMapping("/qna_write")
	public ModelAndView qna_write(HttpServletRequest request, HttpSession session, HttpServletResponse response)throws Exception {
		
		ModelAndView wm = new ModelAndView();
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    
	    String loggedInUserId = (String) session.getAttribute("loggedInUserId");
	    if (loggedInUserId == null) {
	        out.println("<script>");
	        out.println("alert('로그인 이후에 이용 가능합니다.');");
	        out.println("</script>");
	        out.flush();
	        wm.setViewName("user/login");
	    } else {
	        int page = 1;
	        if (request.getParameter("page") != null) {
	            try {
	                page = Integer.parseInt(request.getParameter("page"));
	            } catch (NumberFormatException e) {
	                page = 1;
	            }
	        }
	        wm.addObject("page", page);
	        wm.setViewName("qna/qna_write");
	    }
	    return wm;
	} // qna_write()

	// 글쓰기 저장 
	@PostMapping("/qna_write_ok")
	public String qna_write_ok(QnAVO q,HttpServletRequest request,HttpServletResponse response)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		
		this.qnaService.insertQna(q);
		return "redirect:/qna_list";

	}// qna_write_ok



	// 페이징과 검색 기능이 되는 게시판 목록 
	@RequestMapping("/qna_list")
	public ModelAndView qna_list(HttpServletRequest request,PageVO q) {

		int page=1;
		int limit=10; //한 페이지에 보여지는 목록 개수를 10개로 함
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}

		/* 검색과 관련된 부분 추가 */
		String find_name = request.getParameter("find_name"); //검색어
		String find_field = request.getParameter("find_field"); //검색 필드
		q.setFind_name("%"+find_name+"%");  //%는 SQL문에서 하나 이상의 임의의 모르는 문자와 매핑 대응
		q.setFind_field(find_field);

		int totalCount = this.qnaService.getRowCount(q); 
		// 검색전 총 레코드 개수 , + 검색 후 레코드 개수

		q.setStartrow((page-1)*10+1); //시작행 번호
		q.setEndrow(q.getStartrow()+limit-1); //끝행 번호

		List<QnAVO> qlist=this.qnaService.getQnaList(q); //검색전 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		ModelAndView listM=new ModelAndView("qna/qna_list"); 
		//생성자 인자값으로 뷰페이지 경로 설정

		listM.addObject("qlist",qlist); //qlist 키이름에 목록 저장
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);// 시작 페이지 저장
		listM.addObject("endpage",endpage); //마지막 페이지
		listM.addObject("maxpage",maxpage); //최대페이지 
		listM.addObject("listcount",totalCount); // 검색전후 레코드 개수
		listM.addObject("find_field",find_field); //검색 필드 
		listM.addObject("find_name",find_name); //검색어 

		return listM;
	}//qna_list()

	
	
	
	
	// 내용 보기 + 답변폼 + 수정폼 + 삭제폼 
	@GetMapping("/qna_cont") //get방식으로 접근하는 매핑주소를 처리 
	public ModelAndView qna_cont(int qnano,int page,String state,QnAVO q) {
		if(state.equals("cont")) { // 내용보기일 때만 조회수 증가
			q=this.qnaService.getQnACont(qnano);
		}else {// 답변폼,수정폼,삭제폼일때는 조회수 증가 안 한다.
			q=this.qnaService.getQnACont(qnano);  // < -- 일단 조회수 안 쓸거니깐 똑같은 결론으로 넣어둠
		}

		String qna_cont=q.getQcont().replace("\n", "<br>");


		ModelAndView cm=new ModelAndView();
		cm.addObject("page",page); //페이징에서 책갈피 기능때문에 쪽번호에 저장
		cm.addObject("q",q);
		cm.addObject("qna_cont",qna_cont);

		if(state.equals("cont")) {
			cm.setViewName("qna/qna_cont"); 
		}else if(state.equals("reply")) { 
			cm.setViewName("qna/qna_reply");
		}else if(state.equals("edit")) {
			cm.setViewName("qna/qna_edit");
		}else if(state.equals("del")) {
			cm.setViewName("qna/qna_del");
		}
		return cm;
	} //qna_cont()

	//답변 저장 
	@PostMapping("/qna_reply_ok") 
	public String qna_reply_ok(QnAVO rq,int page) {
		this.qnaService.replyQnA(rq); //답변 레벨 증가와 답변 저장 
		return "redirect:/qna_list?page="+page;
	}// qna_reply_ok()	


	// 게시판 수정 
	@PostMapping("/qna_edit_ok")
	public ModelAndView qna_edit_ok(QnAVO q, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		//웹브라우저로 출력되는 파일형태와 언어코딩 타입을 설정
		PrintWriter out=response.getWriter();//출력스트림 out생성

		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		} 

		QnAVO db_pwd = this.qnaService.getQnACont(q.getQnano());

		if(!db_pwd.getQpw().equals(q.getQpw())) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {

			// QnAVO 객체를 사용하여 게시물 업데이트
			this.qnaService.editQnA(q);

			ModelAndView em=new ModelAndView("redirect:/qna_cont");
			em.addObject("qnano",q.getQnano());
			em.addObject("page",page);
			em.addObject("state","cont");
			return em;
		}
		return null;
	} //qna_edit_ok()

	
	//게시판 삭제 
		@RequestMapping("/qna_del_ok")
		public String qna_del_ok(
				@RequestParam("qnano") int qnano,
				@RequestParam("qpw") String qpw,
				HttpServletResponse response,
				HttpServletRequest request,
				HttpSession session)
						throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			QnAVO db_pwd=this.qnaService.getQnACont(qnano);
	
			 // 아래의 isAdmin() 메서드는 사용자가 관리자 계정인지 여부를 확인합니다.
			
			String loggedInUserId = (String) session.getAttribute("loggedInUserId");
			 // 아래의 isAdmin() 메서드는 사용자가 관리자 계정인지 여부를 확인합니다.
		   
			if (!isAdmin(loggedInUserId) && !db_pwd.getQpw().equals(qpw)) {
		        out.println("<script>");
		        out.println("alert('비번이 다르거나 권한이 없습니다!');");
		        out.println("history.back();");
		        out.println("</script>");
		    } else {
		        this.qnaService.delQnA(qnano); // 게시판 삭제
		        return "redirect:/qna_list?page=" + page;
		    }
		    return null;
			
		}//qna_del_ok()
	
		
		// 사용자가 관리자인지 여부를 확인하는 메서드
		private boolean isAdmin(String loggedInUserId) {
		    // 여기에 사용자의 역할(role)을 확인하는 코드를 추가해야 합니다.
		    // 예를 들어, 사용자의 역할(role)이 "ADMIN"이면 true를 반환하도록 구현합니다.
		    if ("ADMIN".equals(loggedInUserId)) {
		    	return true;
		    }	   
		    return false; // 사용자가 관리자가 아닌 경우
		
		}

}
