package com.team3web.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.SellerMapper;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
import com.team3web.shop.vo.UserVO;

@Repository
public class SellerDAOImpl implements SellerDAO {
	
	@Autowired
    private SqlSessionTemplate sqlSession;

	@Override
	public void insertSeller(SellerVO seller) {
		sqlSession.getMapper(SellerMapper.class).insertSeller(seller);
	}

	@Override
	public void updateSellerVerify(UserVO user) {
		sqlSession.getMapper(SellerMapper.class).updateSellerVerify(user);
	}

	@Override
	public SellerVO checkSellerId(String id) {
		return sqlSession.getMapper(SellerMapper.class).checkSellerId(id);
	}

	@Override
	public SellerVO checkSellerCode(String code) {
		return sqlSession.getMapper(SellerMapper.class).checkSellerCode(code);
	}

	@Override
	public void DeleteProduct(ProductVO product) {
		sqlSession.getMapper(SellerMapper.class).DeleteProduct(product);
	}

	@Override
	public List<ProductVO> SellerGetProductsByPage(String search, int page, int pageSize) {
		Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("start", (page - 1) * pageSize + 1);
        map.put("end", page * pageSize);

        return sqlSession.getMapper(SellerMapper.class).SellerGetProductsByPage(map);
	}

	@Override
	public int SellerGetTotalProducts(Map<String, Object> map) {
		return sqlSession.getMapper(SellerMapper.class).SellerGetTotalProducts(map);
	}

	@Override
	public List<ProductVO> SellerGetSearchedProductsByPage(Map<String, Object> map) {
		return sqlSession.getMapper(SellerMapper.class).SellerGetSearchedProductsByPage(map);
	}

	@Override
	public int SellerGetTotalSearchedProducts(String search) {
		Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        return sqlSession.getMapper(SellerMapper.class).SellerGetTotalSearchedProducts(map);
	}

}
