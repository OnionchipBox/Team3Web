package com.team3web.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.UserDAO;
import com.team3web.shop.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public UserVO getUserById(String id) {
        return userDAO.getUserById(id);
    }

    @Override
    public void registerUser(UserVO user) {
        userDAO.insertUser(user);
    }

    @Override
    public void updateUser(UserVO user) {
        userDAO.updateUser(user);
    }

    @Override
    public void deleteUser(String id) {
        userDAO.deleteUser(id);
    }
//로그인기능
	@Override
	public UserVO signin(UserVO vo) throws Exception {
		
		return userDAO.signin(vo);
	}
	//회원가입
	@Override
	public void signup(UserVO vo) throws Exception {
		userDAO.signup(vo);
	}

	@Override
	public void memberUpdate(UserVO vo) throws Exception {
		userDAO.memberUpdate(vo);
	}


}

