package com.team3web.shop.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {
     private int productId;
    private String name;
    private int price;
    private int stock;
    private String imageUrl;
    private String pcode;
    private String thumbimg;
    private int categoryId;
    private int seller_id ;
}