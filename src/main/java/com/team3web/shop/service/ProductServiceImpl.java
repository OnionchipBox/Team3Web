package com.team3web.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3web.shop.dao.ProductDAO;
import com.team3web.shop.vo.ProductVO;
@Service
public class ProductServiceImpl implements ProductService {
   @Inject
   ProductDAO productDao;
   @Override
   public List<ProductVO> getAllProudct() {
      return productDao.getAllProudct();
   }

   @Override
   public void addProduct(ProductVO product) {
      productDao.addProduct(product);
   }

   @Override
   public void productModify(ProductVO vo) {
   }

   @Override
   public void productDelete(int productId) {
   }

   @Override
   public ProductVO findById(int productId) {
      
      return productDao.findById(productId);
   }

   @Override
   public List<ProductVO> selectItemsByKeyword(String keyword) {
      
      return productDao.selectItemsByKeyword(keyword);
   }

   @Override
   public List<ProductVO> getProductsByCategoryId(int categoryId) {
      
      return productDao.getProductsByCategoryId(categoryId);
   }

}