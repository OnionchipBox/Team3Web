package com.team3web.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(value = "/choiceRegister", method = RequestMethod.GET)
	public String choiceRegister(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);

		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		model.addAttribute("kakaoUrl", kakaoAuthUrl);
		return "/user/choiceRegister";
	}



	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		model.addAttribute("userVO", new UserVO());
		return "/user/register";
	}

	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String joinRegister(@ModelAttribute("userVO") @Valid UserVO userVO, 
			Model model, RedirectAttributes redirectAttributes,  BindingResult bindingResult) {
			
		if (bindingResult.hasErrors()) {

            Map<String, String> validatorResult = validateHandling(bindingResult);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
                model.addAttribute("userVO", userVO);
            }
            return "/user/register"; 
        }

		UserVO user = new UserVO(userVO);

		service.insertUser(user);
		
		redirectAttributes.addFlashAttribute("successMessage", "MessageOK");

		return "redirect:/user/login";
	}
	// 회원가입 시 유효성 체크 
    public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();
 
        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }
        return validatorResult;
    }
    
  //11/06 추가 
  	@RequestMapping(value ="/myPage",method= {RequestMethod.GET, RequestMethod.POST})
  	public String myPage(Model model) throws Exception{
  		
  		 // 현재 사용자 아이디 (예: "currentUser")
          String username = "user";
          
          // getUserPoint 메서드를 사용하여 포인트 가져오기
          Integer userPoint = mapper.getUserPoint(username);
          
          // 포인트를 모델에 추가
          if (userPoint != null) {
              model.addAttribute("userPoint", userPoint);
          } else {
              model.addAttribute("userPoint", 0); // null인 경우 기본값을 설정
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

}