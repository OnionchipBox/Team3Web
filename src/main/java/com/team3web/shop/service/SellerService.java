package com.team3web.shop.service;

import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

public interface SellerService {
	public void insertSeller(SellerVO seller);
	public void updateSellerVerify(UserVO user);
	public SellerVO checkSellerId(String username);
}
