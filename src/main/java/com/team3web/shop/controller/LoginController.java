package com.team3web.shop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.team3web.shop.service.UserService;
import com.team3web.shop.vo.UserVO;


@Controller
public class LoginController {
	
	
	
	
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    UserService userservice;
	private NaverLoginBO naverLoginBO;
	private KakaoLoginBO kakaoLoginBO;
	
	
	
//	@Autowired
//	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
//		this.naverLoginBO = naverLoginBO;
//	}
//	
//	@Autowired
//	private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
//		this.kakaoLoginBO = kakaoLoginBO;
//	}
//	
//	@RequestMapping(value = "/login" , method = { RequestMethod.GET, RequestMethod.POST })
//    public String login(Model model, HttpSession session) {
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		System.out.println("네이버: " + naverAuthUrl);
//		model.addAttribute("naverUrl", naverAuthUrl);
//		
//	    String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
//	    System.out.println("카카오: " + kakaoAuthUrl);
//	    model.addAttribute("kakaoUrl", kakaoAuthUrl);
//	    
//		return "/user/login";
//	}
	
	@RequestMapping(value = "/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("Naver callback 泥댄겕");
	    
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
	    	System.out.println("�꽕�씠踰� 濡쒓렇�씤 泥섎━以� AccessToken �쉷�뱷 �떎�뙣");
	    }
	    
	    return "login";
	}
	
	@RequestMapping(value = "/kakao/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	    System.out.println("Kakao callback 泥댄겕");
	    
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
	    	System.out.println("移댁뭅�삤 濡쒓렇�씤 泥섎━以� AccessToken �쉷�뱷 �떎�뙣");
	    }
	    
	    return "login";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)	
	public String loginCheck(@RequestParam String id, @RequestParam String pw) {
		return "index";
	}
	
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		session.invalidate();
	 
		return "index";
	}
	// webPageLogin 
	
	  // 로그인 get
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getSignin() throws Exception {
        logger.info("get signin");
        return "/user/login";
    }

	
    // 로그인 post
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String postSignin(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        UserVO login = userservice.signin(vo);

        HttpSession session = req.getSession();
        if (login != null && vo.getPw().equals(login.getPw())) {
            session.setAttribute("user", login);
            return "redirect:/";
        } else {
            session.setAttribute("user", null);
            rttr.addFlashAttribute("msg", false);
            return "redirect:/login";
        }
    }
}
