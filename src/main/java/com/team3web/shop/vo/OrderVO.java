package com.team3web.shop.vo;

import java.security.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
    private String username;
    private String oderId;
    private String merchant_uid; //카카오페이결제시 필요한 주문번호
    private String zipcode;// 상세주소 o
    private String name;//이름 o
    private int price;// 가격 o
    private String phone;// 폰번호 o
    private String status; //처리상태
    private Timestamp odate;//주문날짜
    private String address1;//주소 o address1
    private String address2;// 상세주소 o address2
    private String req; //요청사항
    
    
}