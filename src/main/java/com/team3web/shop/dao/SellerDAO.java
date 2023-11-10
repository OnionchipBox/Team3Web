package com.team3web.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Mapper
public interface SellerDAO {
	void insertSeller(SellerVO seller);
	void updateSellerVerify(UserVO user);
	SellerVO checkSellerId(String id);
	SellerVO checkSellerCode(String code);
	public void DeleteProduct(ProductVO product);
	
	public List<ProductVO> SellerGetProductsByPage(String search, int page, int pageSize);

	public int SellerGetTotalProducts(Map<String, Object> map);
	
	public List<ProductVO> SellerGetSearchedProductsByPage(Map<String, Object> map);
	
	public int SellerGetTotalSearchedProducts(String search);
}
