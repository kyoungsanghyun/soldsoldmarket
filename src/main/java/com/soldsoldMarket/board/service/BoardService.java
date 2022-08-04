package com.soldsoldMarket.board.service;

import java.sql.Connection;
import java.util.List;

import com.soldsoldMarket.board.model.dao.BoardDao;
import com.soldsoldMarket.board.model.vo.BAdd;
import com.soldsoldMarket.board.model.vo.board;
import com.soldsoldMarket.common.util.PageInfo;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

public class BoardService {

	public int insertInquiry(board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertBAdd(BAdd badd, board board) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<board> getBoardList(PageInfo pageInfo) {
		List<board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

}
