package com.team3web.shop.dao;

import java.util.List;
import java.util.Map;

import com.team3web.shop.vo.UserVO;

public interface AdminDAO {
	
	public void updateUserVerify(UserVO user);
	
	public void forceDeleteUser(String username);
	
	public void forceDeleteSeller(String username);
	
	public List<UserVO> getUsersByPage(String search, int page, int pageSize);

	public int getTotalUsers(Map<String, Object> map);
	
	public List<UserVO> getSearchedUsersByPage(Map<String, Object> map);
	
	public int getTotalSearchedUsers(String search);
}
