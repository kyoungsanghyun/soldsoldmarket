package com.soldsoldMarket.mypage.model.service;

import java.sql.Connection;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.mypage.model.dao.BoardDao;
import com.soldsoldMarket.mypage.model.vo.M_Board;

public class BoardService {

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<M_Board> getBoardList(PageInfo pageInfo) {
		List<M_Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public M_Board getBoardByNo(int no, boolean hasRead) {
		M_Board board = null;
		Connection connection = getConnection();
		
		board = new BoardDao().findBoardByNo(connection, no);
		
		// 게시글 조회수 증가 로직
		if(board != null && !hasRead) {
			int result = new BoardDao().updateReadCount(connection, board);
				
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		
		close(connection);
		
		return board;
	}

	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().updateStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int save(M_Board board) {
	      int result = 0;
	      Connection connection = getConnection();
	      
	      
	      if(board.getNo() != 0){ 
	    	  result = new BoardDao().updateBoard(connection, board);
	      } else {
	    	  result = new BoardDao().insertBoard(connection, board);
	      }
	      
	      if(result > 0) {
	    	  commit(connection);
	      } else {
	    	  rollback(connection);
	      }
	      
	      
	      close(connection);
	      
	      
	      
	      return result;
	   }
}