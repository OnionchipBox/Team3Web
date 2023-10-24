package com.team3web.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3web.shop.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {

	
	@Autowired
	private ReviewDAO reviewDao;
	
	
}