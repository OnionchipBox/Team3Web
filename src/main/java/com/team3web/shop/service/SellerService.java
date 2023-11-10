package com.team3web.shop.service;

import java.util.List;
import java.util.Map;

import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

public interface SellerService {
	public void insertSeller(SellerVO seller);
	public void updateSellerVerify(UserVO user);
	public SellerVO checkSellerId(String id);
	SellerVO checkSellerCode(String code);
	public void DeleteProduct(ProductVO product);
	
	public List<ProductVO> SellerGetProductsByPage(String search, int page, int pageSize);

	public int SellerGetTotalProducts(Map<String, Object> map);
	
	public List<ProductVO> SellerGetSearchedProductsByPage(Map<String, Object> map);
	
	public int SellerGetTotalSearchedProducts(String search);
}
