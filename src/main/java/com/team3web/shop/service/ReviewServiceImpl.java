package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ReviewVO getReviewCont(int reno) {
		this.reviewDao.updateHit(reno); // 조회수 증가
		return this.reviewDao.getReviewCont(reno); // 내용 보기 
	}

	@Override
	public ReviewVO getReviewCont2(int reno) {
		return this.reviewDao.getReviewCont(reno); 
	}//수정폼,삭제폼,답변폼일때는 조회수 증가 안되고 내용보기만 이루어진다.
	
	
	
	
}
