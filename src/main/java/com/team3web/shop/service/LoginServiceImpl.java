package com.team3web.shop.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.team3web.shop.dao.LoginDAO;
import com.team3web.shop.vo.UserRoleVO;
import com.team3web.shop.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Inject
	LoginDAO LoginDAO;

	@Override
	public int loginCheck(UserVO user, HttpSession session) {
		int result = LoginDAO.loginCheck(user);
		
		if(result == 1) {
			UserRoleVO mvo = viewUserRole(user.getId());
			
			session.setAttribute("id", user.getId());
			session.setAttribute("name", user.getName());
//			session.setAttribute("role", mvo.getRole()); // 등급 저장
//			session.setAttribute("cartCount", cartService.countCart(user.getId()));	// 장바구니 수량 저장
		}
		return result;
	}

	@Override
	public UserVO viewUser(UserVO user) {
		return LoginDAO.viewUser(user);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public String idFind(UserVO user) {
		String result = LoginDAO.idFind(user);
		return result;
	}

	@Override
	public String pwFind(UserVO user) {
		String result = LoginDAO.pwFind(user);
		return result;
	}

	@Override
	public void updatePw(UserVO user) {
		LoginDAO.updatePw(user);
	}

	@Override
	public UserRoleVO viewUserRole(String id) {
		return LoginDAO.viewUserRole(id);
	}

}
