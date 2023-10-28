package com.team3web.shop.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



// 주문 관련 컨트롤러
@Controller
public class OrderController {
	
	 private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	 
	  @RequestMapping(value = "/user/cart", method = RequestMethod.GET)
	    public String getCart(HttpSession session) throws Exception {
	        logger.info("get cart");
	        return "/user/cart";
	    }

}
