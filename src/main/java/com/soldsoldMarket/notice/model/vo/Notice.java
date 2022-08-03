package com.soldsoldMarket.notice.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	private int rowNum;
	
	private int no;
	
	private String writerId;
	
	private String title;
	
	private String content;
	
	private int readCount;
	
	private String status;
	
	private Date createDate;
	
	private String originalFileName;
	
	private String renamedFileName;
	
}