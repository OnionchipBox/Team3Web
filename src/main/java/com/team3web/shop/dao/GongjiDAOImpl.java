package com.team3web.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.vo.GongjiVO;

@Repository
public class GongjiDAOImpl implements GongjiDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GongjiVO> getList() {
		return sqlSession.selectList("gonglist");
	}
	
	@Override
	public void updateHit(int gno) {
		sqlSession.update("gonghit",gno);
	}

	@Override
	public GongjiVO getGongjiCont(int gno) {
		return sqlSession.selectOne("gongcont",gno);
	}

	

	
}
