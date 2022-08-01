package com.soldsoldMarket.board.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
public class board {
	
	private int BId;
	
	private char BType;
	
	private String BTitle;
	
	private Timestamp BTimeStamp;
	
	private int BView;
	
	private int BLike;
	
	private String BContent;
	
	private char BSecret;
	
	private int BSecretNumber;
	
	private int BRef;
	
	private int BReStep;
	
	private int BReLevel;
	
	private String MId;
	
}
