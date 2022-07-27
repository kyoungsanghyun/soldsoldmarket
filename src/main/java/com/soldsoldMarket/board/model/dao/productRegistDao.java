package com.soldsoldMarket.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.sql.DataSource;

import com.soldsoldMarket.board.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

public class productRegistDao {
	private DataSource ds = null;
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public int insertProduct(Connection connection, Product product) {
		int result = 0;
		String query = "INSERT INTO PRODUCT VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, product.getPNo());
			pstmt.setString(2, product.getPId());
			pstmt.setString(3, product.getPName());
			pstmt.setInt(4, product.getPPrice());
			pstmt.setString(5, product.getPQlt());
			pstmt.setString(6, product.getPTrading());
			pstmt.setString(7, product.getPLocation());
			pstmt.setString(8, product.getPExchange());
			pstmt.setInt(9, product.getPQtt());
			pstmt.setString(10, product.getPContents());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	
	public int insertProductImg(PAdd pvo) {
		int result = 0;

		String sql_max = "select nvl(max(p_id),0) from Product";
		int maxp_id = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.createStatement();
			rs = pstmt.executeQuery(sql_max);
			if (rs.next()) {
				maxp_id = rs.getInt(1);
				commit();
			} else { 
				rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}

		String sql = "insert into padd values (?,?,?,?,?,?,?)";

		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxp_id);
			pstmt.setString(2, pvo.getPAimg1());
			pstmt.setString(3, pvo.getPAimg2());
			pstmt.setString(4, pvo.getPAimg3());
			pstmt.setString(4, pvo.getPAimg4());
			pstmt.setString(4, pvo.getPAimg5());
			pstmt.setInt(4, pvo.getPNo());
			result = pstmt.executeUpdate();
			if (result > 0) {
				commit();
			} else {
				rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}