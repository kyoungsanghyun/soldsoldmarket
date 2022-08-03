package com.soldsoldMarket.notice.model.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.notice.model.vo.Notice;

public class NoticeDao {

	public int getNoticeCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM NOTICE WHERE STATUS='Y'";

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

	public List<Notice> getNoticeList(Connection connection, PageInfo pageInfo) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList<>();
		String query = 
				"SELECT RNUM, NO, TITLE, WRITER_ID, CREATE_DATE, READCOUNT, STATUS,RENAMED_FILENAME, ORIGINAL_FILENAME \r\n"
				+ "FROM (\r\n"
				+ "    SELECT ROWNUM AS RNUM, NO, TITLE, WRITER_ID, CREATE_DATE, READCOUNT, STATUS ,RENAMED_FILENAME, ORIGINAL_FILENAME\r\n"
				+ "    FROM (\r\n"
				+ "        SELECT  NO, TITLE, WRITER_ID, CREATE_DATE, READCOUNT, STATUS , RENAMED_FILENAME, ORIGINAL_FILENAME\r\n"
				+ "        FROM NOTICE  \r\n"
				+ "        WHERE STATUS = 'Y'  ORDER BY NO DESC\r\n"
				+ "    )\r\n"
				+ ")WHERE RNUM BETWEEN ? and ?";
		
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, pageInfo.getStartList());
			pstm.setInt(2, pageInfo.getEndList());

			rs = pstm.executeQuery();
			while(rs.next()) {
				Notice notice = new Notice();

				notice.setRowNum(rs.getInt("RNUM"));
				notice.setWriterId(rs.getString("WRITER_ID"));
				notice.setTitle(rs.getString("TITLE"));
				notice.setNo(rs.getInt("NO"));
				notice.setCreateDate(rs.getDate("CREATE_DATE"));
				notice.setReadCount(rs.getInt("READCOUNT"));
				notice.setStatus(rs.getString("STATUS"));
				notice.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				notice.setRenamedFileName(rs.getString("RENAMED_FILENAME"));

				list.add(notice);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		
		
		
		
		return list;
	}

	public Notice findNoticeByNo(Connection connection, int no) {
		Notice notice = new Notice();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String query    = "SELECT  NO, TITLE, WRITER_ID, READCOUNT, CONTENT, CREATE_DATE,ORIGINAL_FILENAME,RENAMED_FILENAME\r\n"
				+ "FROM NOTICE \r\n"
				+ "WHERE STATUS = 'Y' AND NO=?";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, no);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				notice.setTitle(rs.getString("TITLE"));
				notice.setNo(rs.getInt("NO"));
				notice.setWriterId(rs.getString("WRITER_ID"));
				notice.setReadCount(rs.getInt("READCOUNT"));
				notice.setContent(rs.getString("CONTENT"));
				notice.setCreateDate(rs.getDate("CREATE_DATE"));
				notice.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				notice.setRenamedFileName(rs.getString("RENAMED_FILENAME"));

			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		
		
		return notice;
	}

	public int updateReadCount(Connection connection, Notice notice) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE NOTICE SET READCOUNT=? WHERE NO=?";
		
		try {
			pstm  =connection.prepareStatement(query);
			
			notice.setReadCount(notice.getReadCount()+1);

			pstm.setInt(1, notice.getReadCount());
			pstm.setInt(2, notice.getNo());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		
		
		return result;
	}

	public int insertNotice(Connection connection, Notice notice) {
		int result = 0;
		
		PreparedStatement pstm = null;
		
		String query = " INSERT INTO NOTICE VALUES"
				+ "(SEQ_NOTICE_NO.NEXTVAL, ?,?,?,?,?,DEFAULT,DEFAULT, DEFAULT)";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1,notice.getWriterId());
			pstm.setString(2, notice.getTitle());
			pstm.setString(3, notice.getContent());
			pstm.setString(4, notice.getOriginalFileName());
			pstm.setString(5, notice.getRenamedFileName());
			
			result = pstm.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		
		return result;
	}

	public int updateStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE NOTICE SET STATUS=? WHERE NO=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1,status);
			pstm.setInt(2, no);
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		return result;
	}

	public int updateNotice(Connection connection, Notice notice) {
		int result = 0;
		
		PreparedStatement pstm = null;
		String query = "UPDATE NOTICE "
				+ "SET TITLE=?,CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=? "
				+ " WHERE NO=?";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, notice.getTitle());
			pstm.setString(2, notice.getContent());
			pstm.setString(3, notice.getOriginalFileName());
			pstm.setString(4, notice.getRenamedFileName());
			pstm.setInt(5, notice.getNo());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		
		return result;
	}

}
