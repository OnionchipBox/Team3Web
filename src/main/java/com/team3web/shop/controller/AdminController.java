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
import com.team3web.shop.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminDAO adminDAO;
	
	@RequestMapping(value = "/admin/userList", method = RequestMethod.GET)
	public String getUserList(Model model, 
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "search", required = false) String search) {
		System.out.println("회원목록 로드");
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

	@RequestMapping(value = "/userVerify", method = RequestMethod.POST)
	public String PostUserList(@RequestParam("userId") String userId, 
			@RequestParam("userVerify") String userVerify, 
			HttpSession session, RedirectAttributes redirectAttributes) {
		
		 String loggedInUserId = (String) session.getAttribute("loggedInUserId");
//		 redirectAttributes.addFlashAttribute("CancelMessage", "VerifyMessageCancel");
		    if (loggedInUserId != null && userId != null) {
		        try {
		            UserVO userVO = new UserVO();
		            userVO.setId(userId);
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
	
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String ForceUserDelete(@RequestParam("userId") String userId,
			HttpSession session, RedirectAttributes redirectAttributes) {
		
		 String loggedInUserId = (String) session.getAttribute("loggedInUserId");
		 
		 if (loggedInUserId != null && userId != null) {
		        try {
		            UserVO userVO = new UserVO();
		            userVO.setId(userId);

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
	
	@RequestMapping(value = "/admin/productList", method = RequestMethod.GET)
	public String GetProductList(HttpSession session) {
		
		return "/admin/productList";
	}
	
	@RequestMapping(value = "/admin/productList", method = RequestMethod.POST)
	public String PostProductList(HttpSession session) {
		
		return "/admin/productList";
	}
}
