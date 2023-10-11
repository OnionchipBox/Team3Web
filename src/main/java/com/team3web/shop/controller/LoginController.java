package com.team3web.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.team3web.shop.api.KakaoLoginBO;
import com.team3web.shop.api.NaverLoginBO;
import com.team3web.shop.dao.LoginDAO;
import com.team3web.shop.service.CustomUserDetails;
import com.team3web.shop.service.LoginService;
import com.team3web.shop.service.UserService;
import com.team3web.shop.vo.UserVO;


@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private NaverLoginBO naverLoginBO;
	private KakaoLoginBO kakaoLoginBO;
	
	@Inject
	LoginService loginService;
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
		this.kakaoLoginBO = kakaoLoginBO;
	}

	@Autowired
	@Qualifier("AuthenticationManager")
	private AuthenticationManager authenticationManager;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
    private HttpServletRequest request;

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
	        Model model, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
	    try {  	
	    	Authentication authentication = new UsernamePasswordAuthenticationToken(id, password);
	    	
	        Authentication authenticatedUser = authenticationManager.authenticate(authentication);
	        SecurityContextHolder.getContext().setAuthentication(authenticatedUser); // 세션에 사용자정보 저장
	        Collection<? extends GrantedAuthority> authorities = authenticatedUser.getAuthorities();
	        CustomUserDetails customUserDetails = (CustomUserDetails) authenticatedUser.getPrincipal();

	        session.setAttribute("loggedInUserName", customUserDetails.getName());
	        session.setAttribute("loggedInUserNickName", customUserDetails.getNickName());
	        session.setAttribute("loggedInUserPhone", customUserDetails.getPhone());
	        
	        if (authorities.contains(new SimpleGrantedAuthority("ROLE_USER"))) {
	        	session.setAttribute("loggedInUserId", id);
	            session.setAttribute("loggedInUserRole", "ROLE_USER");
	            return "index";
	        } else if (authorities.contains(new SimpleGrantedAuthority("ROLE_SELLER"))) {
	        	session.setAttribute("loggedInUserId", id);
	            session.setAttribute("loggedInUserRole", "ROLE_SELLER");
	            return "index";
	        } else if (authorities.contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
	        	session.setAttribute("loggedInUserId", id);
	            session.setAttribute("loggedInUserRole", "ROLE_ADMIN");
	        	return "index";
	    	}else {
	            return "index";
	        }
	    } catch (AuthenticationException e) {
	        System.out.println("로그인 실패: " + e.getMessage());
	        e.printStackTrace(); 
	        out.println("<script> alert('아이디 또는 비밀번호가 일치하지 않습니다');</script>");
	        out.flush();
	        return "/user/login";
	    }
	}
	
	@RequestMapping(value = "/updateLogin", method = RequestMethod.GET)
    public String showUpdateLoginPage(HttpSession session, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
        	out.println("<script>");
	        out.println("alert('로그인 이후에 이용 가능하십니다');");
	        out.println("</script>");
	        out.flush();
            return "/user/login";
        }
        return "/user/updateLogin";
    }
	
	@RequestMapping(value = "/updateLogin", method = RequestMethod.POST)
    public String checkLogin(HttpSession session, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
        String password = request.getParameter("password");
        
        System.out.println("1차 체크");
        
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
        UserVO userVO = loginDAO.loadUserByUsername(loggedInUserId);

        String encodedPassword = userVO.getPassword();
        
        System.out.println("null 체크  -> \n" + encodedPassword + "\n" + password);

        if (!passwordEncoder.matches(password, encodedPassword)) {
	        out.println("<script> alert('비밀번호가 다릅니다!'); location.href='/user/updateLogin'; </script>");
	        out.flush();
            return "/user/updateLogin";
        }

        session = request.getSession();
        session.setAttribute("loggedInUserPassword", encodedPassword);

        return "/user/userUpdate";
    }

	@RequestMapping(value = "/userUpdate", method = RequestMethod.GET)
	public String showUpdateForm(Model model, HttpSession session, HttpServletResponse response) throws Exception {
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    String id = (String) session.getAttribute("loggedInUserId");
	    String password = (String) session.getAttribute("loggedInUserPassword");
	    logger.info("C: 회원정보보기 GET의 아이디 " + id);
	    logger.info("C: 회원정보보기 GET의 비밀번호 " + password);

	    if (id == null) {
	        out.println("<script>");
	        out.println("alert('다시 로그인 하세요!');");
	        out.println("</script>");
	        out.flush();
	    } else {
	        UserVO user = loginService.getUserById(id);
	        String pw = loginService.getPasswordById(password);
	        model.addAttribute("user", user);
	        model.addAttribute("pw", pw);
	        logger.info(" 회원정보보기 GET의 VO " + id);
	        logger.info("vo pw:" + pw);
	        return "/user/userUpdate";
	    }
	    return null;
	}

	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") UserVO user,
	                         @RequestParam(required = false) String password1,
	                         @RequestParam(required = false) String password2,
	                         @RequestParam(required = false) String name,
	                         @RequestParam(required = false) String nickname,
	                         @RequestParam(required = false) String zipcode,
	                         @RequestParam(required = false) String roadAddr1,
	                         @RequestParam(required = false) String roadAddr2,
	                         @RequestParam(required = false) String phone,
	                         @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
	                         HttpSession session, HttpServletResponse response) throws Exception {
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    try {
	        String userId = (String) session.getAttribute("loggedInUserId");
	        System.out.println("세션에 저장된 사용자 ID : "+ session.getAttribute("loggedInUserId") + "\n 인식Id : " + userId);

	        UserVO existingUser = loginService.getUserById(userId);
	        System.out.println("ID 체크 : " + existingUser);
	        
	        if (password1 != null && !password1.isEmpty() && password2 != null && !password2.isEmpty()) {
	            String newPassword = passwordEncoder.encode(password1);
	            String existingPassword = existingUser.getPassword();

	            if (!passwordEncoder.matches(password1, existingPassword)) {
	                if (password1.equals(password2)) {
	                    existingUser.setPassword(newPassword);
	                } else {
	                    out.println("<script>");
	                    out.println("alert('비밀번호가 일치하지 않습니다.');");
	                    out.println("</script>");
	                    out.flush();
	                    return "user/userUpdate";
	                }
	            } else {
	                out.println("<script>");
	                out.println("alert('기존 비밀번호와 다르게 작성하세요');");
	                out.println("</script>");
	                out.flush();
	                return "user/userUpdate";
	            }
	        }
	        if (name != null && !name.isEmpty()) {
	            existingUser.setName(name);
	        }
	        if (nickname != null && !nickname.isEmpty()) {
	            existingUser.setNickname(nickname);
	        }
	        if (zipcode != null && !zipcode.isEmpty()) {
	            existingUser.setZipcode(zipcode);
	        }
	        if (roadAddr1 != null && !roadAddr1.isEmpty() && roadAddr2 != null && !roadAddr2.isEmpty()) {
	            String fullAddress = roadAddr1 + "*" + roadAddr2;
	            existingUser.setAddress(fullAddress);
	        }
	        if (phone != null && !phone.isEmpty()) {
	            existingUser.setPhone(phone);
	        }
	        if (birthday != null) {
	            existingUser.setBirthday(birthday);
	        }

	        userService.updateUser(existingUser);
	        
	        session.setAttribute("loggedInUserNickName", existingUser.getNickname());
	        session.setAttribute("loggedInUserPhone", existingUser.getPhone());

	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
	        userDetails.setNickName(nickname);
	        userDetails.setPhone(phone);

	        out.println("<script>");
	        out.println("alert('회원정보가 수정되었습니다');");
	        out.println("</script>");
	        out.flush();
	        return "index";
	    } catch (Exception e) {
	        System.out.println("회원정보 수정실패" + e);
	        out.println("<script>");
	        out.println("alert('회원정보 수정실패');");
	        out.println("</script>");
	        out.flush();
	        return "user/userUpdate";
	    }
	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		session.invalidate();
	 
		return "index";
	}
	
	@RequestMapping(value = "/selectId", method = RequestMethod.GET)
	public String selectIdJoin(HttpServletRequest request, Model model, UserVO searchVO) {
		return "user/selectId";
	}
	
	@RequestMapping(value = "/selectPassword", method = RequestMethod.GET)
	public String selectPwJoin(HttpServletRequest request, Model model, UserVO searchVO) {
		return "user/selectPassword";
	}
	
	@RequestMapping(value = "/selectId", method = RequestMethod.POST)
	public String selectId(HttpServletRequest request, Model model, UserVO searchVO,
            @RequestParam String name,
            @RequestParam String phone, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
		try {
			HashMap<String, Object> idMap = new HashMap<String, Object>();
			idMap.put("name", name);
			idMap.put("phone", phone);

			String userId = userService.findUserId(idMap);

	        
	        if (userId != null) {
	        	out.println("<script>");
		        out.println("alert(userId);");
		        out.println("</script>");
		        out.flush();
	        } else {
	        	out.println("<script>");
		        out.println("alert('존재하지 않는 아이디입니다');");
		        out.println("</script>");
		        out.flush();
	        }
	        
	        return "user/selectId";
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "오류가 발생했습니다.");
	        return "user/selectId";
	    }
	}
	
	@RequestMapping(value = "/selectPassword", method = RequestMethod.POST)
	public String selectPw(HttpServletRequest request, Model model, UserVO searchVO,
			@RequestParam String id,
            @RequestParam String name,
            @RequestParam String phone, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
		try {
			HashMap<String, Object> pwMap = new HashMap<String, Object>();
			pwMap.put("id", id);
			pwMap.put("name", name);
			pwMap.put("phone", phone);

			String newPassword = userService.findPassword(pwMap);
	        
	        if (newPassword != null) {
	            model.addAttribute("foundPassword", newPassword);
	        } else {
	        	out.println("<script>");
		        out.println("alert('비밀번호를 찾을 수 없습니다');");
		        out.println("</script>");
		        out.flush();
	        }
	        
	        return "user/selectPassword";
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "오류가 발생했습니다.");
	        return "user/selectPassword";
	    }
	}
}