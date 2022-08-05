package com.soldsoldMarket.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.board.model.vo.BAdd;
import com.soldsoldMarket.board.model.vo.board;
import com.soldsoldMarket.common.util.PageInfo;


public class BoardDao {
	
	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM BOARD";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

	public List<board> findAll(Connection connection, PageInfo pageInfo) {
		List<board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, B_ID, B_TITLE, B_TIMESTAMP, B_CONTENT, M_ID "
				+ "FROM ("
				+    "SELECT ROWNUM AS RNUM, "
				+           "B_ID, "
				+           "B_TITLE, "
				+ 			"B_TIMESTAMP, "
				+ 			"B_CONTENT, "
				+ 			"M_ID "
				+ 	 "FROM ("
				+ 	    "SELECT B.B_ID, "
				+ 			   "B.B_TITLE, "
				+  			   "B.B_TIMESTAMP, "
				+ 			   "B.B_CONTENT, "
				+ 			   "M.M_ID "
				+ 		"FROM BOARD B "
				+ 		"JOIN MEMBER M ON(B.M_ID = M.M_ID) "
				+ 		"ORDER BY B.B_ID DESC"
				+ 	 ")"
				+ ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board board = new board();
				
				board.setBRowNum(rs.getInt("RNUM"));
				board.setBId(rs.getInt("B_ID"));
				board.setBTitle(rs.getString("B_TITLE"));
				board.setBContent(rs.getString("B_CONTENT"));
				board.setBTimeStamp(rs.getTimestamp("B_TIMESTAMP"));
				board.setMId(rs.getString("M_ID"));
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return list;
	}
	
	public int insertInquiry(Connection connection, board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO BOARD VALUES(SEQ_PRODUCT_NO.NEXTVAL,?,?,DEFAULT,DEFAULT,DEFAULT,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT,?,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, String.valueOf(board.getBType()));
			pstmt.setString(2, board.getBTitle());
			pstmt.setString(3, board.getBContent());
			pstmt.setString(4, board.getMId());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int insertBadd(Connection connection, BAdd badd, board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO BADD VALUES(SEQ_BADD_NO.NEXTVAL,?,?,?,?,?,SEQ_PRODUCT_NO.NEXTVAL-1)";
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, badd.getBAimg1());
			pstmt.setString(2, badd.getBAimg2());
			pstmt.setString(3, badd.getBAimg3());
			pstmt.setString(4, badd.getBAimg4());
			pstmt.setString(5, badd.getBAimg5());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}