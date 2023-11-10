package com.team3web.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.team3web.shop.api.KakaoLoginBO;
import com.team3web.shop.api.NaverLoginBO;
import com.team3web.shop.dao.LoginDAO;
import com.team3web.shop.interceptor.LoginInterceptor;
import com.team3web.shop.service.CustomUserDetails;
import com.team3web.shop.service.LoginService;
import com.team3web.shop.service.UserService;
import com.team3web.shop.vo.UserVO;


@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private KakaoLoginBO kakaoLoginBO;
	
	@Inject
	LoginService loginService;
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Autowired
	private UserService userService;

	@Autowired
	@Qualifier("AuthenticationManager")
	private AuthenticationManager authenticationManager;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
    private HttpServletRequest request;
	
	@Autowired
	private LoginInterceptor login;
	
	// 10/18 작성 끝
	@RequestMapping(value = "/login" , method = RequestMethod.GET)
    public String login(Model model, HttpSession session, HttpServletResponse response) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버: " + naverAuthUrl);
		model.addAttribute("naverUrl", naverAuthUrl);
		
	    String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
	    System.out.println("카카오: " + kakaoAuthUrl);
	    model.addAttribute("kakaoUrl", kakaoAuthUrl);
	  
		return "/user/login";
	}
	// 10/19 작성 끝
	@RequestMapping(value = "/login/naver", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(Model model, @RequestParam String code, 
			@RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("Naver callback");
	    System.out.println("null값 체크 \n code :  "+code+"\n state : "+state+"\n 세션 : "+session);
	    
	    OAuth2AccessToken oauthToken;
	    oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    System.out.println("null값 2차 체크(oauth토큰) : "+oauthToken+"\t"+apiResult);
	    
	    if (oauthToken != null) {
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(apiResult);
	        JSONObject jsonObj = (JSONObject) obj;
	        
	        JSONObject response_obj = (JSONObject) jsonObj.get("response");
	        String email = (String) response_obj.get("email");
	        String nickname = (String) response_obj.get("nickname");
	        String gender = (String) response_obj.get("gender");
	        String name = (String) response_obj.get("name");
	        String phone = (String) response_obj.get("mobile");
	        Date birthday = (Date) response_obj.get("birthday");
	        
	        phone = phone.replaceAll("-", "");
	        
	        UserVO user = new UserVO();
	        
	        user.setUsername(email);
	        user.setName(name);
	        user.setNickname(nickname);
	        if ("M".equals(gender)) {
	            user.setGender("남자");
	        } else if ("F".equals(gender)) {
	            user.setGender("여자");
	        }
	        user.setPhone(phone);
	        user.setBirthday(birthday);
	        
	        model.addAttribute("user", user);
	        return "/user/login";
	    }
	        return "/user/registerInput";
	}
	// 10/18 작성 끝
	@RequestMapping(value = "/user/registerInput", method = RequestMethod.GET)
	public String ApiRegister(HttpSession session, Model model, UserVO user) {
		
		return "user/registerInput";
	}
	// 10/19 작성 끝
	@RequestMapping(value = "/login/kakao", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoCallback(Model model, @RequestParam String code,
			@RequestParam String state, HttpSession session) throws IOException, ParseException {
	    System.out.println("Kakao callback");
	    
	    OAuth2AccessToken oauthToken;
	    oauthToken = kakaoLoginBO.getAccessToken(session, code, state);

	        String apiResult = kakaoLoginBO.getUserProfile(oauthToken);
	        
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(apiResult);
	        JSONObject jsonObj = (JSONObject) obj;
	        JSONObject properties = (JSONObject) jsonObj.get("properties");
	        JSONObject kakao_account = (JSONObject) jsonObj.get("kakao_account");

	        String email = (String) kakao_account.get("email");
	        String nickname = (String) properties.get("nickname");
	        String gender = (String) kakao_account.get("gender");
	        
	        UserVO user = new UserVO();
	        
	        user.setUsername(email);
	        user.setNickname(nickname);
	        if ("male".equals(gender)) {
	            user.setGender("남자");
	        } else if ("female".equals(gender)) {
	            user.setGender("여자");
	        }
	        
	        model.addAttribute("user", user);
	    
	    return "/user/registerInput";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(
	    @RequestParam("username") String username,
	    @RequestParam("password") String password,
	    @RequestParam(value = "rememberMe", required = false) String rememberMe,
	    Model model, HttpSession session, HttpServletResponse response) throws IOException {

	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    try {
	    	System.out.println("Id : "+username+"\nPw: "+password);
	        // 사용자 인증
	        Authentication authentication = new UsernamePasswordAuthenticationToken(username, password);
	        Authentication authenticatedUser = authenticationManager.authenticate(authentication);
	        SecurityContextHolder.getContext().setAuthentication(authenticatedUser); // 세션에 사용자 정보 저장

	        // 사용자 정보 가져오기
	        CustomUserDetails customUserDetails = (CustomUserDetails) authenticatedUser.getPrincipal();

	        // 세션에 사용자 정보 저장
	        session.setAttribute("loggedInUserName", customUserDetails.getName());
	        session.setAttribute("loggedInUserNickName", customUserDetails.getNickName());
	        session.setAttribute("loggedInUserPhone", customUserDetails.getPhone());

	        // 권한에 따른 처리
	        Collection<? extends GrantedAuthority> authorities = authenticatedUser.getAuthorities();
	        if (authorities.contains(new SimpleGrantedAuthority("ROLE_USER"))) {
	            session.setAttribute("loggedInUserId", username);
	            session.setAttribute("loggedInUserRole", "ROLE_USER");
	        } else if (authorities.contains(new SimpleGrantedAuthority("ROLE_SELLER"))) {
	            session.setAttribute("loggedInUserId", username);
	            session.setAttribute("loggedInUserRole", "ROLE_SELLER");
	        } else if (authorities.contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
	            session.setAttribute("loggedInUserId", username);
	            session.setAttribute("loggedInUserRole", "ROLE_ADMIN");
	        }

	        // 자동 로그인 처리 (시큐리티로 자동 로그인 대체)
//	        if (rememberMe != null) {
//	            Map<String, Object> autoLoginInfo = loginService.findAutoLoginToken(id);
//	            if (autoLoginInfo != null) {
//	                String autoLoginToken = (String) autoLoginInfo.get("autoLoginToken");
//	                handleAutoLogin(autoLoginToken, response);
//	            }
//	        }

	        return "redirect:/";
	    } catch (AuthenticationException e) {
	        System.out.println("로그인 실패: " + e.getMessage());
	        e.printStackTrace();
	        out.println("<script> alert('아이디 또는 비밀번호가 일치하지 않습니다');</script>");
	        out.flush();
	        return "/user/login";
	    }
	}
	
	// 자동 로그인 (시큐리티로 자동 로그인 대체)
//	private void handleAutoLogin(String autoLoginToken, HttpServletResponse response) {
//	    String[] tokenParts = autoLoginToken.split(":");
//	    if (tokenParts.length == 2) {
//	        String id = tokenParts[0];
//	        String token = tokenParts[1];
//
//	        Map<String, Object> autoLoginInfo = loginService.findAutoLoginToken(id);
//	        if (autoLoginInfo != null) {
//	            Cookie autoLoginCookie = new Cookie("autoLogin", autoLoginToken);
//	            autoLoginCookie.setMaxAge(60 * 60 * 24);
//	            autoLoginCookie.setPath("/");
//	            response.addCookie(autoLoginCookie);
//	        }
//	    }
//	}
	
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

	@SuppressWarnings("unused")
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response,
			RedirectAttributes redirectAttributes) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    String userId = (String) session.getAttribute("loggedInUserId");
	    if (userId == null) {
	    	out.println("<script>");
	    	out.println("alert('이미 로그아웃된 사용자입니다');");
	    	out.println("</script>");
	    	out.flush();
	    	return "index";
	    } else if (userId != null) {
	    	SecurityContextHolder.clearContext();
	    	session.invalidate();
	    	redirectAttributes.addFlashAttribute("successMessage", "LogoutOK");
	    	return "redirect:index";
	    } else {
	    	redirectAttributes.addFlashAttribute("errorMessage", "ErrorMessage");
	        return "redirect:index";
	    }
	}
	
	@RequestMapping(value = "/selectId", method = RequestMethod.GET)
	public String selectIdJoin(HttpServletRequest request, Model model) {
		return "user/selectId";
	}
	
	@RequestMapping(value = "/selectPassword", method = RequestMethod.GET)
	public String selectPwJoin(HttpServletRequest request, Model model) {
		return "user/selectPassword";
	}
	
	@RequestMapping(value = "/selectId", method = RequestMethod.POST)
	public String selectId(Model model, @ModelAttribute UserVO user, 
			HttpServletResponse response) throws IOException {
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    String userId = userService.findUserId(user);

	    try {
	    	
	        if (userId == null) {
	        	model.addAttribute("check", 1);
	        } else {
	        	model.addAttribute("check", 0);
				model.addAttribute("id", userId);
	            return "user/selectId";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("<script>");
	        out.println("alert('에러 발생');");
	        out.println("</script>");
	        out.flush();
	        return "user/selectId";
	    }
	    return "user/selectId";
	}
	
	@RequestMapping(value = "/selectPassword", method = RequestMethod.POST)
	public String selectPw(Model model, @ModelAttribute UserVO user, @RequestParam("id") String id,
			HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    String userPw = userService.findPassword(user);
		
		try {
 
	        if (userPw == null) {
	        	model.addAttribute("check", 1);
	        } else {
	        	model.addAttribute("check", 0);
	        	session.setAttribute("temporaryUser", id);
	        	return "user/updatePw";
	        }
	        
	        return "user/selectPassword";
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("<script>");
	        out.println("alert('에러 발생');");
	        out.println("</script>");
	        out.flush();
	        return "user/selectPassword";
	    }
	}
	
	@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
	public String updatePw(Model model, @ModelAttribute UserVO user, @RequestParam("password") String pw,
			HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    String id = (String) session.getAttribute("temporaryUser");

		try {
			 
	        if (pw == null) {
	        	out.println("<script>");
		        out.println("alert('비밀번호를 입력하세요');");
		        out.println("</script>");
		        out.flush();
	        }else if (id == null) {
	        	out.println("<script>");
		        out.println("alert('다시 입력하세요');");
		        out.println("</script>");
		        out.flush();
		        return "user/selectPassword";
	        } else {
	        	user.setUsername(id);
	        	user.setPassword(pw);
	        	loginService.updatePw(user);
	        	out.println("<script>");
		        out.println("alert('비밀번호가 변경되었습니다');");
		        out.println("</script>");
		        out.flush();
	        	return "user/login";
	        }
	        
	        return "user/selectPassword";
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("<script>");
	        out.println("alert('에러 발생');");
	        out.println("</script>");
	        out.flush();
	        return "user/selectPassword";
	    }
	}
}