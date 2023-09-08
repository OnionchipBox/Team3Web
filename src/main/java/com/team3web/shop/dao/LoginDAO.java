package com.team3web.shop.dao;

import javax.servlet.http.HttpSession;

import com.team3web.shop.vo.UserRoleVO;
import com.team3web.shop.vo.UserVO;

public interface LoginDAO {

	public int loginCheck(UserVO user);
			
	public UserVO viewUser(UserVO user);
			
	public void logout(HttpSession httpSession);
		
	public String idFind(UserVO user);
		
	public String pwFind(UserVO user);

	public void updatePw(UserVO user);
		
	public UserRoleVO viewUserRole(String id);
}
