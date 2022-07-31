package com.soldsoldMarket.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;


public class productRegistDao {
	
	public int insertProduct(Connection connection, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL,?,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,?,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, product.getMId());
			pstmt.setString(2, product.getPName());
			pstmt.setInt(3, product.getPPrice());
			pstmt.setString(4, product.getPQlt());
			pstmt.setString(5, product.getPTrading());
			pstmt.setString(6, product.getPLocation());
			pstmt.setString(7, product.getPExchange());
			pstmt.setInt(8, product.getPQtt());
			pstmt.setString(9, product.getPContents());
			pstmt.setString(10, product.getCId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertProductImg(Connection connection, PAdd padd, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO PADD VALUES(SEQ_PADD_NO.NEXTVAL,?,?,?,?,?,SEQ_PRODUCT_NO.NEXTVAL-1)";
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, padd.getPAimg1());
			pstmt.setString(2, padd.getPAimg2());
			pstmt.setString(3, padd.getPAimg3());
			pstmt.setString(4, padd.getPAimg4());
			pstmt.setString(5, padd.getPAimg5());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
}

	