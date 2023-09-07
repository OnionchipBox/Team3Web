package com.team3web.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SqlSession sqlSession;
	private static String namespace = "com.team3web.shop.mapper.UserMapper";
    @Override
    public UserVO getUserById(String id) {
        return sqlSession.selectOne("userMapper.getUserById", id);
    }

    @Override
    public void insertUser(UserVO user) {
        sqlSession.insert("userMapper.insertUser", user);
    }

    @Override
    public void updateUser(UserVO user) {
        sqlSession.update("userMapper.updateUser", user);
    }

    @Override
    public void deleteUser(String id) {
        sqlSession.delete("userMapper.deleteUser", id);
    }

	@Override
	public UserVO signin(UserVO vo) throws Exception {
		return sqlSession.selectOne(namespace +".signin",vo);
	}

	@Override
	public void signup(UserVO vo) throws Exception {
		sqlSession.insert(namespace + ".signup", vo);
	}

	@Override
	public void memberUpdate(UserVO vo) throws Exception {
		sqlSession.update(namespace+".memberUpdate",vo);
		
	}
	
}

