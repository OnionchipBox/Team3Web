package com.team3web.shop.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.team3web.shop.dao.VueDao;

@Controller
@RequestMapping("/jq")
public class TestController {
	
	@Autowired
	VueDao vdao;
	
	@RequestMapping("/jq.cls")
	public ModelAndView main(ModelAndView mv, HttpSession s, RedirectView rv) {
		mv.setViewName("jq/test");
		return mv;
	}
	@RequestMapping("/pay.cls")
	public ModelAndView serve(ModelAndView mv, HttpSession s, RedirectView rv) {
		mv.setViewName("jq/serve");
		return mv;
	}
	
	@RequestMapping("/kakaopay.cls")
	@ResponseBody
	public String kakaopay() {
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready"); // 주소
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); // 서버 연결 //강제 형변환
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 072286143912588926e8aefdc82aaa9f");
			conn.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true); // 연결을 통해서 서버에게 전해줄 것이 있을 때 true (DoInput은 기본적으로 true로 되어 있고, DoOutput은 기본 설정이 false로 되어 있어서 변경해주는 것)
		
						//전해줄 파라미터 
			String param ="cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=https://localhost7996/cls/jq/pay.cls&fail_url=https://localhost7996/fail&cancel_url=https://localhost7996/cancel";
						
						//주는 변수 
			OutputStream out = conn.getOutputStream();
							//데이터 주는 객체	
			DataOutputStream data = new DataOutputStream(out);			
			data.writeBytes(param);
			
			//data.flush(); 
			data.close();
			
			
			//통신 관련 
			
			int result = conn.getResponseCode();
						//받는 변수
			InputStream input;
			if(result==200) { //200은 정상코드 - > 성공했을 경우 
				input = conn.getInputStream();
			}else {
				input = conn.getErrorStream();
			}
								//읽는 변수
			InputStreamReader inread = new InputStreamReader(input);
			BufferedReader buff = new BufferedReader(inread);
							//형 변환 변수 
			return buff.readLine(); // 문자열로 형 변환 후 자신은 비워진다.
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	
	  @GetMapping("/success.cls")
	    public String kakaoPaySuccess() {
	        return "home";
	    }
	
}
