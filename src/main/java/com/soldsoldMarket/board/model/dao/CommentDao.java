package com.soldsoldMarket.board.model.dao;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.soldsoldMarket.board.model.vo.Comment;
import com.soldsoldMarket.common.util.PageInfo;

public class CommentDao {
	
	public int getCommnetCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM COMMENTS";
		
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
	

	public List<Comment> findAll(Connection connection, PageInfo pageInfo) {
		List<Comment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, CM_ID, B_ID, CM_CONTENT "
						+ "FROM ("
						+    "SELECT ROWNUM AS RNUM, "
						+           "CM_ID, "
						+           "B_ID, "
						+           "CM_CONTENT "
						+ 	 "FROM ("
						+ 	    "SELECT C.CM_ID, "
						+ 			   "B.B_ID, "
						+ 			   "C.CM_CONTENT "
						+ 		"FROM COMMENTS C "
						+ 		"JOIN BOARD B ON(C.B_ID = B.B_ID) "
						+ 		"ORDER BY C.CM_ID DESC"
						+ 	 ")"
						+  ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment comment = new Comment();
				
				comment.setCRowNum(rs.getInt("RNUM"));
				comment.setCMid(rs.getString("CM_ID"));
				comment.setBId(rs.getInt("B_ID"));
				comment.setCMcontent(rs.getString("CM_CONTENT"));
				
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return list;
	}

}
