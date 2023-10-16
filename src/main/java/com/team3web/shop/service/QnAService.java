package com.team3web.shop.service;

import java.util.List;

import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.QnAVO;

public interface QnAService {

	void insertQna(QnAVO q);
	int getRowCount(PageVO q);
	List<QnAVO> getQnaList(PageVO q);
	QnAVO getQnACont(int qna_no);
	void replyQnA(QnAVO rq);
	void editQnA(QnAVO q);
	void delQnA(int qna_no);

}
