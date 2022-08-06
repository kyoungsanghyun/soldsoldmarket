package com.soldsoldMarket.member.model.dao;


import static com.soldsoldMarket.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.member.model.vo.Report;
import com.soldsoldMarket.product.model.vo.Trade;

public class MemberDao {


	public Member findMemberById(Connection connection, String id) {
		Member member = null;
		PreparedStatement pstm = null;
		String query = " SELECT * FROM MEMBER WHERE M_ID=? AND M_STATUS='Y' ";
		ResultSet rs = null;
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				member.setId(rs.getString("M_ID"));
				member.setPwd(rs.getString("M_PW"));
				member.setName(rs.getString("M_NAME"));
				member.setBDay(rs.getDate("M_BIRTH"));
				member.setPhone(rs.getString("M_PHONE"));
				member.setAddress(rs.getString("M_ADDRESS"));
				member.setGender(rs.getString("M_GENDER"));
				member.setJoinDate(rs.getDate("M_JOINDATE"));
				member.setAuthority(rs.getString("M_AUTHORIZATION"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return member;
	}

	public int insert(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "INSERT INTO MEMBER (\r\n "
				+ "    M_ID, \r\n "
				+ "    M_PW, \r\n "
				+ "    M_NAME, \r\n "
				+ "    M_BIRTH,\r\n "
				+ "    M_GENDER, \r\n "
				+ "    M_ADDRESS, \r\n "
				+ "    M_PHONE \r\n "
				+ ") VALUES(?,?,?,?,?,?,?) ";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, member.getId());
			pstm.setString(2, member.getPwd());
			pstm.setString(3, member.getName());
			pstm.setDate(4, (Date) member.getBDay());
			pstm.setString(5,member.getGender());
			pstm.setString(6, member.getAddress());
			pstm.setString(7, member.getPhone());
			
			result = pstm.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		
		
		
		return result;
	}

	public int updateMember(Connection connection, Member memberUpdate) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET M_PHONE=?, M_ADDRESS=?, INTRO=? WHERE M_ID=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, memberUpdate.getPhone());
			pstmt.setString(2, memberUpdate.getAddress());
			pstmt.setString(3, memberUpdate.getIntro());
			pstmt.setString(4, memberUpdate.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertMember(Connection connection, Member member) {
		int result = 0;
		
		
		return result;
	}
	
	public int getMemberCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM MEMBER";
		
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



	public List<Member> findAll(Connection connection, PageInfo pageInfo) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, M_ID, M_NAME, M_PHONE, M_ADDRESS, M_STATUS "
						+ "FROM ("
						+    "SELECT ROWNUM AS RNUM, "
						+           "M_ID, "
						+           "M_NAME, "
						+ 			"M_PHONE, "
						+ 			"M_ADDRESS, "
						+ 			"M_STATUS "
						+ 	 "FROM ("
						+ 	    "SELECT M.M_ID, "
						+ 			   "M.M_NAME, "
						+  			   "M.M_PHONE, "
						+ 			   "M.M_ADDRESS, "
						+ 			   "M.M_STATUS "
						+ 		"FROM MEMBER M "
						+ 		"WHERE M.M_STATUS = 'Y' ORDER BY M.M_ID DESC"
						+ 	 ")"
						+ ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member member = new Member();
				
				member.setMRowNum(rs.getInt("RNUM"));
				member.setId(rs.getString("M_ID"));
				member.setName(rs.getString("M_NAME"));
				member.setPhone(rs.getString("M_PHONE"));
				member.setAddress(rs.getString("M_ADDRESS"));
				member.setStatus(rs.getString("M_STATUS"));
				
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return list;
	  }


	// 신고했는지 확인
	public Report reportingcheck(Connection connetion, String loginid, String sname) {
		Report report = null;
		PreparedStatement pstm = null;
		String query = " SELECT M_ID, R_ID FROM REPORT WHERE M_ID=? AND R_ID=?";
		ResultSet rs = null;
		
		try {
			pstm = connetion.prepareStatement(query);
			pstm.setString(1, sname);
			pstm.setString(2, loginid);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				report = new Report();
				report.setMid(rs.getString("M_ID"));
				report.setRid(rs.getString("R_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return report;
	}

	// 신고 취소
	public int deleteReport(Connection connection, String loginid, String sname) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = 	"DELETE FROM REPORT WHERE M_ID=? AND R_ID=?";

		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, sname);
			pstmt.setString(2, loginid);
			
			result = pstmt.executeUpdate();	

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	}

	
	// 신고 넣기
	public int insertReport(Connection connection, String loginid, String sname) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = 	"INSERT INTO REPORT (R_NO, M_ID, R_ID) "
			+	"SELECT SEQ_REPORT_NO.NEXTVAL, ? , ?  "
			+	"FROM DUAL "
			+	"WHERE NOT EXISTS ( "
			+	    "SELECT M_ID, R_ID "
			+	    "FROM REPORT "
			+	    "WHERE M_ID = ? AND R_ID = ? "
			+	    ")";

		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, sname);
			pstmt.setString(2, loginid);
			pstmt.setString(3, sname);
			pstmt.setString(4, loginid);
			
			result = pstmt.executeUpdate();	

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 멤버 테이블에 신고당한횟수 증가
	public int plusReport(Connection connection, String loginid, String sname) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = 	"UPDATE MEMBER M "
				+"SET M.M_REPORTCOUNT = M.M_REPORTCOUNT + 1 "
				+"WHERE M.M_ID IN ( "
				+    "SELECT R.M_ID "
				+    "FROM REPORT R "
				+    "WHERE R.M_ID = ? AND R.R_ID = ?)";
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, sname);
			pstmt.setString(2, loginid);
			
			result = pstmt.executeUpdate();	
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 멤버 테이블에 신고당한횟수 감소
	public int minusReport(Connection connection, String loginid, String sname) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = 	"UPDATE MEMBER M "
				+"SET M.M_REPORTCOUNT = M.M_REPORTCOUNT - 1 "
				+"WHERE M.M_ID IN ( "
				+    "SELECT R.M_ID "
				+    "FROM REPORT R "
				+    "WHERE R.M_ID = ? AND R.R_ID = ?)";
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, sname);
			pstmt.setString(2, loginid);
			
			result = pstmt.executeUpdate();	
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


}
