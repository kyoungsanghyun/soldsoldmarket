package com.soldsoldMarket.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Pcomment {

	private int PCm_no;
	
	private String PCm_id;
	
	private int PNo;

	private String PCm_content;
	
	private Date PCm_date;
	
}
