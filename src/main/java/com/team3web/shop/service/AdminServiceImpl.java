package com.team3web.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.AdminDAO;
import com.team3web.shop.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	private final AdminDAO adminDAO;
	
	@Autowired
	public AdminServiceImpl(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	public void updateUserVerify(UserVO user) {
		adminDAO.updateUserVerify(user);
	}

	@Override
	public void forceDeleteUser(String id) {
		adminDAO.forceDeleteUser(id);
	}
	
	@Override
	public void forceDeleteSeller(String id) {
		adminDAO.forceDeleteSeller(id);
	}

	@Override
	public List<UserVO> getUsersByPage(String search, int page, int pageSize) {
		return adminDAO.getUsersByPage(search, page, pageSize);
	}

	@Override
	public int getTotalUsers(Map<String, Object> map) {
		return adminDAO.getTotalUsers(map);
	}

	@Override
	public List<UserVO> getSearchedUsersByPage(Map<String, Object> map) {
		return adminDAO.getSearchedUsersByPage(map);
	}

	@Override
	public int getTotalSearchedUsers(String search) {
		return adminDAO.getTotalSearchedUsers(search);
	}

}
