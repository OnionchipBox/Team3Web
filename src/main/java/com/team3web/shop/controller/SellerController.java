package com.team3web.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.team3web.shop.vo.ProductVO;
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
		
	    String id = (String) session.getAttribute("loggedInUserId");

	    SellerVO existingSeller = sellerService.checkSellerId(id);
	    
	    if (existingSeller != null) {
	    	out.println("<script>");
            out.println("alert('이미 등록된 사용자 입니다');");
            out.println("</script>");
            out.flush();
	        return "redirect:/";
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
	 
	 @RequestMapping(value = "/seller/sellerProductList", method = RequestMethod.GET)
	 public String getSellerProductList(Model model, 
		        @RequestParam(value = "page", defaultValue = "1") int page,
		        @RequestParam(value = "search", required = false) String search, HttpSession session) {
		 
		 	int pageSize = 10;
		 
		 	String code = (String) session.getAttribute("loggedInUserId");
			int sellerCode = sellerService.checkSellerCode(code).getSellerCode();
			session.setAttribute("sellerCode", sellerCode);

		    List<ProductVO> productList;
		    int totalProducts;

		    if (search != null && !search.isEmpty()) {
		        productList = sellerService.SellerGetProductsByPage(search, page, pageSize);
		        totalProducts = sellerService.SellerGetTotalSearchedProducts(search);
		    } else {
		        Map<String, Object> map = new HashMap<>();
		        map.put("start", (page - 1) * pageSize + 1);
		        map.put("end", page * pageSize);

		        productList = sellerService.SellerGetSearchedProductsByPage(map);
		        totalProducts = sellerService.SellerGetTotalProducts(map);
		    }

		    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
		    model.addAttribute("productList", productList);
		    model.addAttribute("totalPages", totalPages);
		    model.addAttribute("currentPage", page);
		    model.addAttribute("search", search);
		 
		 return "/seller/sellerProductList";
	 }
	 
	 @RequestMapping(value = "/sellerProductDelete", method = RequestMethod.POST)
	 public String postSellerProductList(@RequestParam("productId") int productId,
				HttpSession session, RedirectAttributes redirectAttributes) {

			try {
				ProductVO productVO = new ProductVO();
				productVO.setProductId(productId);

				sellerService.DeleteProduct(productVO);

				redirectAttributes.addFlashAttribute("DeleteSuccessMessage", "삭제 처리 되었습니다");
				return "redirect:/seller/sellerProductList";

			} catch (Exception e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("errorMessage", "처리 중 오류발생");
				return "/error";
			}
	 }
}
