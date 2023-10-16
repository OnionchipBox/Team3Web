package com.team3web.shop.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team3web.shop.service.QnAService;
import com.team3web.shop.vo.QnAVO;

@Controller
public class QnAController { // qna게시판

	@Autowired
	private QnAService qnaService;
	
	// qna 글쓰기 폼
		@GetMapping("/qna_write") 
		public ModelAndView qna_write(HttpServletRequest request) {
			
			int page=1;
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
				
			}
			ModelAndView wm = new ModelAndView();
			wm.addObject("page",page); //페이징 책갈피 기능때문에 page 키이름에 쪽번호 저장
			wm.setViewName("qna/qna_write"); 
			return wm;
		} // qna_write() 
	
	
	/* qna 저장 
		@PostMapping("/qna_write_ok")
		public String qna_write_ok(QnAVO q,HttpServletRequest request)
		throws Exception{
			String saveFolder = request.getRealPath("upload_qna"); //이진 파일 업로드 서버 경로
			int fileSize = 5*1024*1024; //이진파일 업로드 최대크기
			MultipartRequest multi = null; // 이진파일 업로드 참조변수 
			
			
			multi = new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
			
			String qid = multi.getParameter("qid");
			String qtitle = multi.getParameter("qtitle");
			String qpw = multi.getParameter("qpw");
			String qcont = multi.getParameter("qcont");
			
			
			File upFile = multi.getFile("qfile"); // 첨부한 이진파일을 가져온다.
			
			if(upFile != null) { // 첨부한 파일이 있는 경우 실행 
				String fileName = upFile.getName(); //첨부한 파일명을 구함.
				Calendar c=Calendar.getInstance(); 
				int year = c.get(Calendar.YEAR); //년도값
				int month = c.get(Calendar.MONTH)+1; //월값, +1을 한 이유 :1월이 0으로 반환되기 때문
				int date = c.get(Calendar.DATE); //일값
				
				String homedir = saveFolder+"/"+year+"-"+month+"-"+date; //오늘 날짜 폴더 경로를 저장
				File path01 = new File(homedir);
				
				if(!(path01.exists())) { // 오늘날짜 폴더 경로가 없다면
					path01.mkdir(); //오늘 날짜 폴더 생성
					
				}
				Random r = new Random(); //난수를 발생시키는 클래스 
				int random = r.nextInt(10000); // 0이상 10000미만 사이의 정수 숫자 난수를 발생 -> 강사님은 1억으로 설정하셨다요!!
				
				int index=fileName.lastIndexOf("."); //.위치 번호를 맨 오른쪽부터 찾아서
				// 가장 먼저 나오는 . 위치번호를 맨 왼쪽부터 카운트해서 구한다. 첫 문자는 0부터 시작 
				
				String fileExtendsion=fileName.substring(index+1); // .이후부터
				//마지막 문자까지 구함. -> 즉 첨부파일 확장자만 구함 
				String refileName="qna"+year+month+date+random+"."+fileExtendsion;
				//새로운 첨부파일명을 저장
				String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
				// 데이터베이스에 저장될 레코드 값
				
				upFile.renameTo(new File(homedir+"/"+refileName));
				// 새롭게 생성된 폴더에 변경된 파일명으로 실제 업로드 
				
				
				q.setQfile(fileDBName); // 데이터 베이스에 저장될 레코드값
			}else { //첨부 파일이 없는 경우 
				String fileDBName="";
				q.setQfile(fileDBName);
			}//if else
			
			
			q.setQid(qid); q.setQtitle(qtitle);
			q.setQpw(qpw); q.setQcont(qcont);
			
			this.qnaService.insertQna(q); //자료실 저장 
			return "redirect:/qna_list"; //자료실 목록보기 매핑주소로 이동 
		}// qna_write_ok()
	*/
		
		
	/*// 수정중 
		@PostMapping("/qna_write_ok")
		public String qna_write_ok(QnAVO q, @RequestParam("qfile") MultipartFile qfile, 
				String qid, String qtitle, String qcont, String qpw, HttpServletRequest request) {
		    String saveFolder = request.getRealPath("upload_qna");
		    
		    if (!qfile.isEmpty()) { // 파일이 업로드된 경우
		        String originalFileName = qfile.getOriginalFilename();
		        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		        String saveFileName = "qna" + System.currentTimeMillis() + fileExtension;
		        String filePath = saveFolder + File.separator + saveFileName;
		        
		        try {
		            qfile.transferTo(new File(filePath)); // 파일 저장
		            q.setQfile("/upload_qna/" + saveFileName); // 데이터베이스에 저장될 파일 경로
		        } catch (IOException e) {
		            // 파일 업로드 중 오류 처리
		            e.printStackTrace();
		        }
		    } else {
		        // 파일이 첨부되지 않은 경우
		        q.setQfile(""); // 빈 문자열 또는 원하는 기본값 설정
		    }
		    
		    // 나머지 데이터 처리
		    // ...
			q.setQid(qid); q.setQtitle(qtitle); q.setQcont(qcont); q.setQpw(qpw);
			
		    this.qnaService.insertQna(q); // 자료실 저장
		    return "redirect:/qna_list"; // 자료실 목록보기 매핑 주소로 이동
		}	
		*/
			
				
}
