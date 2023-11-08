package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.AdminGongjiDAO;
import com.team3web.shop.vo.GongjiVO;
import com.team3web.shop.vo.PageVO;

@Service
public class AdminGongjiServiceImpl implements AdminGongjiService {

	
	@Autowired
	private AdminGongjiDAO adminGongjidao;

	@Override
	public void insertGongji(GongjiVO g) {
		this.adminGongjidao.insertGongji(g);
		
	}

	@Override
	public int getListCount(PageVO p) {
		return this.adminGongjidao.getListCount(p);
	}

	@Override
	public List<GongjiVO> getGongjiList(PageVO p) {
		return adminGongjidao.getGongjiList(p);
	}

	@Override
	public GongjiVO getGongjiCont(int no) {
		
		return this.adminGongjidao.getGongjiCont(no);
	}

	@Override
	public void editGongji(GongjiVO g) {
		 this.adminGongjidao.editGongji(g);
	}

	@Override
	public void delGongji(int no) {
		this.adminGongjidao.delGongji(no);
	}
	
	
	
}
