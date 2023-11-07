package com.team3web.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.OrderMapper;
import com.team3web.shop.vo.OrderVO;
@Repository
public class OrderDAOImpl implements OrderDAO {
@Autowired
SqlSession sqlSession;
   @Override
   public OrderVO createOrder(String username) {

      return sqlSession.getMapper(OrderMapper.class).createOrder(username);
   }
   @Override
   public void saveOrder(OrderVO order) {
      sqlSession.getMapper(OrderMapper.class).saveOrder(order);
   }

} 