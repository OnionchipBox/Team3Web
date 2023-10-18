package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.team3web.shop.dao.QnADAO;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.QnAVO;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO qnaDao;

	@Override
	public void insertQna(QnAVO q) {
		this.qnaDao.insertQna(q);
		
	}

	@Override
	public int getRowCount(PageVO q) {
		
		return this.qnaDao.getRowCount(q);
	}

	@Override
	public List<QnAVO> getQnaList(PageVO q) {
		return this.qnaDao.getQnaList(q);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public QnAVO getQnACont(int qnano) {
		return this.qnaDao.getQnACont(qnano);
	}
	
	@Transactional
	@Override
	public void replyQnA(QnAVO rq) {
		this.qnaDao.updateLevel(rq); //답변 레벨 증가
		this.qnaDao.replyQnA(rq); // 답변 저장
		
	}

	@Override
	public void editQnA(QnAVO q) {
		this.qnaDao.editQnA(q);
	}

	@Override
	public void delQnA(int qna_no) {
		this.qnaDao.delQnA(qna_no);
	} 
	
}
