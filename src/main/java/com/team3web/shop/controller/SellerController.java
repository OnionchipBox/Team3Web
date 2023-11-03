package com.team3web.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3web.shop.service.SellerService;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Controller
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@RequestMapping(value = "/seller/registration", method = RequestMethod.GET)
	public String sellerRegistration(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
	    String username = (String) session.getAttribute("loggedInUserId");

	    SellerVO existingSeller = sellerService.checkSellerId(username);
	    
	    if (existingSeller != null) {
	    	out.println("<script>");
            out.println("alert('이미 등록된 사용자 입니다');");
            out.println("</script>");
            out.flush();
	        return "index";
	    }
	    return "/seller/registration";
	}

	    
	 @RequestMapping(value = "/registration", method = RequestMethod.POST)
	    public String PostRegistration(
	        @RequestParam("sellerId") String sellerId,
	        @RequestParam("sellerName") String sellerName,
	        RedirectAttributes redirectAttributes,
	        Model model, HttpSession session) {

	        try {
	            String id = (String) session.getAttribute("loggedInUserId");
	            UserVO user = new UserVO();
	            user.setUsername(id);

	            if (id != null) {
	                sellerService.updateSellerVerify(user);
	                SellerVO seller = new SellerVO();
	                seller.setUsername(id);
	                seller.setSellerName(sellerName);
	                seller.setSellerRegistrationNumber(sellerId);
	                sellerService.insertSeller(seller);
	                session.setAttribute("loggedInUserRole", "ROLE_SELLER");
	                
	                redirectAttributes.addFlashAttribute("successMessage", "MessageOK");
	                return "redirect:/";
	            } else {
	                System.out.println("id가 null입니다.");
	            }

	            return "redirect:/";
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("null 에러 발생");
	            return "/seller/registration";
	        }
	    }

	 
	 @RequestMapping(value = "/seller/addProductForm", method = RequestMethod.GET)
	 public String getAddProductForm() {
		 
		 return "/seller/addProductForm";
	 }

	
}
