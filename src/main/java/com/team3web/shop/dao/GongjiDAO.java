package com.team3web.shop.dao;

import java.util.List;

import com.team3web.shop.vo.GongjiVO;

public interface GongjiDAO {

	List<GongjiVO> getList();

	void updateHit(int gno);
	
	GongjiVO getGongjiCont(int gno);


}
