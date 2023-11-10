package com.team3web.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team3web.shop.dto.CartOrProduct;
import com.team3web.shop.vo.CartVO;
import com.team3web.shop.vo.UserVO;
@Mapper
public interface CartDAO {
	public List<CartVO> getAllCartItems();

	// 사용자 정보 전체 조회
	List<UserVO> getAllUsers();

	public void addCart(CartVO cart);

	public List<CartOrProduct> getAllCartList(String id);

	public void deleteCart(int productId);

	CartVO duplicateProduct(String loggedInUserId, int productId);

	public int updateCart(Map<String, Object> params);

	public void decreaseProductStock(int productId, int quantity);

   
}