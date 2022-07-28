package com.soldsoldMarket.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

	private int PNo;

	private String PId;
	
	private String PName;
	
	private int PPrice;
	
	private String PQlt;
	
	private String PTrading;
	
	private String PLocation;
	
	private String PExchange;
	
	private int PQtt;
	
	private String PContents;
		
	private int PView;
	
	private String PLike;

	private int CId;
	
	private Date PDate;
	
	private int PRowNum;
}
