package com.soldsoldMarket.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import javax.sql.DataSource;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;


public class productRegistDao {
	
	public int insertProduct(Connection connection, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO PRODUCT VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, product.getPNo());
			pstmt.setString(2, product.getMId());
			pstmt.setString(3, product.getPName());
			pstmt.setInt(4, product.getPPrice());
			pstmt.setString(5, product.getPQlt());
			pstmt.setString(6, product.getPTrading());
			pstmt.setString(7, product.getPLocation());
			pstmt.setString(8, product.getPExchange());
			pstmt.setInt(9, product.getPQtt());
			pstmt.setString(10, product.getPContents());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	
}

	