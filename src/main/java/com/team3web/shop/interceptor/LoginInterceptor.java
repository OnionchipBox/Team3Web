package com.team3web.shop.interceptor;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.team3web.shop.service.LoginService;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    @Qualifier("AuthenticationManager")
    private AuthenticationManager authenticationManager;

    @Autowired
    private LoginService loginService;

    private RememberMeServices rememberMeServices;

    public LoginInterceptor(RememberMeServices rememberMeServices) {
        this.rememberMeServices = rememberMeServices;
    }

//    public String generateAutoLoginToken() {
//        return UUID.randomUUID().toString();
//    }
//
//    public Timestamp calculateAutoLoginExpirationDate() {
//        Calendar calendar = Calendar.getInstance();
//        calendar.add(Calendar.HOUR_OF_DAY, 24);
//        return new Timestamp(calendar.getTime().getTime());
//    }

    @Override // 시큐리티로 자동 로그인 대체
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        System.out.println("실행 체크");
//        String id = request.getParameter("id");
//        
//        if (id != null) {
//            Map<String, Object> autoLoginDBInfo = loginService.findAutoLoginToken(id);
//            boolean rememberMe = request.getParameter("rememberMe") != null;
//
//            if (rememberMe && autoLoginDBInfo == null) {
//                System.out.println("인터셉터 실행 if 체크");
//                String autoLoginToken = generateAutoLoginToken();
//                Map<String, Object> autoLoginInfo = new HashMap<>();
//                autoLoginInfo.put("id", id);
//                autoLoginInfo.put("autoLoginToken", autoLoginToken);
//                autoLoginInfo.put("expirationDate", calculateAutoLoginExpirationDate());
//                loginService.insertAutoLoginToken(autoLoginInfo);
//
//                Authentication authentication = new UsernamePasswordAuthenticationToken(id, null);
//                Authentication authenticatedUser = authenticationManager.authenticate(authentication);
//                SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
//                rememberMeServices.loginSuccess(request, response, authenticatedUser);
//            } else if (rememberMe && autoLoginDBInfo != null) {
//                System.out.println("인터셉터 실행 else if 체크");
//                loginService.deleteAutoLoginInfoById(id);
//
//                String autoLoginToken = generateAutoLoginToken();
//                Map<String, Object> autoLoginInfo = new HashMap<>();
//                autoLoginInfo.put("id", id);
//                autoLoginInfo.put("autoLoginToken", autoLoginToken);
//                autoLoginInfo.put("expirationDate", calculateAutoLoginExpirationDate());
//                loginService.insertAutoLoginToken(autoLoginInfo);
//
//                Authentication authentication = new UsernamePasswordAuthenticationToken(id, null);
//                Authentication authenticatedUser = authenticationManager.authenticate(authentication);
//                SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
//                rememberMeServices.loginSuccess(request, response, authenticatedUser);
//            }
//        }
//
          return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
        // postHandle 코드 추가 (필요한 경우)
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        // afterCompletion 코드 추가 (필요한 경우)
    }
}
