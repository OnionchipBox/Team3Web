package com.team3web.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.team3web.shop.dto.CartOrProduct;
import com.team3web.shop.vo.CartVO;
import com.team3web.shop.vo.UserVO;

public interface CartMapper {
	public List<UserVO> getAllUsers();

	public void addCart(CartVO cart);

	public List<CartVO> getAllCartItems();

	public List<CartOrProduct> getAllCartList(String id);

	public void deleteCart(int productId);

	CartVO duplicateProduct(@Param("loggedInUserId") String loggedInUserId, @Param("productId") int productId);

	public int updateCart(Map<String, Object> params);

	public void decreaseProductStock(@Param("productId") int productId, @Param("quantity") int quantity);
     
}