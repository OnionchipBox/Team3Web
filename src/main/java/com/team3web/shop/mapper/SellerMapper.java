package com.team3web.shop.mapper;

import java.util.List;
import java.util.Map;

import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

public interface SellerMapper {
	
	void insertSeller(SellerVO seller);
	
	void updateSellerVerify(UserVO user);
	
	SellerVO checkSellerId(String id);
	
	SellerVO checkSellerCode(String code);
	
	public void DeleteProduct(ProductVO product);
	
	public List<ProductVO> SellerGetProductsByPage(Map<String, Object> map);

	public int SellerGetTotalProducts(Map<String, Object> map);
	
	public List<ProductVO> SellerGetSearchedProductsByPage(Map<String, Object> map);
	
	public int SellerGetTotalSearchedProducts(Map<String, Object> map);
}
