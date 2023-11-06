package com.team3web.shop.controller;

import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3web.shop.dto.CartOrProduct;
import com.team3web.shop.service.CartService;
import com.team3web.shop.service.LoginService;
import com.team3web.shop.service.OrderService;
import com.team3web.shop.service.ProductService;
import com.team3web.shop.service.UserService;
import com.team3web.shop.vo.OrderVO;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.UserVO;



// 주문 관련 컨트롤러
@Controller
public class OrderController {

   @Autowired
   CartService cartService;

   @Autowired
   LoginService loginService;
   
   @Autowired
   OrderService orderService;
   
   @Autowired
   UserService userService;
   @Autowired
   ProductService productService;
   
   @RequestMapping(value = "/pay", method = RequestMethod.GET)
   public String pay(HttpSession session,Model model) throws Exception {
      int totalPrice = 0;
      
      String loggedInUserId = (String) session.getAttribute("loggedInUserId");
      System.out.println("=========" + loggedInUserId);
      if (loggedInUserId != null) {
         List<CartOrProduct> list = cartService.getAllCartList(loggedInUserId);
         
         System.out.println("list:"+list);
         for(CartOrProduct item : list) {
            int itemPrice = item.getPrice() * item.getQuantity();
            
            totalPrice += itemPrice;
         }
         
         model.addAttribute("totalPrice",totalPrice);
      }
      return "/pay";

   }
   @RequestMapping(value="/order", method = RequestMethod.GET)
   public String Order(HttpSession session,Model model)throws Exception{
      
      String loggedInUserId = (String) session.getAttribute("loggedInUserId");
      if (loggedInUserId == null) {
            throw new NoSuchElementException("세션에 유저가 없습니다.");
      }   
      
   
      
      List<CartOrProduct> cartList = cartService.getAllCartList(loggedInUserId);
       for (CartOrProduct cartItem : cartList) {
              int productId = cartItem.getProductId();
              int quantity = cartItem.getQuantity();
              ProductVO product = productService.findById(productId);
              int stock = product.getStock();
              
              if (quantity > stock) {
                  // 유효성 검사 실패: 장바구니 수량이 재고보다 큰 경우
                  // 이 경우 어떤 조치를 취할 것인지 정의해야 합니다.
                  // 예를 들어 오류 메시지를 표시하고 주문 페이지로 이동하거나 다른 조치를 취할 수 있습니다.
                  
                  // 에러 메시지를 설정하고 다시 주문 페이지로 리다이렉트
                  model.addAttribute("error", "상품의 재고가 부족합니다.");
                  return "redirect:/order"; // 다시 주문 페이지로 리다이렉트
              }
             //유저객체
            UserVO user = loginService.getUserById(loggedInUserId);
            model.addAttribute("user", user);
            
            //결제해야할 금액
            int totalPrice = getTotalPrice(cartService.getAllCartList(loggedInUserId));
            model.addAttribute("totalPrice", totalPrice);
       }
      return "/order";
   }

   @RequestMapping(value="/order", method = RequestMethod.POST)
   @ResponseBody
   public String PostOrder(OrderVO orderVO)throws Exception{
      System.out.println("주문 프로세스 실행 ::: " + orderVO);
      
      //TODO 주문로직
      orderService.saveOrder(orderVO); // insert into ~~~~ 1:1매칭시켜서 인서트
      return "SUCCESS";
      
   }
   
   private int getTotalPrice(List<CartOrProduct> products) {
      int totalPrice=0;
      for(CartOrProduct item : products) {
         totalPrice += item.getQuantity() * item.getPrice();
      }
      return totalPrice;
   }
} 