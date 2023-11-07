package com.team3web.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminGongjiDAOImpl implements AdminGongjiDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	
}
