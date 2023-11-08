package com.team3web.shop.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class GongjiVO{
	
	private int gno;
	private String gname;
	private String gtitle;
	private String gpwd;
	private String gcont;
	private int ghit;
	private Date gdate;
	
}
