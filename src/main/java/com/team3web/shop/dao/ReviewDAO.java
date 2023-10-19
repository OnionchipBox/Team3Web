package com.team3web.shop.dao;

import java.util.List;

import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(ReviewVO re);

	int getRowCount(PageVO p);

	List<ReviewVO> getReviewList(PageVO p);

}
