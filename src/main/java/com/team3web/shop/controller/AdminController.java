package com.team3web.shop.controller;
// 관리자 관련 컨트롤러

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3web.shop.dao.AdminDAO;
import com.team3web.shop.service.AdminService;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminDAO adminDAO;
	// 10/6 작성 끝
	@RequestMapping(value = "/admin/userList", method = RequestMethod.GET)
	public String getUserList(Model model, 
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "search", required = false) String search) {
		
	    int pageSize = 10;

	    List<UserVO> userList;
	    int totalUsers;

	    if (search != null && !search.isEmpty()) {
	        userList = adminService.getUsersByPage(search, page, pageSize);
	        totalUsers = adminService.getTotalSearchedUsers(search);
	    } else {
	        Map<String, Object> map = new HashMap<>();
	        map.put("start", (page - 1) * pageSize + 1);
	        map.put("end", page * pageSize);

	        userList = adminService.getSearchedUsersByPage(map);
	        totalUsers = adminService.getTotalUsers(map);
	    }

	    int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
	    model.addAttribute("userList", userList);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("search", search);

	    return "admin/userList";
	}
	// 10/6 작성 끝
	@RequestMapping(value = "/admin/sellerList", method = RequestMethod.GET)
	public String getSellerList(Model model, 
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "search", required = false) String search) {
		
	    int pageSize = 10;

	    List<SellerVO> sellerList;
	    int totalSeller;

	    if (search != null && !search.isEmpty()) {
	    	sellerList = adminService.getSellerByPage(search, page, pageSize);
	        totalSeller = adminService.getTotalSearchedSeller(search);
	    } else {
	        Map<String, Object> map = new HashMap<>();
	        map.put("start", (page - 1) * pageSize + 1);
	        map.put("end", page * pageSize);

	        sellerList = adminService.getSearchedSellerByPage(map);
	        totalSeller = adminService.getTotalSeller(map);
	    }

	    int totalPages = (int) Math.ceil((double) totalSeller / pageSize);
	    model.addAttribute("sellerList", sellerList);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("search", search);

	    return "admin/sellerList";
	}
	// 10/6 작성 끝
	@RequestMapping(value = "/admin/productList", method = RequestMethod.GET)
	public String getProductList(Model model, 
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "search", required = false) String search) {
		
	    int pageSize = 10;

	    List<ProductVO> productList;
	    int totalProducts;

	    if (search != null && !search.isEmpty()) {
	        productList = adminService.getProductsByPage(search, page, pageSize);
	        totalProducts = adminService.getTotalSearchedProducts(search);
	    } else {
	        Map<String, Object> map = new HashMap<>();
	        map.put("start", (page - 1) * pageSize + 1);
	        map.put("end", page * pageSize);

	        productList = adminService.getSearchedProductsByPage(map);
	        totalProducts = adminService.getTotalProducts(map);
	    }

	    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
	    model.addAttribute("productList", productList);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("search", search);

	    return "admin/productList";
	}
	// 10/17 작성 끝
	@RequestMapping(value = "/userVerify", method = RequestMethod.POST)
	public String PostUserList(@RequestParam("userId") String userId, 
			@RequestParam("userVerify") String userVerify, 
			HttpSession session, RedirectAttributes redirectAttributes) {
		
		 String loggedInUserId = (String) session.getAttribute("loggedInUserId");
		 
		    if (loggedInUserId != null && userId != null) {
		        try {
		            UserVO userVO = new UserVO();
		            userVO.setUsername(userId);
		            if ("SELLER".equals(userVerify)) {
		                redirectAttributes.addFlashAttribute("errorMessage", "ErrorMessage");
		                return "redirect:/admin/userList";
		            }
		            userVO.setVerify(userVerify);

		            adminDAO.updateUserVerify(userVO);
		            adminDAO.forceDeleteSeller(userId);
		            
		            redirectAttributes.addFlashAttribute("successMessage", "VerifyMessageOK");
		            return "redirect:/admin/userList";
		        } catch (Exception e) {
		            e.printStackTrace();
		            redirectAttributes.addFlashAttribute("errorMessage", "변경 중 오류발생");
		            return "/error";
		        }
		    } else {
		    	redirectAttributes.addFlashAttribute("errorMessage", "권한이 없습니다");
	            return "index";
		    }
	}
	// 10/13 작성 끝
	@RequestMapping(value = "/sellerDelete", method = RequestMethod.POST)
	public String sellerDelete(@RequestParam("sellerId") String userId, 
			@RequestParam("userVerify") String userVerify, 
			HttpSession session, RedirectAttributes redirectAttributes) {
		
		 String loggedInUserId = (String) session.getAttribute("loggedInUserId");
		 
		    if (loggedInUserId != null && userId != null) {
		        try {
		            UserVO userVO = new UserVO();
		            userVO.setUsername(userId);
		            userVO.setVerify(userVerify);

		            adminDAO.updateUserVerify(userVO);
		            adminDAO.forceDeleteSeller(userId);
		            
		            redirectAttributes.addFlashAttribute("successMessage", "MessageOK");
		            return "redirect:/admin/sellerList";
		        } catch (Exception e) {
		            e.printStackTrace();
		            redirectAttributes.addFlashAttribute("errorMessage", "변경 중 오류발생");
		            return "/error";
		        }
		    } else {
		    	redirectAttributes.addFlashAttribute("errorMessage", "권한이 없습니다");
	            return "index";
		    }
	}
	// 10/16 작성 끝
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String ForceUserDelete(@RequestParam("userId") String userId,
			HttpSession session, RedirectAttributes redirectAttributes) {
		
		 String loggedInUserId = (String) session.getAttribute("loggedInUserId");
		 
		 if (loggedInUserId != null && userId != null) {
		        try {
		            UserVO userVO = new UserVO();
		            userVO.setUsername(userId);
		            
		            adminDAO.forceDeleteUser(userId);
		            adminDAO.forceDeleteSeller(userId);

		            redirectAttributes.addFlashAttribute("DeleteSuccessMessage", "탈퇴 처리 되었습니다");
		            return "redirect:/admin/userList";
		        } catch (Exception e) {
		            e.printStackTrace();
		            redirectAttributes.addFlashAttribute("errorMessage", "처리 중 오류발생");
		            return "/error";
		        }
		    } else {
		    	redirectAttributes.addFlashAttribute("errorMessage", "권한이 없습니다");
	            return "index";
		    }
	}
	// 10/16 작성 끝
	@RequestMapping(value = "/productDelete", method = RequestMethod.POST)
	public String PostProductList(@RequestParam("productId") int productId,
			@RequestParam("sellerCode") int sellerCode,
			HttpSession session, RedirectAttributes redirectAttributes) {
		
		String loggedInUserId = (String) session.getAttribute("loggedInUserId");
		 
		 if (loggedInUserId != null) {
		        try {
		        	ProductVO productVO = new ProductVO();
			        productVO.setProductId(productId);
			            
			        adminDAO.forceDeleteProduct(productVO);

			        redirectAttributes.addFlashAttribute("DeleteSuccessMessage", "삭제 처리 되었습니다");
			        return "redirect:/admin/productList";
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            redirectAttributes.addFlashAttribute("errorMessage", "처리 중 오류발생");
		            return "/error";
		        }
		    } else {
		    	redirectAttributes.addFlashAttribute("errorMessage", "권한이 없습니다");
	            return "index";
		    }
	}
	// 10/17 작성 끝
	@RequestMapping(value = "/productDeleteAll", method = RequestMethod.POST)
	public String PostProductAll(@RequestParam("sellerCode") int sellerCode,
			HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("실행 확인");
		String loggedInUserId = (String) session.getAttribute("loggedInUserId");
		 
		 if (loggedInUserId != null) {
		        try {
		        	ProductVO productVO = new ProductVO();
		        	productVO.setSellerCode(sellerCode);
			        adminDAO.DeleteProductAll(productVO);

			        redirectAttributes.addFlashAttribute("DeleteSuccessMessage", "0번값 제품 전체가 삭제 처리 되었습니다");
			        return "redirect:/admin/productList";
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            redirectAttributes.addFlashAttribute("errorMessage", "처리 중 오류발생");
		            return "/error";
		        }
		    } else {
		    	redirectAttributes.addFlashAttribute("errorMessage", "권한이 없습니다");
	            return "index";
		    }
	}
}
