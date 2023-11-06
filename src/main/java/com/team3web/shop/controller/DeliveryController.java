package com.team3web.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DeliveryController {

	private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);

	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery() throws Exception {
		logger.info("배송정보조회");
		return "/delivery/delivery";    

	}

}