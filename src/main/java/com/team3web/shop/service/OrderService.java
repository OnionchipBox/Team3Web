package com.team3web.shop.service;

import com.team3web.shop.vo.OrderVO;

public interface OrderService {
   
     public OrderVO createOrder(String id);
     public void saveOrder(OrderVO order);
}