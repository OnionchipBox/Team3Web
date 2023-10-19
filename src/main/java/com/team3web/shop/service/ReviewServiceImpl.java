package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.ReviewDAO;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	
	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public void insertReview(ReviewVO re) {
		this.reviewDao.insertReview(re);
	}

	@Override
	public int getRowCount(PageVO p) {
		
		return this.reviewDao.getRowCount(p);
	}

	@Override
	public List<ReviewVO> getReviewList(PageVO p) {
		
		return this.reviewDao.getReviewList(p);
	}
	
	
}
