package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.team3web.shop.dao.UserDAO;
import com.team3web.shop.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	private final UserDAO userDAO;

	@Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public void insertUser(UserVO user) {
    	user.setPassword(passwordEncoder.encode(user.getPassword()));	// 가입시 비밀번호 암호화
        userDAO.insertUser(user);
    }

    @Override
    public void updateUser(UserVO user) {
        userDAO.updateUser(user);
    }

    @Override
    public void deleteUser(String userId) {
        userDAO.deleteUser(userId);
    }
    
    @Override
    public String findUserId(UserVO userId) {
        return userDAO.findUserId(userId);
    }

    @Override
    public String findPassword(UserVO userPw) {
        return userDAO.findPassword(userPw);
    }
    
    @Override
	public void updatePassword(UserVO user) {
    	user.setPassword(passwordEncoder.encode(user.getPassword()));
    	userDAO.updatePassword(user);
	}

    @Override
    public UserVO getUserById(String id) {
        return userDAO.getUserById(id);
    }

    @Override
    public List<UserVO> getAllUsers() {
        return userDAO.getAllUsers();
    }
	
	@Override
    public int getUserRole(int verify) {
        return userDAO.getUserRole(verify);
    }



}