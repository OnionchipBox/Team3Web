package com.team3web.shop.service;

import java.util.List;

import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ReviewVO;

public interface ReviewService {

	void insertReview(ReviewVO re);

	int getRowCount(PageVO p);

	List<ReviewVO> getReviewList(PageVO p);

	ReviewVO getReviewCont(int reno);

	ReviewVO getReviewCont2(int reno);

	void replyReview(ReviewVO rb);

	void editReview(ReviewVO review);

	void delReview(int reno);

}