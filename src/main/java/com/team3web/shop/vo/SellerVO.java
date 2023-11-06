package com.team3web.shop.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

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
	@Pattern(regexp = "(0-9)+-(0-9)",
	message = "다시 입력하세요.")
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
