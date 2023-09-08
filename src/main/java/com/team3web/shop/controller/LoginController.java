package com.team3web.shop.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.team3web.shop.api.KakaoLoginBO;
import com.team3web.shop.api.NaverLoginBO;
import com.team3web.shop.service.LoginService;
import com.team3web.shop.vo.UserRoleVO;
import com.team3web.shop.vo.UserVO;


@Controller
public class LoginController {
	
	private NaverLoginBO naverLoginBO;
	private KakaoLoginBO kakaoLoginBO;
	
	@Inject
	LoginService loginService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
		this.kakaoLoginBO = kakaoLoginBO;
	}
	
	@RequestMapping(value = "/login" , method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버: " + naverAuthUrl);
		model.addAttribute("naverUrl", naverAuthUrl);
		
	    String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
	    System.out.println("카카오: " + kakaoAuthUrl);
	    model.addAttribute("kakaoUrl", kakaoAuthUrl);
	    
		return "/user/login";
	}
	
	@RequestMapping(value = "/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("Naver callback");
	    
	    OAuth2AccessToken oauthToken;
	    oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    
	    if (oauthToken != null) {
	        String apiResult = naverLoginBO.getUserProfile(oauthToken);
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(apiResult);
	        JSONObject jsonObj = (JSONObject) obj;
	        
	        JSONObject response_obj = (JSONObject) jsonObj.get("response");
	        String nickname = (String) response_obj.get("nickname");
	        System.out.println(nickname);
	        
	        session.setAttribute("sessionId", nickname);
	        model.addAttribute("result", apiResult);
	    } else {
	    	System.out.println(" AccessToken ");
	    }
	    
	    return "login";
	}
	
	@RequestMapping(value = "/kakao/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	    System.out.println("Kakao callback");
	    
	    OAuth2AccessToken oauthToken;
	    oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
	    
	    if (oauthToken != null) {
	        String apiResult = kakaoLoginBO.getUserProfile(oauthToken);
	        
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(apiResult);
	        JSONObject jsonObj = (JSONObject) obj;
	        JSONObject properties = (JSONObject) jsonObj.get("properties");
	        String nickname = (String) properties.get("nickname");
	        
	        System.out.println(nickname);
	        session.setAttribute("sessionId", nickname);
	        model.addAttribute("result", apiResult);
	    } else {
	    	System.out.println(" AccessToken ");
	    }
	    
	    return "login";
	}
	
	// 로그인 처리
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute UserVO user, @RequestParam("num") int num, HttpSession session) {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("login");

	    try {
	        int result = loginService.loginCheck(user, session);
	        if (result == 1) {
	            // 로그인 성공
	            SecurityContext context = SecurityContextHolder.getContext();
	            Authentication authentication = context.getAuthentication();
	            if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
	                UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	                String id = userDetails.getUsername();
	                session.setAttribute("userId", id);
	                UserRoleVO role = loginService.viewUserRole(id);
	                session.setAttribute("role", role);

	                if (num == 1 && "ROLE_ADMIN".equals(role.getRole())) {
	                    mv.setViewName("/shop/admin");
	                } else if (num == 2 && "ROLE_SELLER".equals(role.getRole())) {
	                    mv.setViewName("/shop/seller");
	                } else if (num == 3 && "ROLE_USER".equals(role.getRole())) {
	                    mv.setViewName("/shop");
	                } else {
	                    mv.setViewName("index");
	                }
	            }
	        } else {
	            // 로그인 실패
	            mv.addObject("loginResult", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        }
	    } catch (Exception e) {
	        // 로그인 오류
	        mv.addObject("loginResult", "로그인 중 오류가 발생했습니다.");
	    }
	    mv.addObject("num", num);
	    return mv;
	}


	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		session.invalidate();
	 
		return "index";
	}
}