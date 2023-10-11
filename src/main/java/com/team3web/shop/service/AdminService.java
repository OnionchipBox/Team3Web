package com.team3web.shop.service;

import java.util.List;
import java.util.Map;

import com.team3web.shop.vo.UserVO;

public interface AdminService {
	
	public void updateUserVerify(UserVO user);

	public void forceDeleteUser(String id);
	
	public void forceDeleteSeller(String id);
	
	public List<UserVO> getUsersByPage(String search, int page, int pageSize);

	public int getTotalUsers(Map<String, Object> map);
	
	public List<UserVO> getSearchedUsersByPage(Map<String, Object> map);
	
	public int getTotalSearchedUsers(String search);

}
