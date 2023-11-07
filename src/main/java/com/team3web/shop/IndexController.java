package com.team3web.shop;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team3web.shop.controller.PayMentController;
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

        // 제품 정보를 JSP 파일로 전달
        model.addAttribute("products", products);

       
        // 제품 목록을 표시할 JSP 파일 이름 반환
        return "index"; // product.jsp 파일을 참조
    }
    
       
}
 
