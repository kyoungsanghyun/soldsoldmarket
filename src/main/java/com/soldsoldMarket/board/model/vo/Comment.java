package com.soldsoldMarket.board.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	
	private String CMid;
	
    private int BId;
    
    private String CMcontent;
    
    private int CRowNum;

}
