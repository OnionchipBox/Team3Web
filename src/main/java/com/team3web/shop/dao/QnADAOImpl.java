package com.team3web.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.QnAVO;

@Repository
public class QnADAOImpl implements QnADAO {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertQna(QnAVO q) {
		this.sqlSession.insert("qna_in",q);
	} // qna 저장 

	@Override
	public int getRowCount(PageVO q) {
		
		return this.sqlSession.selectOne("qna_one",q);
	} //검색 전후 총 레코드 개수

	@Override
	public List<QnAVO> getQnaList(PageVO q) {
		return this.sqlSession.selectList("qna_list",q);
	} //검색 전후 목록 

	@Override
	public QnAVO getQnACont(int qnano) {
		
		return this.sqlSession.selectOne("qna_cont",qnano);
	} // 내용 보기 

	@Override
	public void updateLevel(QnAVO rq) {
		sqlSession.update("levelUp",rq);
	} // 답변 레벨 증가
	
	@Override
	public void replyQnA(QnAVO rq) {
		sqlSession.insert("qna_re",rq);
		
	} // 답변 저장 

	@Override
	public void editQnA(QnAVO q) {
	
		sqlSession.update("qna_edit",q);
	} // 게시판 수정  

	@Override
	public void delQnA(int qna_no) {
		sqlSession.delete("qna_del",qna_no);
	} // 게시판 삭제 

	
	
	
}
