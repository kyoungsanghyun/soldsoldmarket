package com.soldsoldMarket.product.model.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.board.model.dao.productRegistDao;
import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.product.model.dao.ProductDao;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;
public class ProductService {

	public Product getProductByNo(int pno) {
		Product product = null;
		Connection connection = getConnection();
		
		product = new ProductDao().findProductByNo(connection,pno);

		
		close(connection);

		
		return product;
	}
	
	// �긽�뭹�쓽 珥앷컻�닔 �솗�씤
	public int getProductCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new ProductDao().getProductCount(connection);
		
		close(connection);
		
		return count;
	}

	// �긽�뭹 �쟾泥� 媛��졇�삤湲�
	public List<Product> getProductList(PageInfo pageInfo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new ProductDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}


	public int insertProduct(Product product) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new productRegistDao().insertProduct(connection, product);
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	
	}
	
	public int insertPAdd(PAdd padd, Product product) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new productRegistDao().insertProductImg(connection, padd, product);
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	
}
