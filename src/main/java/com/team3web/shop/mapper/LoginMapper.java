package com.team3web.shop.mapper;

import com.team3web.shop.vo.UserRoleVO;
import com.team3web.shop.vo.UserVO;

public interface LoginMapper {
	
	public int loginCheck(UserVO user);
	
	public UserVO viewUser(UserVO user);
	
	public String idFind(UserVO user);

	public String pwFind(UserVO user);

	public void updatePw(UserVO user);

	public UserRoleVO viewUserRole(String id);
	
	


}
