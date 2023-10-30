package com.team3web.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertReview(ReviewVO re) {
		this.sqlSession.insert("review_in",re);
	} // review 저장 

	@Override
	public int getRowCount(PageVO p) {
		
		return sqlSession.selectOne("review_count2",p);
	}// 검색 전후 총 레코드 개수 -- > 댓글 개수 제외 

	@Override
	public List<ReviewVO> getReviewList(PageVO p) {
		return sqlSession.selectList("review_list",p);
	} // 목록 
	
	
	@Override
	public void updateHit(int reno) {
		
		this.sqlSession.update("review_hit",reno);
	} // 조회수 증가 

	@Override
	public ReviewVO getReviewCont(int reno) {
		return sqlSession.selectOne("review_cont",reno);
	} // 내용 보기 

	@Override
	public void updateLevel(ReviewVO rb) {
		sqlSession.update("reply_up",rb);
	}
	
	
	@Override
	public void replyReview(ReviewVO rb) {
		sqlSession.insert("review_re",rb);
	} // 댓글 저장 

	@Override
	public void editReview(ReviewVO review) {
		sqlSession.update("review_update",review);
	}// 리뷰 게시판 수정

	@Override
	public void delReview(int reno) {
		sqlSession.delete("review_del",reno);
	}



	
	
	
	
	
}
