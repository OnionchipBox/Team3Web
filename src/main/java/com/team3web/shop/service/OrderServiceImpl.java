package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.OrderDAO;
import com.team3web.shop.dto.CartOrProduct;
import com.team3web.shop.vo.OrderVO;

@Service
public class OrderServiceImpl  implements OrderService{
   @Autowired
   OrderDAO orderDAO;
   @Autowired
   CartService cartService;
   
   
   @Override
   public OrderVO createOrder(String id) {
      
      return orderDAO.createOrder(id);
   }

   @Override
   public void saveOrder(OrderVO order) {
      //카카오페이가 진행된 이후 호출
      
      
      orderDAO.saveOrder(order);
       // 주문 처리 로직 (데이터베이스에 주문 정보 저장)
      List<CartOrProduct> list = cartService.getAllCartList(order.getId());
      System.out.println("cartService.getAllCartList 호출 :::" + list);
       // 재고 감소 로직 (재고 관련 테이블 업데이트)
      for (CartOrProduct ItemList : list) {
         
         int productId = ItemList.getProductId();
         int quantity = ItemList.getQuantity();
         
         cartService.decreaseProductStock(productId, quantity);
       }
       // 만약 주문 처리 중 오류가 발생하면 롤백될 것입니다.
   }
} 