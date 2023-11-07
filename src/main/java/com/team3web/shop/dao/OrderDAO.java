package com.team3web.shop.dao;

import com.team3web.shop.vo.OrderVO;

public interface OrderDAO {
     public OrderVO createOrder(String username);
   public void  saveOrder(OrderVO order);
}