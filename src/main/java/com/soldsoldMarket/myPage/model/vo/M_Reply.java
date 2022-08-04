package com.soldsoldMarket.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class M_Reply {
	private int no;
	
	private int boardNo;
	
	private String writerId;
	
	private String content;	
	
	private Date createDate;
	
	private Date modifyDate;
}