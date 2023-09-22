package com.team3web.shop.service;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.LoginDAO;
import com.team3web.shop.vo.UserVO;

@Service
public class CustomUserService implements UserDetailsService {
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
    private HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	UserVO userVO = loginDAO.loadUserByUsername(username);

        if (userVO == null) {
            throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + username);
        }
        
        String password = request.getParameter("password");
        String encodedPassword = userVO.getPassword();
        String userRole = loginDAO.getUserRoleById(username);
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + userRole));
        
        System.out.println("비밀번호 대조 실행\n DB에 저장된 암호 : " + encodedPassword + "\n 사용자가 입력한 암호 : "
        		+ password + "\n 로그인할려는 사용자 : " +username);
        System.out.println("사용자 등급 : "+ authorities);

        if (!passwordEncoder.matches(password, encodedPassword)) {
            throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
        }
        
        System.out.println("최종 인증 정보 : "+ userVO.getId() + encodedPassword + authorities);

        return new User(
        	    userVO.getId(),
        	    encodedPassword,
                authorities
        	);
    }
}
