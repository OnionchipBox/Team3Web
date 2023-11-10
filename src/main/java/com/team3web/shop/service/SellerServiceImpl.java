package com.team3web.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.SellerDAO;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Service
public class SellerServiceImpl implements SellerService {
	
	private final SellerDAO sellerDAO;
	
	@Autowired
	public SellerServiceImpl(SellerDAO sellerDAO) {
		this.sellerDAO = sellerDAO;
	}

	@Override
	public void insertSeller(SellerVO seller) {
		sellerDAO.insertSeller(seller);
	}

	@Override
	public void updateSellerVerify(UserVO user) {
		sellerDAO.updateSellerVerify(user);
	}

	@Override
	public SellerVO checkSellerId(String id) {
		return sellerDAO.checkSellerId(id);
	}

	@Override
	public SellerVO checkSellerCode(String code) {
		return sellerDAO.checkSellerCode(code);
	}

	@Override
	public void DeleteProduct(ProductVO product) {
		sellerDAO.DeleteProduct(product);
	}

	@Override
	public List<ProductVO> SellerGetProductsByPage(String search, int page, int pageSize) {
		return sellerDAO.SellerGetProductsByPage(search, page, pageSize);
	}

	@Override
	public int SellerGetTotalProducts(Map<String, Object> map) {
		return sellerDAO.SellerGetTotalProducts(map);
	}

	@Override
	public List<ProductVO> SellerGetSearchedProductsByPage(Map<String, Object> map) {
		return sellerDAO.SellerGetSearchedProductsByPage(map);
	}

	@Override
	public int SellerGetTotalSearchedProducts(String search) {
		return sellerDAO.SellerGetTotalSearchedProducts(search);
	}

}
