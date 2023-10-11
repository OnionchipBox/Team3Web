package com.team3web.shop.mapper;

import java.util.List;
import java.util.Map;

import com.team3web.shop.vo.UserVO;

public interface AdminMapper {
	
	public void updateUserVerify(UserVO user);
	
	public void forceDeleteUser(String id);
	
	public void forceDeleteSeller(String id);
	
	public List<UserVO> getUsersByPage(Map<String, Object> map);

	public int getTotalUsers(Map<String, Object> map);
	
	public List<UserVO> getSearchedUsersByPage(Map<String, Object> map);
	
	public int getTotalSearchedUsers(Map<String, Object> map);
	
}
