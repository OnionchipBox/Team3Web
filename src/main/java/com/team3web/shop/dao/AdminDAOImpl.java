package com.team3web.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.AdminMapper;
import com.team3web.shop.vo.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public void updateUserVerify(UserVO user) {
        sqlSession.getMapper(AdminMapper.class).updateUserVerify(user);
    }

    @Override
    public void forceDeleteUser(String username) {
        sqlSession.getMapper(AdminMapper.class).forceDeleteUser(username);
    }
    
    @Override
	public void forceDeleteSeller(String username) {
    	sqlSession.getMapper(AdminMapper.class).forceDeleteSeller(username);
	}

    @Override
    public List<UserVO> getUsersByPage(String search, int page, int pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("start", (page - 1) * pageSize + 1);
        map.put("end", page * pageSize);

        return sqlSession.getMapper(AdminMapper.class).getUsersByPage(map);
    }

    @Override
    public int getTotalUsers(Map<String, Object> map) {
        return sqlSession.getMapper(AdminMapper.class).getTotalUsers(map);
    }

    @Override
    public List<UserVO> getSearchedUsersByPage(Map<String, Object> map) {
        return sqlSession.getMapper(AdminMapper.class).getSearchedUsersByPage(map);
    }

    @Override
    public int getTotalSearchedUsers(String search) {
        Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        return sqlSession.getMapper(AdminMapper.class).getTotalSearchedUsers(map);
    }

}
