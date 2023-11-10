package com.team3web.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.AdminMapper;
import com.team3web.shop.vo.NoticeVO;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.SellerVO;
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
    public void forceDeleteUser(String id) {
        sqlSession.getMapper(AdminMapper.class).forceDeleteUser(id);
    }
    
    @Override
	public void forceDeleteSeller(String id) {
    	sqlSession.getMapper(AdminMapper.class).forceDeleteSeller(id);
	}
    
    @Override
	public void forceDeleteProduct(ProductVO product) {
    	sqlSession.getMapper(AdminMapper.class).forceDeleteProduct(product);
	}
    
    @Override
	public void DeleteProductAll(ProductVO product) {
    	sqlSession.getMapper(AdminMapper.class).DeleteProductAll(product);
    }
    
    // 사용자 영역

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
    
    // 판매업체 영역

	@Override
	public List<SellerVO> getSellerByPage(String search, int page, int pageSize) {
		Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("start", (page - 1) * pageSize + 1);
        map.put("end", page * pageSize);

        return sqlSession.getMapper(AdminMapper.class).getSellerByPage(map);
	}

	@Override
	public int getTotalSeller(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).getTotalSeller(map);
	}

	@Override
	public List<SellerVO> getSearchedSellerByPage(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).getSearchedSellerByPage(map);
	}

	@Override
	public int getTotalSearchedSeller(String search) {
		Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        return sqlSession.getMapper(AdminMapper.class).getTotalSearchedSeller(map);
	}
	
	// 제품 영역

	@Override
	public List<ProductVO> getProductsByPage(String search, int page, int pageSize) {
		Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("start", (page - 1) * pageSize + 1);
        map.put("end", page * pageSize);

        return sqlSession.getMapper(AdminMapper.class).getProductsByPage(map);
	}

	@Override
	public int getTotalProducts(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).getTotalProducts(map);
	}

	@Override
	public List<ProductVO> getSearchedProductsByPage(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).getSearchedProductsByPage(map);
	}

	@Override
	public int getTotalSearchedProducts(String search) {
		Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        return sqlSession.getMapper(AdminMapper.class).getTotalSearchedProducts(map);
	}
	
	// 공지 관련
	
	@Override
	public void insertGongji(NoticeVO g) {
		this.sqlSession.insert("in_gongji",g);
	}

	@Override
	public int getListCount(PageVO p) {
		return this.sqlSession.selectOne("gongji_count",p);
	}

	@Override
	public List<NoticeVO> getGongjiList(PageVO p) {
		return sqlSession.selectList("gongji_list",p);
	}

	@Override
	public NoticeVO getGongjiCont(int no) {
		return this.sqlSession.selectOne("gongji_cont",no);
	}

	@Override
	public void editGongji(NoticeVO g) {
		this.sqlSession.update("gongji_edit",g);			
	}

	@Override
	public void delGongji(int no) {
		this.sqlSession.delete("gongji_del",no);
	}
	
	@Override
	public List<NoticeVO> getList() {
		return sqlSession.selectList("gonglist");
	}
	
	@Override
	public void updateHit(int gno) {
		sqlSession.update("gonghit",gno);
	}

//	@Override
//	public GongjiVO getGongjiCont(int gno) {
//		return sqlSession.selectOne("gongcont",gno);
//	}
}
