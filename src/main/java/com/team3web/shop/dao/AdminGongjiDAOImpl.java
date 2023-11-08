package com.team3web.shop.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.vo.GongjiVO;
import com.team3web.shop.vo.PageVO;

@Repository
public class AdminGongjiDAOImpl implements AdminGongjiDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertGongji(GongjiVO g) {
		this.sqlSession.insert("in_gongji",g);
	}

	@Override
	public int getListCount(PageVO p) {
		return this.sqlSession.selectOne("gongji_count",p);
	}

	@Override
	public List<GongjiVO> getGongjiList(PageVO p) {
		return sqlSession.selectList("gongji_list",p);
	}

	@Override
	public GongjiVO getGongjiCont(int no) {
		return this.sqlSession.selectOne("gongji_cont",no);
	}

	@Override
	public void editGongji(GongjiVO g) {
		this.sqlSession.update("gongji_edit",g);			
	}//관리자 공지 수정 완료

	@Override
	public void delGongji(int no) {
		this.sqlSession.delete("gongji_del",no);
	}
	
	
	
}
