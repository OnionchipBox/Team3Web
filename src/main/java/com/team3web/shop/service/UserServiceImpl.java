package com.team3web.shop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team3web.shop.dao.UserDAO;
import com.team3web.shop.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public void insertUser(UserVO user) {
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
}
