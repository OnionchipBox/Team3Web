package com.team3web.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.dto.CartOrProduct;
import com.team3web.shop.mapper.CartMapper;
import com.team3web.shop.vo.CartVO;
import com.team3web.shop.vo.UserVO;
@Repository
public class CartDAOImpl implements CartDAO {
   @Autowired
   SqlSession sqlSession;
   @Override
   public List<UserVO> getAllUsers() {
      
      return sqlSession.getMapper(CartMapper.class).getAllUsers();
   }

   @Override
   public void addCart(CartVO cart) {
      sqlSession.getMapper(CartMapper.class).addCart(cart);
   }

   @Override
   public List<CartVO> getAllCartItems() {
      
      return sqlSession.getMapper(CartMapper.class).getAllCartItems();
   }

   @Override
   public List<CartOrProduct> getAllCartList(String username) {
      
      return sqlSession.getMapper(CartMapper.class).getAllCartList(username);
   }

   @Override
   public void deleteCart(int productId) {
      
       sqlSession.getMapper(CartMapper.class).deleteCart(productId);
   }

   @Override
   public CartVO duplicateProduct(String loggedInUserId, int productId) {
      
      return sqlSession.getMapper(CartMapper.class).duplicateProduct(loggedInUserId, productId);
   }

   @Override
     public int  updateCart(Map<String, Object> params){
 
      return sqlSession.getMapper(CartMapper.class).updateCart(params);
   }

   @Override
   public void decreaseProductStock(int productId, int quantity) {
      sqlSession.getMapper(CartMapper.class).decreaseProductStock(productId,quantity);
   }

   
} 