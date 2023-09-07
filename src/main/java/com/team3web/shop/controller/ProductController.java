package com.team3web.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 제품 관련 컨트롤러
@Controller
public class ProductController {
	 
	   private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	   
	 //남성 카테고리
	   @RequestMapping(value = "/mens", method = RequestMethod.GET)
	
	 
	    public String getMens() throws Exception {
	        logger.info("get mens()");
	    return "/category/men/mens";    
	   }
	   //셔츠
	   @RequestMapping(value = "/mens/shirts" ,method = RequestMethod.GET)
	   public String getShirts() throws Exception{
		   logger.info("get shirts");
		   return "/category/men/shirts";
		   
	   }
	   //바지
	   @RequestMapping(value ="/mens/pants", method = RequestMethod.GET)
	   public String getPants() throws Exception{
		   logger.info("get pants");
		   
		   return "/category/men/pants";
	   }
	   
	   @RequestMapping(value = "/womens", method = RequestMethod.GET)
	   public String getWomens() throws Exception{
		   logger.info("get women");
		   return "/category/women/womens";
	   }
	   
	   @RequestMapping(value = "/womens/dresses", method = RequestMethod.GET)
	   public String getDress() throws Exception{
		   logger.info("get dress");
		   return "/category/women/dresses";
	   }
	   
	   @RequestMapping(value = "/womens/skirts", method = RequestMethod.GET)
	   public String getSkirts() throws Exception{
		   logger.info("get skirts");
		   return "/category/women/skirts";
	   }
}
