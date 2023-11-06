package com.team3web.shop.service;

import java.util.List;

import com.team3web.shop.dto.CartOrProduct;
import com.team3web.shop.vo.CartVO;
import com.team3web.shop.vo.UserVO;

public interface CartService {
     List<UserVO> getAllUsers();
     public void addCart(CartVO cart);
     public List<CartVO> getAllCartItems();
     public List<CartOrProduct> getAllCartList(String id);
     public void deleteCart( int productId);
     boolean duplicateProduct(String loggedInUserId, int productId);
     
     public int updateCart(int productId, int newQuantity);
     public void decreaseProductStock(int productId, int quantity);
}