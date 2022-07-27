package com.soldsoldMarket.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.product.model.vo.Product;


public class ProductDao {

	public Product findProductByNo(Connection connection, int no) {
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
				
//				System.out.println(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}		
		return product;
	}

	public int updateView(Connection connection, Product product) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE PRODUCT SET P_VIEW=? WHERE P_NO=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			product.setPView(product.getPView() + 10);
			
			pstm.setInt(1,product.getPView());
			pstm.setInt(2,1);
			
			result = pstm.executeUpdate();
			System.out.println(result);

			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		
		return result;
	}



}
