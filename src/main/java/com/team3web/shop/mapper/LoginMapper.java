package com.team3web.shop.mapper;

import com.team3web.shop.vo.UserVO;

public interface LoginMapper {
	
	public int loginCheck(UserVO user);
	
<<<<<<< HEAD
<<<<<<< HEAD
	public UserVO loadUserByUsername(String username);
	
	public String getUserRoleById(String id);
	
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
	public UserVO viewUser(UserVO user);
	
	public String idFind(UserVO user);

	public String pwFind(UserVO user);

	public void updatePw(UserVO user);
	
	public String getPasswordById(String id);

	public UserVO getUserById(String id);
	
	public int getUserRole(String id);
	
	public String getUserName(String id);
<<<<<<< HEAD
<<<<<<< HEAD
	
    public void updateUser(UserVO user);

	public void insertUser(UserVO user);
=======

>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======

>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
}
