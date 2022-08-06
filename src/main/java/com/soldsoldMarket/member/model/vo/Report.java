package com.soldsoldMarket.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {

	// 신고 번호
	private int Rno;
	
	// 신고 당한 사람
	private String Mid;
	
	// 신고한 사람
	private String Rid;

}
