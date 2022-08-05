package com.soldsoldMarket.board.model.service;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.close;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.soldsoldMarket.board.model.dao.BoardDao;
import com.soldsoldMarket.board.model.dao.CommentDao;
import com.soldsoldMarket.board.model.vo.Comment;
import com.soldsoldMarket.common.util.PageInfo;

public class CommentService {
	
	public int getCommentCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Comment> getCommentList(PageInfo pageInfo) {
		List<Comment> list = null;
		Connection connection = getConnection();
		
		list = new CommentDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

}
