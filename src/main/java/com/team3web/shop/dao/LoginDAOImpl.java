package com.team3web.shop.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.LoginMapper;
import com.team3web.shop.vo.UserRoleVO;
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
	public UserRoleVO viewUserRole(String id) {
		return sqlSession.getMapper(LoginMapper.class).viewUserRole(id);
	}
}
