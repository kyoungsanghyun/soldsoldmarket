package com.soldsoldMarket.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.product.model.vo.Product;
import com.soldsoldMarket.product.model.vo.Trade;

public class SoldlistDao {
	// 
	public List<Trade> selectMemberProductList(Connection connection, String memberId, String trading, PageInfo pageInfo) {
		List<Trade> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, P_NO, P_NAME, P_PRICE, M_ID, B_ID, S_ID, T_NO, MAXPAIMG1, BIDPHONE\r\n"
						+ "FROM (\r\n"
						+ "SELECT ROWNUM AS RNUM, P_NO, P_NAME, P_PRICE, M_ID, B_ID, S_ID, T_NO, MAXPAIMG1, BIDPHONE\r\n"
						+ "FROM (\r\n"
						+ "SELECT PTPA.P_NO, PTPA.P_NAME, PTPA.P_PRICE, PTPA.M_ID, PTPA.B_ID, PTPA.S_ID, PTPA.T_NO, MAXPAIMG1, M.M_PHONE AS BIDPHONE\r\n"
						+ "FROM(\r\n"
						+ "SELECT PT.P_NO, PT.P_NAME, PT.P_PRICE, PT.M_ID, PT.B_ID, PT.S_ID, PT.T_NO, MAX(PA.PA_IMG1) AS MAXPAIMG1\r\n"
						+ "FROM(\r\n"
						+ "SELECT P.P_NO, P.P_NAME, P.P_PRICE, P.M_ID, T.B_ID, T.S_ID, T.T_NO\r\n"
						+ "FROM PRODUCT P JOIN TRADING T ON(P.P_NO = T.P_NO)) PT JOIN PADD PA ON (PT.P_NO = PA.P_NO)\r\n"
						+ "GROUP BY PT.P_NO, PT.P_NAME, PT.P_PRICE, PT.M_ID, PT.B_ID, PT.S_ID, PT.T_NO) PTPA JOIN MEMBER M ON (PTPA.B_ID = M.M_ID)\r\n"
						+ "ORDER BY PTPA.T_NO DESC)\r\n";
		
		if(trading == null) {
			query += "WHERE B_ID LIKE ? OR S_ID LIKE ?)\r\n";
		} else if(trading.equals("sell")) {
			query += "WHERE S_ID LIKE ?)";
		} else {
			query += "WHERE B_ID LIKE ?)";
		}
						
						query += "WHERE RNUM BETWEEN ? and ?";	
		
		try {
			pstmt = connection.prepareStatement(query);
			
			if(trading == null) {
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberId);
				pstmt.setInt(3, pageInfo.getStartList());
				pstmt.setInt(4, pageInfo.getEndList());			
			} else {
				pstmt.setString(1, memberId);
				pstmt.setInt(2, pageInfo.getStartList());
				pstmt.setInt(3, pageInfo.getEndList());	
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Trade trade = new Trade();
				
				trade.setPNo(rs.getInt("P_NO"));
				trade.setTPName(rs.getString("P_NAME"));
				trade.setTPPrice(rs.getInt("P_PRICE"));
				trade.setBId(rs.getString("B_ID"));
				trade.setSId(rs.getString("S_ID"));
				trade.setTPThumb(rs.getString("MAXPAIMG1"));
				trade.setBIdPhone(rs.getString("BIDPHONE"));
				
				list.add(trade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	// 회원 ID에 따른 판매완료 상품 개수 구하기
	public int getMemberProductCount(Connection connection, String memberId, String trading) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query =  "SELECT COUNT(1) "
						+ "FROM ( "
						+ "SELECT P.P_NO, P.P_NAME, P.P_PRICE, P.M_ID, T.B_ID, T.S_ID, T.T_NO "
						+ "FROM PRODUCT P JOIN TRADING T ON(P.P_NO = T.P_NO) ";
						
		if(trading == null) {
			query += "WHERE T.B_ID LIKE ? OR T.S_ID LIKE ?)";
		} else if(trading.equals("sell")) {
			query += "WHERE T.S_ID LIKE ?)";
		} else {
			query += "WHERE T.B_ID LIKE ?)";
		}


		
		try {
			pstmt = connection.prepareStatement(query);
			
			if(trading == null) {
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberId);				
			} else {
				pstmt.setString(1, memberId);
			}

			
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
	
	
	
	
	
}