package com.team3web.shop.service;

import java.util.List;

import com.team3web.shop.vo.GongjiVO;

public interface GongjiService {

	List<GongjiVO> getList();

	GongjiVO getGongjiCont(int gno);

}
