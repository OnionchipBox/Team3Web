package com.team3web.shop.mapper;

import com.team3web.shop.vo.OrderVO;

public interface OrderMapper {
     public OrderVO createOrder(String id);
     public void saveOrder(OrderVO order);
}