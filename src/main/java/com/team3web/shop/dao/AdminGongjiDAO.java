package com.team3web.shop.dao;

import java.util.List;

import com.team3web.shop.vo.GongjiVO;
import com.team3web.shop.vo.PageVO;

public interface AdminGongjiDAO {

	void insertGongji(GongjiVO g);

	int getListCount(PageVO p);

	List<GongjiVO> getGongjiList(PageVO p);

	GongjiVO getGongjiCont(int no);

	void editGongji(GongjiVO g);

	void delGongji(int no);

}
