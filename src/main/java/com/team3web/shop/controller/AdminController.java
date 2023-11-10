package com.team3web.shop.controller;
// 관리자 관련 컨트롤러

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3web.shop.dao.AdminDAO;
import com.team3web.shop.dao.LoginDAO;
import com.team3web.shop.service.AdminService;
import com.team3web.shop.vo.NoticeVO;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private LoginDAO loginDAO;
	
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
		
	/* ===공지 관련=== */
	
		//11/08 수정중
		// 관리자 공지사항 작성폼 매핑 
		//@PreAuthorize("hasRole('ROLE_ADMIN')")	
		@RequestMapping("/admin_gongji_write")
		public ModelAndView admin_gongji_write(HttpServletResponse response,
				HttpSession session, HttpServletRequest request,UserVO user) throws Exception {
			response.setContentType("text/html;charset=UTF-8");

			String loggedInUserId = (String) session.getAttribute("loggedInUserId");
			UserVO userVO = loginDAO.loadUserByUsername(loggedInUserId);
			System.out.println("userVO:::"+ userVO);
			
			if(userVO== null) {
				throw new UsernameNotFoundException("사용자를 찾을 수 없습니다:"+loggedInUserId);
			}
			String roleUser= loginDAO.getUserRoleById(loggedInUserId);
			System.out.println("roleUser::"+roleUser);
			
			
			//int user1= loginService.getUserRole(loggedInUserId);
			//System.out.println("user1:"+user1);
			 //Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			//PrintWriter out = response.getWriter();
			//System.out.println("로그인한 유저 : "+loggedInUserId);
			if(roleUser.equals("ADMIN")) {
				
			//if(loggedInUserId !=null) {
			int page=1;//쪽번호
				//int limit=7;//한페이지에 보여지는 목록개수
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));			
				}

				// System.out.println("\n====>관리자 공지 작성폼 이동");
				ModelAndView wm = new ModelAndView();
				wm.addObject("page", page); // 페이징 목록에서 책갈피 기능을 구현하기 위한 것
				wm.setViewName("admin/admin_gongji_write");
				return wm;
			}
			return null; 
			
			
			
			/*
			 * else { return new ModelAndView("redirect:/"); }
			 */
			//System.out.println("\n====>관리자 공지 글쓰기 이동");
			//return null;
		}//admin_gongji_write()


		//관리자 공지 저장
		@RequestMapping("/admin_gongji_write_ok")
		public ModelAndView admin_gongji_write_ok(NoticeVO g,HttpSession session,
				HttpServletResponse response) throws Exception{
			/* 네임 피라미터 이름과 빈클래스 변수명이 같으면 GongjiVO g에서 g객체에 이름,공지제목,비번,공지내용까지 
			 * 저장되어 있다.
			 */
			response.setContentType("text/html;charset=UTF-8");

			this.adminService.insertGongji(g);//공지 저장

			return new ModelAndView("redirect:/admin_gongji_list");
		}//admin_gongji_write_ok()



		//관리자 공지목록
		@RequestMapping(value ="/admin_gongji_list", method = RequestMethod.GET)
		public ModelAndView admin_gongji_list(@ModelAttribute PageVO p,HttpServletRequest request,
				HttpSession session,HttpServletResponse response) throws Exception{
			response.setContentType("text/html;charset=UTF-8");

			int page=1;//쪽번호
			int limit=7;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}

			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색
			//필드
			p.setFind_field(find_field);
			p.setFind_name("%"+find_name+"%");
			//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
			//매핑 대응

			int listcount=this.adminService.getListCount(p);
			//전체 레코드 개수 또는 검색전후 레코드 개수

			System.out.println("총 게시물수:"+listcount+"개");

			p.setStartrow((page-1)*7+1);//시작행번호
			p.setEndrow(p.getStartrow()+limit-1);//끝행번호

			List<NoticeVO> glist=this.adminService.getGongjiList(p);
			//관리자 공지 검색 전후 목록

			System.out.println("\n===>공지목록 개수: "+glist.size());

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			ModelAndView listM=new ModelAndView("admin/admin_gongji_list");

			listM.addObject("glist",glist);
			//glist 키이름에 값 저장
			listM.addObject("page",page);
			listM.addObject("startpage",startpage);
			listM.addObject("endpage",endpage);
			listM.addObject("maxpage",maxpage);
			listM.addObject("listcount",listcount);	
			listM.addObject("find_field",find_field);
			listM.addObject("find_name", find_name);

			return listM;
		}//admin_gongji_list()


		//관리자 공지 수정과 상세정보
		@RequestMapping("/admin_gongji_cont")
		public ModelAndView admin_gongji_cont(HttpServletRequest request,
				HttpServletResponse response,HttpSession session,
				@RequestParam("no") int no,
				@RequestParam("state") String state)
						throws Exception {


			response.setContentType("text/html;charset=UTF-8");

			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));		

			}

			NoticeVO g=this.adminService.getGongjiCont(no);
			String g_cont=g.getGcont().replace("\n","<br/>");
			//textarea영역에서 엔터키 친 부분을 다음줄로 줄바꿈

			ModelAndView cm=new ModelAndView();
			cm.addObject("g",g);
			cm.addObject("g_cont",g_cont);
			cm.addObject("page",page);

			if(state.equals("cont")) {//내용보기
				cm.setViewName("admin/admin_gongji_cont");
			}else if(state.equals("edit")) {//수정폼
				cm.setViewName("admin/admin_gongji_edit");
			}
			return cm;

		}//admin_gongji_cont()


		//관리자 공지 수정완료
		@RequestMapping("/admin_gongji_edit_ok")
		public ModelAndView admin_gongji_edit_ok(NoticeVO g,
				HttpServletRequest request,
				HttpServletResponse response,HttpSession session)
						throws Exception{
			response.setContentType("text/html;charset=UTF-8");


			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}

			this.adminService.editGongji(g);//공지 수정
			return new ModelAndView("redirect:/admin_gongji_list?page="+page);

		}//admin_gongji_edit_ok()


		//관리자 공지 삭제
		@RequestMapping("/admin_gongji_del")
		public String admin_gongji_del(int no,HttpServletResponse response,
				HttpSession session,HttpServletRequest request)throws Exception{

			response.setContentType("text/html;charset=UTF-8");		

			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));		
			}

			this.adminService.delGongji(no);//공지 삭제

			return "redirect:/admin_gongji_list?page="+page;

		}//admin_gongji_del()

}
