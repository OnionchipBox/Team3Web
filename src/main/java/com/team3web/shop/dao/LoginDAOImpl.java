package com.team3web.shop.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.LoginMapper;
import com.team3web.shop.vo.UserVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int loginCheck(UserVO user) {
		int result = sqlSession.getMapper(LoginMapper.class).loginCheck(user);
		
		return result;
	}

	@Override
	public UserVO viewUser(UserVO user) {
		return sqlSession.getMapper(LoginMapper.class).viewUser(user);
	}

	@Override
	public void logout(HttpSession httpSession) {
	}

	@Override
	public String pwFind(UserVO user) {
		String result = sqlSession.getMapper(LoginMapper.class).pwFind(user);

		return result;
	}
	
	@Override
	public String idFind(UserVO user) {
		String result = sqlSession.getMapper(LoginMapper.class).idFind(user);

		return result;
	}
	
	@Override
	public void updatePw(UserVO user) {
		sqlSession.getMapper(LoginMapper.class).updatePw(user);
	}

	@Override
	public String getPasswordById(String id) {
		String password = sqlSession.selectOne("com.team3web.shop.mapper.LoginMapper.getPasswordById", id);
		return password;
	}
	
	@Override
    public UserVO getUserById(String id) {
        UserVO user = sqlSession.selectOne("com.team3web.shop.mapper.LoginMapper.getUserById", id);
        return user;
    }

	@Override
	public int getUserRole(String id) {
	    return sqlSession.getMapper(LoginMapper.class).getUserRole(id);
	}
	
	@Override
    public String getUserName(String id) {
        return sqlSession.selectOne("com.team3web.shop.mapper.LoginMapper.getUserName", id);
       
    }

	@Override
	public void updateUser(UserVO user) {
		sqlSession.update("com.team3web.shop.mapper.LoginMapper.updateUser",user);
	}

	@Override
    public void insertUser(UserVO user) {
    	sqlSession.getMapper(LoginMapper.class).insertUser(user);
    }

	@Override
	public UserVO loadUserByUsername(String username) {
	    try {
	        Map<String, Object> parameters = new HashMap<>();
	        parameters.put("id", username);
	        
	        return sqlSession.selectOne("com.team3web.shop.mapper.LoginMapper.loadUserByUsername", parameters);
	    } catch (Exception e) {
	        return null;
	    }
	}
	
	@Override
	public String getUserRoleById(String id) {
	    try {
	        return sqlSession.selectOne("com.team3web.shop.mapper.LoginMapper.loadUserRoleByUsername", id);
	    } catch (Exception e) {
	        return null;
	    }
	}


}
