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
    	sqlSession.getMapper(UserMapper.class).updateUser(user);
    }

    @Override
    public void deleteUser(String userId) {
    	sqlSession.getMapper(UserMapper.class).deleteUser(userId);
    }

    @Override
    public String findUserId(UserVO userId) {
        return sqlSession.getMapper(UserMapper.class).findUserId(userId);
    }

    @Override
    public String findPassword(UserVO userPw) {
    	return sqlSession.getMapper(UserMapper.class).findPassword(userPw);
    }
    
    @Override
	public void updatePassword(UserVO user) {
    	sqlSession.getMapper(UserMapper.class).updatePassword(user);
	}
    
    @Override
    public UserVO getUserById(String id) {
        return sqlSession.selectOne("UserMapper.getUserById", id);
    }

    @Override
    public List<UserVO> getAllUsers() {
        return sqlSession.selectList("UserMapper.getAllUsers");
    }

	@Override
	public int getUserRole(int verify) {
		return sqlSession.selectOne("UserMapper.getUserRole", verify);
	}

}