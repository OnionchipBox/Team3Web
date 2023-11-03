package com.team3web.shop.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Mapper
public interface SellerDAO {
	void insertSeller(SellerVO seller);
	void updateSellerVerify(UserVO user);
	SellerVO checkSellerId(String username);
}
