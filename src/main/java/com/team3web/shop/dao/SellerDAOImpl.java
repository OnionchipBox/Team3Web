package com.team3web.shop.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.SellerMapper;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Repository
public class SellerDAOImpl implements SellerDAO {
	
	@Autowired
    private SqlSessionTemplate sqlSession;

	@Override
	public void insertSeller(SellerVO seller) {
		sqlSession.getMapper(SellerMapper.class).insertSeller(seller);
	}

	@Override
	public void updateSellerVerify(UserVO user) {
		sqlSession.getMapper(SellerMapper.class).updateSellerVerify(user);
	}

	@Override
	public SellerVO checkSellerId(String id) {
		return sqlSession.getMapper(SellerMapper.class).checkSellerId(id);
	}

}
