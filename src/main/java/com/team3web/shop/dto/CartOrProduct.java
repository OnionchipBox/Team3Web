package com.team3web.shop.dto;

import java.util.List;
import com.team3web.shop.vo.CartVO;
import com.team3web.shop.vo.ProductVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class CartOrProduct {
   //장바구니에 보여질 필드
    private int productId;
   private int cartsize;
   private int quantity;
   private String name;
   private int price;
   private String imageurl;
    

    // getter and setter methods for products and cartItems
}