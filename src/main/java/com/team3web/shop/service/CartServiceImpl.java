package com.team3web.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.CartDAO;
import com.team3web.shop.dto.CartOrProduct;
import com.team3web.shop.vo.CartVO;
import com.team3web.shop.vo.UserVO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	CartService cartService;

	@Override
	public List<UserVO> getAllUsers() {

		return cartDAO.getAllUsers();
	}

	@Override
	public void addCart(CartVO cart) {
		cartDAO.addCart(cart);
	}

	@Override
	public List<CartVO> getAllCartItems() {

		return cartDAO.getAllCartItems();
	}

	public List<CartOrProduct> getAllCartList(String id) {

		return cartDAO.getAllCartList(id);
	}

	@Override
	public void deleteCart(int productId) {

		cartDAO.deleteCart(productId);
	}

	@Override
	public boolean duplicateProduct(String loggedInUserId, int productId) {
		CartVO cart = cartDAO.duplicateProduct(loggedInUserId, productId);

		if (cart == null) {
			System.out.println("NULL 객체 반환 return false");
			return false;
		}

		return true;
	}

	@Override
	public int updateCart(int productId, int newQuantity) {
		Map<String, Object> params = new HashMap<>();
		params.put("productId", productId);
		params.put("newQuantity", newQuantity);
		System.out.println("========" + productId);
		System.out.println("========" + newQuantity);

		return cartDAO.updateCart(params);
	}

	@Override
	public void decreaseProductStock(int productId, int quantity) {
		cartDAO.decreaseProductStock(productId, quantity);

	}

   
}