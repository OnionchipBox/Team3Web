package com.team3web.shop.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUserDetails extends User {
	
	private final String name;
	private String nickName;
	private String phone;
	private String address;
	
	public CustomUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities,
			String nickName, String name, String phone, String address) {
        super(username, password, authorities);
        this.nickName = nickName;
        this.name = name;
        this.phone = phone;
        this.address = address;
    }

    public String getNickName() {
        return nickName;
    }
    
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    
    public String getName() {
    	return name;
    }
    
    public String getPhone() {
    	return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getAddress() {
    	return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
}
