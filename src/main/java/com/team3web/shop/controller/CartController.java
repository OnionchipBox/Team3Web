package com.team3web.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3web.shop.dto.CartOrProduct;
import com.team3web.shop.service.CartService;
import com.team3web.shop.service.LoginService;
import com.team3web.shop.vo.CartVO;
import com.team3web.shop.vo.UserVO;

@Controller
public class CartController {

   @Autowired
   private CartService cartService;

   @Autowired
   private LoginService loginService;

   @ResponseBody
   @RequestMapping(value = "/user/cart", method = RequestMethod.POST)
   public String addCart(@RequestParam("productId") int productId, @RequestParam("quantity") int quantity,
         @RequestParam("cartSize") String cartSize, HttpSession session,RedirectAttributes redirectAttributes) throws Exception {
      System.out.println("1차 체크");
      // 세션에서 현재 사용자 정보를 가져옴
      String loggedInUserId = (String) session.getAttribute("loggedInUserId");
      System.out.println("-----------" + loggedInUserId);

      if (loggedInUserId == null) {
         System.out.println("loggedInUserId:" + "로그인되지않았습니다");
         // 사용자가 로그인하지 않은 경우
         // 로그인 페이지로 리디렉션 또는 처리
      } else {
         // 사용자가 로그인한 경우
         // 세션에서 사용자 정보를 가져와 처리
         System.out.println("::::: " + loggedInUserId);
         UserVO user = loginService.getUserById(loggedInUserId);
         
         // 중복 상품 체크
         if (cartService.duplicateProduct(loggedInUserId, productId)) {
            System.out.println("============"+loggedInUserId);
            System.out.println("============"+productId);
            System.out.println("중복입니다 =============================");
            // 이미 장바구니에 있는 상품이라면 클라이언트에게 중복 상품임을 알리는 메시지 반환
            return "duplicate";
         } else {
            // 중복이 아니라면 상품을 장바구니에 추가하고 성공 메시지 반환
            CartVO cart = new CartVO();
            cart.setId(user.getUsername());
            cart.setProductId(productId);
            cart.setQuantity(quantity);
            cart.setCartSize(cartSize);
            cartService.addCart(cart);
            return "add";

         }
      }
      return loggedInUserId;
   }

   @RequestMapping(value = "/user/cart", method = RequestMethod.GET)
   public String getCart(HttpSession session, Model model) throws Exception {

      String loggedInUserId = (String) session.getAttribute("loggedInUserId");
      System.out.println("=========" + loggedInUserId);
      if (loggedInUserId != null) {
         // 로그인한 사용자인 경우
         // 제품 데이터 가져오기
//                  List<ProductVO> products = productService.getAllProudct();
//                  // 사용자의 장바구니 정보 가져오기
//                  List<CartVO> cartItems = cartService.getAllCartItems();

         /*
          * select * from product p join cart c on p.productId = c.productId
          */

         List<CartOrProduct> list = cartService.getAllCartList(loggedInUserId);

         System.out.println("==================" + list);
         // 모델에 제품 목록 및 장바구니 정보 추가
         model.addAttribute("list", list);

      }

      return "/user/cart";
   }

   //삭제 컨트롤러
   @RequestMapping(value = "/user/cart/{productId}", method = RequestMethod.POST)
   public String deleteProduct(@PathVariable int productId, HttpSession session,
         RedirectAttributes redirectAttributes) {
      try {
         String loggedInUserId = (String) session.getAttribute("loggedInUserId");
         // productId를 사용하여 상품을 삭제

         System.out.println("================123" + loggedInUserId);
         System.out.println("===============" + productId);

         // 삭제 성공 시 "success" 문자열 반환
         if (loggedInUserId != null) {
            // 상품 삭제 로직에서 loggedInUserId를 활용하여 삭제 작업 수행
            cartService.deleteCart(productId);
            System.out.println("---------------------" + productId);
            redirectAttributes.addFlashAttribute("message", "삭제 성공했습니다.");
            return "redirect:/user/cart"; // 삭제 성공 시 리다이렉트
         } else {
            return "error"; // 로그인한 사용자가 아닌 경우 또는 다른 오류 처리
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("삭제실패 =============================");
         return "error"; // 삭제 실패 시 "error" 문자열 반환 또는 오류 처리
      }

   }
   @RequestMapping(value = "/cart/update", method = RequestMethod.PATCH)
@ResponseBody
   public String updateCartPOST(@RequestParam("productId") int productId,@RequestParam("newQuantity") int newQuantity) {
      System.out.println("productId========"+productId );
      System.out.println("newQuantity=========="+newQuantity);
      cartService.updateCart(productId, newQuantity);
      
      return "redirect:/user/cart";
   }
} 