package com.team3web.shop.dao;

import java.util.List;

import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(ReviewVO re);

	int getRowCount(PageVO p);

	List<ReviewVO> getReviewList(PageVO p);

	void updateHit(int reno);
	
	ReviewVO getReviewCont(int reno);

	void replyReview(ReviewVO rb);

	void updateLevel(ReviewVO rb);

	void editReview(ReviewVO review);

	void delReview(int reno);



}
