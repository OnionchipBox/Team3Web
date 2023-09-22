package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
=======
import org.springframework.security.crypto.password.PasswordEncoder;
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
import org.springframework.stereotype.Service;
import com.team3web.shop.dao.UserDAO;
import com.team3web.shop.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	private final UserDAO userDAO;
<<<<<<< HEAD
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
=======
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(UserDAO userDAO, PasswordEncoder passwordEncoder) {
        this.userDAO = userDAO;
        this.passwordEncoder = passwordEncoder;
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
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
    public UserVO getUserById(String userId) {
        return userDAO.getUserById(userId);
    }

    @Override
    public List<UserVO> getAllUsers() {
        return userDAO.getAllUsers();
    }
	
	@Override
    public int getUserRole(int verify) {
        return userDAO.getUserRole(verify);
<<<<<<< HEAD
        
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
    }
}