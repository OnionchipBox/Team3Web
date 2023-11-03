package com.team3web.shop.vo;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellerVO {
	
	  private String username;
	   
	   private String userId;
	   private String verify;
	   
	   @NotNull
	   private String sellerName;
	   
	   @NotNull
	   private String sellerRegistrationNumber;

	   private String registrationDate;
	   
	   private int sellerCode;
	   
	   public SellerVO() {}

	   public SellerVO(SellerVO seller, UserVO user) {
	      this.username = seller.getUsername();
	      this.userId = user.getUsername();
	      this.verify = user.getVerify();
	      this.sellerName = seller.getSellerName();
	      this.sellerRegistrationNumber = seller.getSellerRegistrationNumber();
	      this.registrationDate = seller.getRegistrationDate();
	      this.sellerCode = seller.getSellerCode();
	   }

	
}
