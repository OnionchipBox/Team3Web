package com.team3web.shop.mapper;

import com.team3web.shop.vo.UserVO;

public interface UserMapper {
	
	

    UserVO getUserById(String id);

    void updateUser(UserVO user);
    void deleteUser(String id);
    
    void signup(UserVO user);
    UserVO signin(String id);

    
//	public int insertUser(UserVO user);
//	public UserVO loginUser(UserVO user);

    
}

