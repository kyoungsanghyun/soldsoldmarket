package com.soldsoldMarket.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	private String id;
	private String pwd;
	private String name;
	private Date bDay;
	private String gender;
	private String address;
	private Date joinDate;
	private String intro;
	private int sellAmount;
	private int visit;
	private String img;
	private String phone;
	private String report;
	private String area;
	private String email;
	private String authority;
}
