package com.team3web.shop.vo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name="review01")
@EqualsAndHashCode(of="reno")
public class ReviewVO {

	
	@Id // 기본키 지정 
	private int reno; //review 번호 
	
	private String rename2; //글쓴이
	private String retitle; //글제목
	private String repwd; //비밀번호
	
	@Column(length=4000) //컬럼크기를 4000으로 설정
	private String recont; //내용 
	
	private String refile; //첨부파일경로와 파일명 저장할 변수
	private int rehit; // 조회수
	
	//계단형 계층형 자료실을 만들기 위해서 필요한 것 = > 관리자 답변 기능 추가 컬럼
	private int reref; //글 그룹번호 => 원본글과 답변글을 묶어주는 기능을 한다.
	private int restep; //원본글과 답변글을 구분하는 번호값이면 몇번째 답변글인가를 알려준다.
						// 원본 글이면 0, 첫번째 답변글이면 1, 두번째 답변글이면 2
	private int relevel; //답변글 정렬순서 
	
	private String thumbimg;
	
	@CreationTimestamp 
	private Timestamp redate; //글 등록날짜
}
