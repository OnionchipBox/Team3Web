package com.team3web.shop.dao;

import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.UserMapper;
import com.team3web.shop.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.mybatis.spring.SqlSessionTemplate;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {
	
    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public void insertUser(UserVO user) {
    	sqlSession.getMapper(UserMapper.class).insertUser(user);
    }

    @Override
    public void updateUser(UserVO user) {
        sqlSession.update("UserMapper.updateUser", user);
    }

    @Override
    public void deleteUser(String userId) {
        sqlSession.delete("UserMapper.deleteUser", userId);
    }

    @Override
    public UserVO getUserById(String userId) {
        return sqlSession.selectOne("UserMapper.getUserById", userId);
    }

    @Override
    public List<UserVO> getAllUsers() {
        return sqlSession.selectList("UserMapper.getAllUsers");
    }
}

