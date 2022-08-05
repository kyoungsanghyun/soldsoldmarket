package com.soldsoldMarket.mypage.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class M_Board {
	private int no;
	
	private int rowNum;
	
	private String writerId;
	
	private String title;
	
	private String content;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private int readCount;
	
	private String status;
	
	private String answerStatus;
	
	private List<M_Reply> replies;
	
	private Date createDate;
	
	private Date modifyDate;
}