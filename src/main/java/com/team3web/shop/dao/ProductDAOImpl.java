package com.team3web.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.ProductMapper;
import com.team3web.shop.vo.ProductVO;
@Repository
public class ProductDAOImpl implements ProductDAO {

   @Inject
   SqlSession sqlSession;
   @Override
   public List<ProductVO> getAllProudct() {
      return sqlSession.getMapper(ProductMapper.class).getAllProduct();
   }
   @Override
   public void addProduct(ProductVO product) {

       sqlSession.getMapper(ProductMapper.class).addProduct(product);
   }

   @Override
   public void productModify(ProductVO vo) {
   }

   @Override
   public void productDelete(int productId) {
   }
   @Override
   public ProductVO findById(int productId) {
      
      return sqlSession.selectOne("findById", productId);
   }
   @Override
   public List<ProductVO> selectItemsByKeyword(String keyword) {
      
      return sqlSession.getMapper(ProductMapper.class).selectItemsByKeyword(keyword);
   }
   @Override
   public List<ProductVO> getProductsByCategoryId(int categoryId) {
      
      return sqlSession.getMapper(ProductMapper.class).getProductsByCategoryId(categoryId);
   }

   

}