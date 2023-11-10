package com.team3web.shop;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team3web.shop.service.ProductService;
import com.team3web.shop.vo.ProductVO;

@Controller
@RequestMapping("/")
public class IndexController {
    
   
   @Autowired
   ProductService productService;
   
   
   @RequestMapping(method = RequestMethod.GET)
   public String index(Locale locale, Model model) {
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       String name = authentication.getName(); // 현재 인증된 사용자의 이름

       model.addAttribute("name", name);
       
       // 데이터베이스에서 제품 정보를 조회
       List<ProductVO> products = productService.getAllProudct();
       List<ProductVO> products1=productService.getProductsByCategoryId(1);
       // 제품 정보를 JSP 파일로 전달
       List<ProductVO> products3=productService.getProductsByCategoryId(3);
       model.addAttribute("products", products);
       model.addAttribute("products1",products1);
       model.addAttribute("products3",products3);

       return "index";
   }

    
    @RequestMapping("/shopmap")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("shopmap");
        return mv;
    }

   
       
    }
 
 