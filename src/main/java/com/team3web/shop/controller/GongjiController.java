package com.team3web.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team3web.shop.service.GongjiService;
import com.team3web.shop.vo.GongjiVO;

@Controller
public class GongjiController {

	@Autowired
	private GongjiService gongjiser;
	
	
	//메인화면 최신 공지 목록 5개 보기(사용자 공지사항)
	@RequestMapping("/gongji_list")
	public String gongji_list(Model gm) {
		List<GongjiVO> glist=this.gongjiser.getList();
		gm.addAttribute("glist",glist);
		return "gongji/gongji_list";
	}//gongji_list()
	
	//공지내용보기+조회수 증가
		@RequestMapping("/gongji_cont")
		public ModelAndView gongji_cont(
				@RequestParam("gno") int gno)
		{
			GongjiVO g=this.gongjiser.getGongjiCont(gno);
			String gcont=g.getGcont().replace("\n","<br/>");

			ModelAndView gm=new ModelAndView("gongji/gongji_cont");
			gm.addObject("g",g);
			gm.addObject("gcont",gcont);
			return gm;
		}//gongji_cont()
	
	
	
	
}
