package com.team3web.shop.mapper;

import com.team3web.shop.vo.UserVO;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {
	
    public void insertUser(UserVO user);

    public void updateUser(UserVO user);

    public void deleteUser(String id);

    public UserVO selectById(String id);

    public String selectCountById(String id);

    public List<UserVO> selectByName(String name);

    public void updateEnabled(HashMap<String, Object> map);

    public void updatePassword(HashMap<String, Object> map);
}


