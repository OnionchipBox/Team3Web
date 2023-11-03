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
	
	@NotNull
	private String seller_name;
	
	@NotNull
	private String seller_registration_number;

	private String registration_date;
	
	public SellerVO() {}

	public SellerVO(SellerVO seller) {
		this.username = seller.getUsername();
		this.seller_name = seller.getSeller_name();
		this.seller_registration_number = seller.getSeller_registration_number();
		this.registration_date = seller.getRegistration_date();
	}
	
}
