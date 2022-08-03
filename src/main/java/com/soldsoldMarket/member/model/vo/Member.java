package com.soldsoldMarket.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	private int no;
	
	private String id;
	
	private String pwd;
	
	private String name;
	
	private Date BDay;
	
	private String gender;
	
	private String address;
	
	private Date joinDate;
	
	private String intro;
	
	private int sellAmount;
	
	private int visit;
	
	private String img;
	
	private String phone;
	
	private String reportCount;
	
	private String area;
	
<<<<<<< HEAD
	private String authority;
=======
	private String author;
	
	private String status;
	
	private int MRowNum;
>>>>>>> 06fd6a62373084a9e45492ce5fb95e8a2d1a765d
}
