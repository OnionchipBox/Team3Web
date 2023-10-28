package com.team3web.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.SellerDAO;
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

}
