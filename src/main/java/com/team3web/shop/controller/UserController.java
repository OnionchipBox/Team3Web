package com.team3web.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3web.shop.api.KakaoLoginBO;
import com.team3web.shop.api.NaverLoginBO;
import com.team3web.shop.mapper.UserMapper;
import com.team3web.shop.service.UserService;
import com.team3web.shop.vo.UserVO;

@Controller
public class UserController {
	
	private NaverLoginBO naverLoginBO;
	private KakaoLoginBO kakaoLoginBO;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService service;
	
	@Autowired
	UserMapper mapper;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
		this.kakaoLoginBO = kakaoLoginBO;
	}

	@Autowired
	private LoginController loginController;

	@RequestMapping(value = "/choiceRegister", method = RequestMethod.GET)
	public String choiceRegister(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);

		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		model.addAttribute("kakaoUrl", kakaoAuthUrl);
		return "/user/choiceRegister";
	}



	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model, HttpSession session) {
		return "/user/register";
	}

	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String joinRegister(@Valid @ModelAttribute("userValid") UserVO userVO, Model model, BindingResult result, RedirectAttributes ra) {

		if (result.hasErrors()) {
			logger.info("error!!!!!");
			logger.error("form error redirect page!");

			// 날짜 관련 오류
			logger.error("날짜 : " + result.getFieldValue("birthday"));
			logger.error("날짜 오류 : " + result.getFieldErrors("birthday"));

			// 생일 필드 에러 메시지
			if (result.hasFieldErrors("birthday")) {

				logger.error("생일 정보 에러 있음 !!");

				List<FieldError> birthdayErrList = result.getFieldErrors("birthday");

				logger.error("생일 필드 기정(default) 오류값 : "
						+ birthdayErrList.get(birthdayErrList.size() - 1).getDefaultMessage());

				String msg = birthdayErrList.get(birthdayErrList.size() - 1).getDefaultMessage();

				if (msg.trim().equals("반드시 값이 있어야 합니다.")) {
					ra.addFlashAttribute("birthday_error",
							birthdayErrList.get(birthdayErrList.size() - 1).getDefaultMessage());
				} else {
					ra.addFlashAttribute("birthday_error", "잘못된 생년월일 형식입니다. 다시 입력하십시오");
				}

			} // 생일 점검 끝

			// 오류값 객체 전송
			ra.addFlashAttribute("org.springframework.validation.BindingResult.userValid", result);

			// VO 입력값 전송
			ra.addFlashAttribute("userValid", userVO);

			return "/user/register";
		} // 오류점검

		UserVO user = new UserVO(userVO);

		model.addAttribute("msg", "회원가입을 축하합니다!");
		logger.info(user.toString());

		service.insertUser(user);

		return "/user/login";
	}

	@RequestMapping(value = "/registerInput", method = RequestMethod.GET)
	public String registerInput(@RequestParam("id") String id, 
			@RequestParam("password") String pw,
			@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("nickname") String nickname,
			@RequestParam("birthday") String birthday,
			@RequestParam("gender") String gender,
			Model model, HttpSession session) {
		String naverNickname = (String) session.getAttribute("naverNickname");
		String naverName = (String) session.getAttribute("naverName");
		String naverEmail = (String) session.getAttribute("naverEmail");
		String kakaoNickname = (String) session.getAttribute("kakaoNickname");
		String kakaoGender = (String) session.getAttribute("kakaoGender");
		String kakaoBirthday = (String) session.getAttribute("kakaoBirthday");
		String kakaoEmail = (String) session.getAttribute("kakaoEmail");

		if (naverName != null || kakaoNickname != null) {
			model.addAttribute("nickname", (naverNickname != null) ? naverNickname : kakaoNickname);
			model.addAttribute("email", (naverEmail != null) ? naverEmail : kakaoEmail);
			model.addAttribute("name", naverName);
			model.addAttribute("gender", kakaoGender);
			model.addAttribute("birthday", kakaoBirthday);
		}

		return "/user/register";
	}

	@RequestMapping(value = "/naver/user/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String userNaverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		return loginController.naverCallback(model, code, state, session);
	}

	@RequestMapping(value = "/kakao/user/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String userKakaoCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		return loginController.kakaoCallback(model, code, state, session);
	}
	
	
	//11/06 추가 
	@RequestMapping(value ="/myPage",method= {RequestMethod.GET, RequestMethod.POST})
	public String myPage(Model model) throws Exception{
		
		 // 현재 사용자 아이디
        String username = "user";
        
        // getUserPoint 메서드를 사용하여 포인트 가져오기
        Integer point = mapper.getUserPoint(username);
        
        // 포인트를 모델에 추가
        if (point != null) {
            model.addAttribute("point", point);
        } else {
            model.addAttribute("point", 0); // null인 경우 기본값을 설정
        }
		
		return "/user/myPage/myPage";
	}
	
	
	@RequestMapping(value="/notice", method = RequestMethod.GET)
	public String notice01() throws Exception{
		return "/notice/notice";
	}
	@RequestMapping(value = "/inspection", method = RequestMethod.GET)
	public String notice02() {
	    return "/notice/inspection";
	}
	@RequestMapping(value = "/FAQ", method = RequestMethod.GET)
	public String notice03() {
	    return "/notice/FAQ";
	}
	
	
	@RequestMapping(value = "/TermsOfService", method = RequestMethod.GET)
	   public String TermsOfService(Model model, HttpSession session) {
	      return "/TermsOfService";
	   }
	   @RequestMapping(value = "/introduce", method = RequestMethod.GET)
	   public String introduce(Model model, HttpSession session) {
	      return "/introduce";
	   }
	   @RequestMapping(value = "/Inspection", method = RequestMethod.GET)
	   public String Inspection(Model model, HttpSession session) {
	      return "/Inspection";
	   }
	   @RequestMapping(value = "/PrivacyPolicy", method = RequestMethod.GET)
	   public String PrivacyPolicy(Model model, HttpSession session) {
	      return "/PrivacyPolicy";
	   }
	

}