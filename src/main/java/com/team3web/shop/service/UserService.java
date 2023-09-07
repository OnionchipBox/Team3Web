package com.team3web.shop.service;

import com.team3web.shop.vo.UserVO;

public interface UserService {
    UserVO getUserById(String id);
    void registerUser(UserVO user);
    void updateUser(UserVO user);
    void deleteUser(String id);
    
    //회원가입
    public void signup(UserVO vo)throws Exception;
    //로그인 기능
    public UserVO signin(UserVO vo)throws Exception;
    
    public void memberUpdate(UserVO vo)throws Exception;
}
