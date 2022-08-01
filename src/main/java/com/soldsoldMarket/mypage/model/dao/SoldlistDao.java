package com.soldsoldMarket.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.product.model.vo.Product;

public class SoldlistDao {
	// 회원 상품의 등록 날짜, 상품명, 거래상태 가져오기 
	public List<Product> selectMemberProductList(Connection connection) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT P.P_DATE, P.P_NAME, P.P_TRADING FROM PRODUCT P WHERE P.M_ID = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
