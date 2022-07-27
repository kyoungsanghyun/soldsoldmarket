package com.soldsoldMarket.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.product.model.vo.Product;


public class ProductDao {

	public Product findProductByNo(Connection connection, int pno) {
		Product product = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT  P_NO, "
							+ "P.M_ID, "
							+ "P_NAME, "
							+ "P_PRICE, "
							+ "P_DATE, "
							+ "P_LOCATION, "
							+ "P_QLT, "
							+ "P_EXCHANGE, "
							+ "P_QTT, "
							+ "P_TRADING "
					+ "FROM PRODUCT P "
					+ "JOIN MEMBER M ON(M.M_ID = P.M_ID)"
					+ "WHERE P_NO=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setInt(1,1);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				product = new Product();
				
				product.setPNo(rs.getInt("P_NO"));
				product.setPName(rs.getString("P_NAME"));
				product.setPId(rs.getString("M_ID"));
				product.setPPrice(rs.getInt("P_PRICE"));
				product.setPDate(rs.getDate("P_DATE"));
				product.setPLocation(rs.getString("P_LOCATION"));
				product.setPQlt(rs.getString("P_QLT"));
				product.setPExchange(rs.getString("P_EXCHANGE"));
				product.setPQtt(rs.getInt("P_QTT"));
				product.setPTrading(rs.getString("P_TRADING"));
				
				System.out.println(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}		
		return product;
	}

	// 상품의 총개수 확인
	public int getProductCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM PRODUCT";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			// 첫 번째 칼럼의 값(= 총 상품 개수)를 count에 대입
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

	// 상품리스트 페이지에 제목, 가격 가져오기
	public List<Product> findAll(Connection connection, PageInfo pageInfo) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT RNUM, P_NAME, P_PRICE "
						+ "FROM ("
						+    "SELECT ROWNUM AS RNUM, "
						+           "P_NAME, "
						+     		"P_PRICE "
						+ 	 "FROM ("
						+ 	    "SELECT P.P_NAME, "
						+ 	   		   "P.P_PRICE "
						+ 		"FROM PRODUCT P "
						+ 		"JOIN PADD PAD ON(P.P_NO = PAD.P_NO) "
						+ 		"ORDER BY P.P_NO DESC"
						+ 	 ")"
						+ ") WHERE RNUM BETWEEN ? and ?";
		
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setPRowNum(rs.getInt("RNUM"));
				product.setPName(rs.getString("P_NAME"));
				product.setPPrice(rs.getInt("P_PRICE"));
				
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



}
