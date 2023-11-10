package com.team3web.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.AdminDAO;
import com.team3web.shop.vo.NoticeVO;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	private final AdminDAO adminDAO;
	
	@Autowired
	public AdminServiceImpl(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	public void updateUserVerify(UserVO user) {
		adminDAO.updateUserVerify(user);
	}

	@Override
	public void forceDeleteUser(String id) {
		adminDAO.forceDeleteUser(id);
	}
	
	@Override
	public void forceDeleteProduct(ProductVO product) {
		adminDAO.forceDeleteProduct(product);
	}
	
	@Override
	public void forceDeleteSeller(String id) {
		adminDAO.forceDeleteSeller(id);
	}
	
	@Override
	public void DeleteProductAll(ProductVO product) {
		adminDAO.DeleteProductAll(product);
	}
	
	// 사용자 영역

	@Override
	public List<UserVO> getUsersByPage(String search, int page, int pageSize) {
		return adminDAO.getUsersByPage(search, page, pageSize);
	}

	@Override
	public int getTotalUsers(Map<String, Object> map) {
		return adminDAO.getTotalUsers(map);
	}

	@Override
	public List<UserVO> getSearchedUsersByPage(Map<String, Object> map) {
		return adminDAO.getSearchedUsersByPage(map);
	}

	@Override
	public int getTotalSearchedUsers(String search) {
		return adminDAO.getTotalSearchedUsers(search);
	}
	
	// 판매업체 영역

	@Override
	public List<SellerVO> getSellerByPage(String search, int page, int pageSize) {
		return adminDAO.getSellerByPage(search, page, pageSize);
	}

	@Override
	public int getTotalSeller(Map<String, Object> map) {
		return adminDAO.getTotalSeller(map);
	}

	@Override
	public List<SellerVO> getSearchedSellerByPage(Map<String, Object> map) {
		return adminDAO.getSearchedSellerByPage(map);
	}

	@Override
	public int getTotalSearchedSeller(String search) {
		return adminDAO.getTotalSearchedSeller(search);
	}
	
	// 제품 영역

	@Override
	public List<ProductVO> getProductsByPage(String search, int page, int pageSize) {
		return adminDAO.getProductsByPage(search, page, pageSize);
	}

	@Override
	public int getTotalProducts(Map<String, Object> map) {
		return adminDAO.getTotalProducts(map);
	}

	@Override
	public List<ProductVO> getSearchedProductsByPage(Map<String, Object> map) {
		return adminDAO.getSearchedProductsByPage(map);
	}

	@Override
	public int getTotalSearchedProducts(String search) {
		return adminDAO.getTotalSearchedProducts(search);
	}
	
	@Override
	public void insertGongji(NoticeVO g) {
		this.adminDAO.insertGongji(g);
		
	}

	@Override
	public int getListCount(PageVO p) {
		return this.adminDAO.getListCount(p);
	}

	@Override
	public List<NoticeVO> getGongjiList(PageVO p) {
		return adminDAO.getGongjiList(p);
	}

	@Override
	public NoticeVO getGongjiCont(int no) {
		
		return this.adminDAO.getGongjiCont(no);
	}

	@Override
	public void editGongji(NoticeVO g) {
		 this.adminDAO.editGongji(g);
	}

	@Override
	public void delGongji(int no) {
		this.adminDAO.delGongji(no);
	}
	
	@Override
	public List<NoticeVO> getList() {
		return adminDAO.getList();
	}

	//트랜잭션 적용대상
//	@Transactional
//	@Override
//	public GongjiVO getGongjiCont(int gno) {
//		this.gongjidao.updateHit(gno);//조회수 증가
//		return this.gongjidao.getGongjiCont(gno);
//	}
}
