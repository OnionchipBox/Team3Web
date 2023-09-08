package com.team3web.shop.service;

import javax.servlet.http.HttpSession;

import com.team3web.shop.vo.UserRoleVO;
import com.team3web.shop.vo.UserVO;


public interface LoginService {
	
	public int loginCheck(UserVO user, HttpSession session);
	
	public UserVO viewUser(UserVO user);
	
	public void logout(HttpSession session);
	
	public String idFind(UserVO user);
	
	public String pwFind(UserVO user);

	public void updatePw(UserVO user);
	
	public UserRoleVO viewUserRole(String id);

}
