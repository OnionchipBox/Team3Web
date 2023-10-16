package com.team3web.shop.vo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.team3web.shop.vo.ReviewVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name="review")
@EqualsAndHashCode(of="re_no")
public class ReviewVO {

	
	@Id // 기본키 지정 
	private int re_no; //review 번호 
	
	private String re_name; //글쓴이
	private String re_title; //글제목
	private String re_pwd; //비밀번호
	
	@Column(length=4000) //컬럼크기를 4000으로 설정
	private String re_cont; //내용 
	
	private String re_file; //첨부파일경로와 파일명 저장할 변수
	private int re_hit; // 조회수
	
	//계단형 계층형 자료실을 만들기 위해서 필요한 것 = > 관리자 답변 기능 추가 컬럼
	private int re_ref; //글 그룹번호 => 원본글과 답변글을 묶어주는 기능을 한다.
	private int re_step; //원본글과 답변글을 구분하는 번호값이면 몇번째 답변글인가를 알려준다.
						// 원본 글이면 0, 첫번째 답변글이면 1, 두번째 답변글이면 2
	private int re_level; //답변글 정렬순서 
	
	@CreationTimestamp 

	private Timestamp re_date; //글 등록날짜
}
