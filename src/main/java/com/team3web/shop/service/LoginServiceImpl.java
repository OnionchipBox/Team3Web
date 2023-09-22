package com.team3web.shop.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
<<<<<<< HEAD
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
=======
import org.springframework.security.crypto.password.PasswordEncoder;
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
import org.springframework.security.crypto.password.PasswordEncoder;
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.LoginDAO;
import com.team3web.shop.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Inject
	LoginDAO LoginDAO;
	
<<<<<<< HEAD
<<<<<<< HEAD
	@Autowired
    private BCryptPasswordEncoder BCryptPasswordEncoder;

    @Autowired
    public LoginServiceImpl(LoginDAO LoginDAO) {
        this.LoginDAO = LoginDAO;
=======
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
	private final PasswordEncoder passwordEncoder;

    @Autowired
    public LoginServiceImpl(LoginDAO LoginDAO, PasswordEncoder passwordEncoder) {
        this.LoginDAO = LoginDAO;
        this.passwordEncoder = passwordEncoder;
<<<<<<< HEAD
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
    }

    @Override
	public int loginCheck(UserVO user, HttpSession session) {
		UserVO dbUser = LoginDAO.getUserById(user.getId());

        if (dbUser != null) {
<<<<<<< HEAD
<<<<<<< HEAD
            if (BCryptPasswordEncoder.matches(user.getPassword(), dbUser.getPassword())) {
=======
            if (passwordEncoder.matches(user.getPassword(), dbUser.getPassword())) {
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
            if (passwordEncoder.matches(user.getPassword(), dbUser.getPassword())) {
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
                return 1;
            }
        }
        return 0;
    }
<<<<<<< HEAD
<<<<<<< HEAD
    @Override
    public boolean changePassword(String userId, String oldPassword, String newPassword) {
    	UserVO dbUser = LoginDAO.getUserById(userId);
    	if(dbUser!=null) {
    		if(BCryptPasswordEncoder.matches(oldPassword, dbUser.getPassword())) {
    			String encodedNewPassword = BCryptPasswordEncoder.encode(newPassword);
    		dbUser.setPassword(encodedNewPassword);
    		LoginDAO.updateUser(dbUser);
    		return true;
    		}
    	}
    	return false;
    	
    }
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414

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
	public String getPasswordById(String id) {
		return null;
	}

	@Override
	public UserVO getUserById(String id) {
<<<<<<< HEAD
<<<<<<< HEAD
		return LoginDAO.getUserById(id);
=======
		return null;
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
		return null;
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
	}

	@Override
	public int getUserRole(String id) {
	    int userRole = LoginDAO.getUserRole(id);
	    return userRole;
	}
	
	@Override
    public String getUserName(String id) {
        return LoginDAO.getUserName(id);
    }
<<<<<<< HEAD
<<<<<<< HEAD

	@Override
	public void updateUser(UserVO user) {
		LoginDAO.updateUser(user);
	}

	@Override
	public void insertUser(UserVO user) {
		LoginDAO.insertUser(user);
	}
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
}