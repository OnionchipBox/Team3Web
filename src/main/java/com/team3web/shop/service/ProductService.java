package com.team3web.shop.service;

import java.util.List;

import com.team3web.shop.vo.ProductVO;

public interface ProductService {
    public List<ProductVO> getAllProudct();
    public void addProduct(ProductVO product);
    public void productModify(ProductVO vo) ;
    public void productDelete(int productId);
    public ProductVO findById(int productId);
    public List<ProductVO> selectItemsByKeyword(String keyword);
    public List<ProductVO> getProductsByCategoryId(int categoryId);
}