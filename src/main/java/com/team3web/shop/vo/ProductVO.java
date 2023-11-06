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
    private String category;
    
    private int sellerCode;
    
    public ProductVO() {}
    
    public ProductVO(ProductVO product, SellerVO seller) {
    	this.productId = product.getProductId();
    	this.name = product.getName();
    	this.price = product.getPrice();
    	this.stock = product.getStock();
    	this.imageUrl = product.getImageUrl();
    	this.pcode = product.getPcode();
    	this.thumbimg = product.getThumbimg();
    	this.category = product.getCategory();
    	this.sellerCode = seller.getSellerCode();
    }
}