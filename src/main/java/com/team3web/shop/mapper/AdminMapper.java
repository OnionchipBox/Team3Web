package com.team3web.shop.mapper;

import java.util.List;
import java.util.Map;

import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

public interface AdminMapper {
	
	public void updateUserVerify(UserVO user);
	
	public void forceDeleteUser(String id);
	
	public void forceDeleteSeller(String id);
	
	public void forceDeleteProduct(ProductVO product);
	
	public void DeleteProductAll(ProductVO product);
	
	// 사용자 영역
	
	public List<UserVO> getUsersByPage(Map<String, Object> map);

	public int getTotalUsers(Map<String, Object> map);
	
	public List<UserVO> getSearchedUsersByPage(Map<String, Object> map);
	
	public int getTotalSearchedUsers(Map<String, Object> map);
	
	// 판매업체 영역
	
	public List<SellerVO> getSellerByPage(Map<String, Object> map);

	public int getTotalSeller(Map<String, Object> map);
	
	public List<SellerVO> getSearchedSellerByPage(Map<String, Object> map);
	
	public int getTotalSearchedSeller(Map<String, Object> map);
	
	// 제품 영역
	
	public List<ProductVO> getProductsByPage(Map<String, Object> map);

	public int getTotalProducts(Map<String, Object> map);
	
	public List<ProductVO> getSearchedProductsByPage(Map<String, Object> map);
	
	public int getTotalSearchedProducts(Map<String, Object> map);
	
}
