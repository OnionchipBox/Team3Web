package com.team3web.shop.service;

import java.util.List;
import java.util.Map;

import com.team3web.shop.vo.GongjiVO;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

public interface AdminService {
	
	public void updateUserVerify(UserVO user);

	public void forceDeleteUser(String id);
	
	public void forceDeleteSeller(String id);
	
	public void forceDeleteProduct(ProductVO product);
	
	public void DeleteProductAll(ProductVO product);
	
	// 사용자 영역
	
	public List<UserVO> getUsersByPage(String search, int page, int pageSize);

	public int getTotalUsers(Map<String, Object> map);
	
	public List<UserVO> getSearchedUsersByPage(Map<String, Object> map);
	
	public int getTotalSearchedUsers(String search);
	
	// 판매업체 영역
	
	public List<SellerVO> getSellerByPage(String search, int page, int pageSize);

	public int getTotalSeller(Map<String, Object> map);
		
	public List<SellerVO> getSearchedSellerByPage(Map<String, Object> map);
		
	public int getTotalSearchedSeller(String search);
	
	// 제품 영역
	
	public List<ProductVO> getProductsByPage(String search, int page, int pageSize);

	public int getTotalProducts(Map<String, Object> map);
			
	public List<ProductVO> getSearchedProductsByPage(Map<String, Object> map);
			
	public int getTotalSearchedProducts(String search);
	
	// 공지 관련
	
	public void insertGongji(GongjiVO g);

	public int getListCount(PageVO p);

	public List<GongjiVO> getGongjiList(PageVO p);

	public GongjiVO getGongjiCont(int no);

	public void editGongji(GongjiVO g);

	public void delGongji(int no);
	
	public List<GongjiVO> getList();

//	public GongjiVO getGongjiCont(int gno);

}
