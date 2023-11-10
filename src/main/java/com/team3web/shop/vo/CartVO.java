package com.team3web.shop.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
private int   cartId;
private String username;        // 사용자 ID 설정
private int productId;    // 제품 ID 설정
private int quantity;      // 수량 설정
private String cartSize; 
}