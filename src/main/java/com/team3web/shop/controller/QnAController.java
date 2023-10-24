package com.team3web.shop.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team3web.shop.service.QnAService;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.QnAVO;

@Controller
public class QnAController { // qna게시판

	@Autowired
	private QnAService qnaService;
	
	
	@RequestMapping(value="/myPage/myQnA", method=RequestMethod.GET)
	public String myQnA() {
		return "/user/myPage/myQnA";
	}
	
	
	
	// qna 글쓰기 폼
	@GetMapping("/qna_write")
	public ModelAndView qna_write(HttpServletRequest request) {

		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));

		}
		ModelAndView wm = new ModelAndView();
		wm.addObject("page", page); // 페이징 책갈피 기능때문에 page 키이름에 쪽번호 저장
		wm.setViewName("qna/qna_write");
		return wm;
	} // qna_write()
	
	@PostMapping("/qna_write_ok")
	public String qna_write_ok(QnAVO q,HttpServletRequest request)
	throws Exception{
		
		
		String qid = request.getParameter("qid");
	    
		String qtitle = request.getParameter("qtitle");
	    
		String qcont = request.getParameter("qcont");
	    
		String qpw = request.getParameter("qpw");
		
		q.setQid(qid); q.setQtitle(qtitle);
		q.setQpw(qpw); q.setQcont(qcont);
		this.qnaService.insertQna(q);
		return "redirect:/qna_list";
		
	}// qna_write_ok
	
	

	// 페이징과 검색 기능이 되는 자료실 목록 
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
	
	
}