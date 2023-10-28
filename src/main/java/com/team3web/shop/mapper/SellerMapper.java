package com.team3web.shop.mapper;

import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

public interface SellerMapper {
	
	void insertSeller(SellerVO seller);
	
	void updateSellerVerify(UserVO user);
	
	SellerVO checkSellerId(String id);
}
