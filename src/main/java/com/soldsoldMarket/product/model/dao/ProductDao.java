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
				product.setMId(rs.getString("M_ID"));
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

	// 상품 개수 구하기
	public int getProductCount(Connection connection, int category, String searchWord) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(1)"
						+ "FROM ( "
						+ "SELECT  P.P_NO, P.P_NAME, P.P_PRICE, P.C_ID, P.P_DATE, max(PA.PA_IMG_ID) AS MAXPAID "
						+ "FROM PRODUCT P JOIN PADD PA ON(P.P_NO = PA.P_NO) ";
		
						// 검색어 구분
						if( searchWord != null ) {
							query += "WHERE P.P_NAME LIKE ? ";
							category = 0;
						}
						
					 // 카테고리 구분		   	  
				 	 if( category != 0 ) {
				 		  query += "AND P.C_ID = ? ";
				 		} 

				  query += "GROUP BY P.P_NO, P.P_NAME, P.P_PRICE, P.C_ID, P.P_DATE "
							+ "ORDER BY P.P_DATE DESC "
							+ ")";
				  
				  
		try {
			pstmt = connection.prepareStatement(query);
			
			if( searchWord != null ) {
				pstmt.setString(1, "%" + searchWord + "%");
			} else if (category != 0){
				pstmt.setInt(1, category);				
			}
			
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

	// RNUM, 상품번호, 상품명, 상품가격, 카테고리분류, 상품등록일, 첨부파일ID 가져오기
	public List<Product> selectProductList(Connection connection, int category, PageInfo pageInfo, String priceOrder, String searchWord) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT RNUM, P_NO, P_NAME, P_PRICE, C_ID, P_DATE, MAXPAID "
						+ "FROM ("
						+    "SELECT ROWNUM AS RNUM, "
						+           "P_NO, "
						+     		"P_NAME, P_PRICE, C_ID, P_DATE, MAXPAID "
						+ 	 "FROM ("
						+ 	    "SELECT P.P_NO, "
						+ 	   		   "P.P_NAME, P.P_PRICE, P.C_ID, P.P_DATE, max(PA.PA_IMG_ID) AS MAXPAID "
						+              "FROM PRODUCT P JOIN PADD PA ON(P.P_NO = PA.P_NO) ";
					// 검색어 구분
					if( searchWord != null ) {
						query += "WHERE P.P_NAME LIKE ? ";
						category = 0;
					}
					
				 // 카테고리 구분		   	  
		     	 if( category != 0 ) {
		     		  query += "AND P.C_ID = ? ";
		     		} 

		     	 query += "GROUP BY P.P_NO, P.P_NAME, P.P_PRICE, P.C_ID, P.P_DATE ";
		     	 
		     	 // 최신 등록순, 높은 가격순, 낮은 가격순 구분
		     	 if(priceOrder != null && priceOrder.equals("high")) {
		     		 query += "ORDER BY P.P_PRICE DESC ";
		     	 } else if (priceOrder != null && priceOrder.equals("low")){
		     		 query += "ORDER BY P.P_PRICE"; 
		     	 } else {
		     		 query += "ORDER BY P.P_DATE DESC "; 
		     	 }
		     	  
		     		query += ")) WHERE RNUM BETWEEN ? and ?";
		
		
		try {
			pstmt = connection.prepareStatement(query);
			
			if( pageInfo == null ) {
				pstmt.setInt(1, 1);
				pstmt.setInt(2, 10);	
			} else if (searchWord != null) {
				pstmt.setString(1, "%" + searchWord + "%");
				pstmt.setInt(2, pageInfo.getStartList());
				pstmt.setInt(3, pageInfo.getEndList());				
			} else if (category != 0 ){
				pstmt.setInt(1, category);
				pstmt.setInt(2, pageInfo.getStartList());
				pstmt.setInt(3, pageInfo.getEndList());
			} else {
				pstmt.setInt(1, pageInfo.getStartList());
				pstmt.setInt(2, pageInfo.getEndList());						
			}
			

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setPRowNum(rs.getInt("RNUM"));
				product.setPNo(rs.getInt("P_NO"));
				product.setPName(rs.getString("P_NAME"));
				product.setPPrice(rs.getInt("P_PRICE"));
				product.setCId(rs.getString("C_ID"));
				product.setPDate(rs.getDate("P_DATE"));
				
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
