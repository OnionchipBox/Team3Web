package com.team3web.shop.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.team3web.shop.api.KakaoLoginBO;
import com.team3web.shop.api.NaverLoginBO;
import com.team3web.shop.service.LoginService;
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
	
	@RequestMapping(value = "/login" , method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(
	        @RequestParam("id") String id,
	        @RequestParam("password") String password,
	        HttpSession session,
	        Model model,
	        RedirectAttributes redirectAttributes) {

	    UserVO userVO = new UserVO();
	    userVO.setId(id);
	    userVO.setPassword(password);

	    int loginResult = loginService.loginCheck(userVO, session);

	    if (loginResult == 1) {
	        int role = loginService.getUserRole(id);
	        String name = loginService.getUserName(id);
	        session.setAttribute("loggedInUserName", name);
	        System.out.println("로그인 성공 "+name);
	        if (role == 0 || role == 1) {
	            return "index";
	        } else if (role == 2) {
	            return "/shop/admin";
	        } else {
	            return "index";
	        }
	    } else {
	        model.addAttribute("loginResult", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        System.out.println("로그인 실패");
	        return "/user/login";
	    }
	}


	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		session.removeAttribute("loggedInUserName");
		session.invalidate();
	 
		return "index";
	}
}