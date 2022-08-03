package com.soldsoldMarket.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;


public class productRegistDao {
	
	public int insertProduct(Connection connection, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL,?,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,?,DEFAULT,DEFAULT)";
		
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
	
	public String[] selectProductImg(Connection connection, int PNo) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String[] FName = new String[5];
		String query = "SELECT PA_IMG1, PA_IMG2, PA_IMG3, PA_IMG4, PA_IMG5 FROM PADD WHERE P_NO = ?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, PNo);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				FName[0] = rs.getString("PA_IMG1");
				FName[1] = rs.getString("PA_IMG2");
				FName[2] = rs.getString("PA_IMG3");
				FName[3] = rs.getString("PA_IMG4");
				FName[4] = rs.getString("PA_IMG5");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return FName;
	}

	
	public int updateStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE PRODUCT SET STATUS=? WHERE P_NO=?";

		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, no);		
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateProduct(Connection connection, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE PRODUCT SET P_NAME=?,P_PRICE=?,P_QLT=?,P_TRADING=?,P_LOCATION=?,P_EXCHANGE=?,P_QTT=?,P_CONTENTS=?,C_ID=?,P_DATE=SYSDATE WHERE P_NO=?";
		
		System.out.println("product.getPTrading() >>>" +  product.getPTrading() + "\nproduct.getPNo() >>>" + product.getPNo());
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, product.getPName());
			pstmt.setInt(2, product.getPPrice());
			pstmt.setString(3, product.getPQlt());
			pstmt.setString(4, product.getPTrading()); 
			pstmt.setString(5, product.getPLocation());
			pstmt.setString(6, product.getPExchange()); 
			pstmt.setInt(7, product.getPQtt());
			pstmt.setString(8, product.getPContents());
			pstmt.setString(9, product.getCId());
			pstmt.setInt(10, product.getPNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

//	public int updateProductImg(Connection connection, PAdd padd, Product product) {
//		int result = 0;
//		PreparedStatement pstmt = null;
//		
//		String query = "UPDATE PADD SET (PA_IMG1,PA_IMG2,PA_IMG3,PA_IMG4,PA_IMG5) = (SELECT ?,?,?,?,? FROM DUAL) WHERE P_NO = ?";
//		
//		try {
//			pstmt = connection.prepareStatement(query);
//
//			pstmt.setString(1, padd.getPAimg1());
//			pstmt.setString(2, padd.getPAimg2());
//			pstmt.setString(3, padd.getPAimg3());
//			pstmt.setString(4, padd.getPAimg4());
//			pstmt.setString(5, padd.getPAimg5());
//			pstmt.setInt(6, padd.getPNo());
//			
//			result = pstmt.executeUpdate();
//			System.out.println("result img >>>>>" + result);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}

	
}

	