package com.team3web.shop.dao;

import com.team3web.shop.vo.UserVO;

public interface UserDAO {
    UserVO getUserById(String id);
    void insertUser(UserVO user);
    void updateUser(UserVO user);
    void deleteUser(String id);
    //회원가입
    public void signup(UserVO vo)throws Exception;
    //일반 웹사이트 로그인 
    public UserVO signin(UserVO vo) throws Exception;
    
    public void memberUpdate(UserVO vo)throws Exception;
}
