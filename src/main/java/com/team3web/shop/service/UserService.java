package com.team3web.shop.service;

import java.util.List;
import java.util.Map;

import com.team3web.shop.vo.UserVO;

public interface UserService {
	
	public void paid(Map<String, Object> map);

	public void rePaid(Map<String, Object> map);

	public String paidCheck(String ID);
	
	public void insertUser(UserVO user); // 사용자 삽입
	
	public void updateUser(UserVO user); // 사용자 업데이트
	
	public void deleteUser(String userId); // 사용자 삭제

	public String findUserId(UserVO userId);

    public String findPassword(UserVO userPw);
    
    public void updatePassword(UserVO user);
	
	public UserVO getUserById(String id); // 아이디로 사용자 조회
	
	public List<UserVO> getAllUsers(); // 모든 사용자 조회
	
	int getUserRole(int verify); // 등급 조회
}