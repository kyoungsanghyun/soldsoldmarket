package com.soldsoldMarket.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.mypage.model.vo.M_Board;

public class BoardDao {
	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM ASKBOARD WHERE STATUS='Y'";
		
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

	public List<M_Board> findAll(Connection connection, PageInfo pageInfo) {
		List<M_Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RNUM, NO, "
				+ "CREATE_DATE, "
				+ "M_ID, "
				+ "TITLE, "
				+ "ANSWER_STATUS, "
				+ "STATUS "
				+ "FROM ("
				+ 			"SELECT ROWNUM AS RNUM, "
				+ 					"NO, "
				+ 					"CREATE_DATE, "
				+ 					"M_ID, "
				+ 					"TITLE, "
				+ 					"ANSWER_STATUS, "
				+ 					"STATUS "
				+ 					"FROM ("
				+ 						"SELECT A.NO, "
				+ 							"A.CREATE_DATE, "
				+ 							"M.M_ID, "
				+ 							"A.TITLE, "
				+ 							"A.ANSWER_STATUS, "
				+ 							"A.STATUS "
				+ 							"FROM ASKBOARD A "
				+ 							"JOIN MEMBER M ON(A.WRITER_ID = M.M_ID) "
				+ 							"WHERE A.STATUS = 'Y' "
				+ 							"ORDER BY NO DESC"
				+ 					")"
				+ ") WHERE RNUM BETWEEN ? and ? ";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				M_Board board = new M_Board();
				
				board.setRowNum(rs.getInt("RNUM"));
				board.setNo(rs.getInt("NO"));
				board.setCreateDate(rs.getDate("CREATE_DATE"));
				board.setWriterId(rs.getString("M_ID"));
				board.setTitle(rs.getString("TITLE"));
				board.setAnswerStatus(rs.getString("ANSWER_STATUS"));
				board.setStatus(rs.getString("STATUS"));				
				
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

	public M_Board findBoardByNo(Connection connection, int no) {
		M_Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT A.NO, "
							+ "A.TITLE, "
							+ "M.M_ID, "
							+ "A.ORIGINAL_FILENAME, "
							+ "A.RENAMED_FILENAME, "
							+ "A.CONTENT, "
							+ "A.CREATE_DATE, "
							+ "A.MODIFY_DATE "
				+ "FROM ASKBOARD A "
				+ "JOIN MEMBER M ON(A.WRITER_ID = M.M_ID) "
				+ "WHERE A.STATUS = 'Y' AND A.NO=? ";
	           
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new M_Board();
				
				board.setNo(rs.getInt("NO"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriterId(rs.getString("M_ID"));
				board.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				board.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				board.setContent(rs.getString("CONTENT"));
				board.setCreateDate(rs.getDate("CREATE_DATE"));
				board.setModifyDate(rs.getDate("MODIFY_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}

	public int updateStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE ASKBOARD SET STATUS=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, no);		
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertBoard(Connection connection, M_Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO ASKBOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getWriterId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getOriginalFileName());
			pstmt.setString(5, board.getRenamedFileName());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection connection, M_Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET TITLE=?,CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getOriginalFileName());
			pstmt.setString(4, board.getRenamedFileName());
			pstmt.setInt(5, board.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateReadCount(Connection connection, M_Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET READCOUNT=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			board.setReadCount(board.getReadCount() + 1);
			
			pstmt.setInt(1, board.getReadCount());
			pstmt.setInt(2, board.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}