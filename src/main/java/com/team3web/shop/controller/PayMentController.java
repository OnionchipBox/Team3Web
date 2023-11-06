package com.team3web.shop.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayMentController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayMentController.class);
	
	@RequestMapping("/kakaopay")
	 public String kakao(HttpSession session) throws Exception {
        logger.info("\n=============>logger");
        return "/payment/pay_test";
    }
	
	
}