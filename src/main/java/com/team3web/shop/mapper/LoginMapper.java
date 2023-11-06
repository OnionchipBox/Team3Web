package com.team3web.shop.mapper;

import java.util.Map;

import com.team3web.shop.vo.UserVO;

public interface LoginMapper {
	
	public int loginCheck(UserVO user);
	
	void insertAutoLoginToken(Map<String, Object> autoLoginInfo);
	
    Map<String, Object> findAutoLoginToken(String id);
    
    void deleteAutoLoginInfoById(String id);

	public UserVO loadUserByUsername(String username);
	
	public String getUserRoleById(String id);

	public UserVO viewUser(UserVO user);
	
	public String idFind(UserVO user);

	public String pwFind(UserVO user);

	public void updatePw(UserVO user);
	
	public String getPasswordById(String id);

	public UserVO getUserById(String id);
	
	public int getUserRole(String id);
	
	public String getUserName(String id);
	
    public void updateUser(UserVO user);

	public void insertUser(UserVO user);
}
