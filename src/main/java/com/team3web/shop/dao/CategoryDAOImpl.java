package com.team3web.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.CategoryMapper;
import com.team3web.shop.vo.CategoryVO;


@Repository
public class CategoryDAOImpl implements CategoryDAO {
@Autowired
SqlSession sqlSession;
   @Override
   public List<CategoryVO> getAllCategory() {
      
      return sqlSession.getMapper(CategoryMapper.class).getAllCategory();
   }

   
}