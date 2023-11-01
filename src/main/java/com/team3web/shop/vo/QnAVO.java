package com.team3web.shop.vo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name="qna01")
@EqualsAndHashCode(of="qnano")
public class QnAVO {

	@Id
	private int qnano; //게시판번호
	private String qid;  //작성자
	private String qtitle; // 글제목
	private String qpw; // 비번 
	
	@Column(length=1000)
	private String qcont; // 글내용
	
	//private String qfile; // 첨부파일경로와 파일명 저장할 변수
	private String qfile;

	
	
	private int qref; //글 그룹번호 (원본글과 답변글 묶어주는 역할)
	private int qstep; //원본글과 답변글을 구분하는 번호값
	private int qlevel; //답변글 정렬순서
	
	@CreationTimestamp   // <-- mybatis에서는 작동 안 됨
	private Timestamp qdate; // 글 등록 날짜
}
