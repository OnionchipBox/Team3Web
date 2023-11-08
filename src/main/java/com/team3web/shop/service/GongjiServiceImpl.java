package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3web.shop.dao.GongjiDAO;
import com.team3web.shop.vo.GongjiVO;

@Service
public class GongjiServiceImpl implements GongjiService {

	@Autowired
	private GongjiDAO gongjidao;

	@Override
	public List<GongjiVO> getList() {
		return gongjidao.getList();
	}

	//트랜잭션 적용대상
	@Transactional
	@Override
	public GongjiVO getGongjiCont(int gno) {
		this.gongjidao.updateHit(gno);//조회수 증가
		return this.gongjidao.getGongjiCont(gno);
	}
	
	
	
}
