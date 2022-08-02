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

public class SoldlistDao {
	// 회원 ID에 따른 상품 번호, 등록 날짜, 상품명 가져오기 
	public List<Product> selectMemberProductList(Connection connection, String memberId, PageInfo pageInfo) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, P_NO, M_ID, P_DATE, P_NAME, P_TRADING, MAXPAIMG1 "
						+ "FROM ( "
						+ "SELECT ROWNUM AS RNUM, P_NO, M_ID, P_DATE, P_NAME, P_TRADING, MAXPAIMG1 "
						+ "FROM ( "
						+ "SELECT P.P_NO, P.M_ID, P.P_DATE, P.P_NAME, P.P_TRADING, MAX(PA.PA_IMG1) AS MAXPAIMG1 "
						+ "FROM PRODUCT P JOIN PADD PA ON(P.P_NO = PA.P_NO) "
						+ "GROUP BY P.P_NO, P.M_ID, P.P_DATE, P.P_NAME, P.P_TRADING "
						+ "ORDER BY P.P_DATE DESC) "
						+ "WHERE M_ID LIKE ? AND P_TRADING LIKE '판매완료') "
						+ "WHERE RNUM BETWEEN ? and ?";	
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setPNo(rs.getInt("P_NO"));
				product.setMId(rs.getString("M_ID"));
				product.setPDate(rs.getDate("P_DATE"));
				product.setPName(rs.getString("P_NAME"));
				product.setPTrading(rs.getString("P_TRADING"));
				product.setPThumb(rs.getString("MAXPAIMG1"));
				
				list.add(product);
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
	public int getMemberProductCount(Connection connection, String memberId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query =  "SELECT COUNT(1) "
						+ "FROM ( "
						+ "SELECT P.M_ID, P.P_DATE, P.P_NAME, P.P_TRADING, MAX(PA.PA_IMG1) AS MAXPAIMG1 "
						+ "FROM PRODUCT P JOIN PADD PA ON(P.P_NO = PA.P_NO) "
						+ "GROUP BY P.M_ID, P.P_DATE, P.P_NAME, P.P_TRADING "
						+ "ORDER BY P.P_DATE DESC) "
						+ "WHERE M_ID LIKE ? AND P_TRADING LIKE '판매완료' ";

		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, memberId);
			
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
