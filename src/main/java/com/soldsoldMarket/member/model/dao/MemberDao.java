package com.soldsoldMarket.member.model.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import com.soldsoldMarket.member.model.vo.Member;

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
				member.setAuthor(rs.getString("M_AUTHORIZATION"));
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

}
