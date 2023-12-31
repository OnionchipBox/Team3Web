package com.team3web.shop.dao;

import java.util.List;

import com.team3web.shop.vo.MyQnAVO;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.QnAVO;

public interface QnADAO {

	void insertQna(QnAVO q);
	int getRowCount(PageVO q);
	List<QnAVO> getQnaList(PageVO q);
	QnAVO getQnACont(int qnano);
	void updateLevel(QnAVO rq);
	void replyQnA(QnAVO rq);
	void editQnA(QnAVO q);
	void delQnA(int qna_no);
	
	
	void insertMyQ(MyQnAVO q);
	List<MyQnAVO> getMyQnAList();
	int getMyCount();
	


}