package com.team3web.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.CategoryDAO;
import com.team3web.shop.vo.CategoryVO;
@Service
public class CategoryServiceImpl implements CategoryService {
@Autowired
CategoryDAO categoryDAO;
   @Override
   public List<CategoryVO> getAllCategory() {
      
      return categoryDAO.getAllCategory();
   }

}