package com.soldsoldMarket.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.soldsoldMarket.board.model.dao.BoardDao;
import com.soldsoldMarket.board.model.vo.BAdd;
import com.soldsoldMarket.board.model.vo.board;
import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.product.model.dao.productRegistDao;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;


import com.soldsoldMarket.board.model.vo.BAdd;
import com.soldsoldMarket.board.model.vo.board;

public class BoardService {
	
	// 1:1 문의 등록
	public int insertInquiry(board board) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().insertInquiry(connection, board);
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	// 1:1 문의 파일 등록
	public int insertBAdd(BAdd badd, board board) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().insertBadd(connection, badd, board);
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
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
