package com.team3web.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.AdminGongjiDAO;

@Service
public class AdminGongjiServiceImpl implements AdminGongjiService {

	
	@Autowired
	private AdminGongjiDAO adminGongjidao;
	
	
	
}
