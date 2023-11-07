package com.team3web.shop.mapper;

import com.team3web.shop.vo.OrderVO;

public interface OrderMapper {
     public OrderVO createOrder(String username);
     public void saveOrder(OrderVO order);
}