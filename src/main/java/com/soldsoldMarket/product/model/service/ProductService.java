package com.soldsoldMarket.product.model.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.product.model.dao.ProductDao;
import com.soldsoldMarket.product.model.vo.Product;
public class ProductService {

	public Product getProductByNo(int no) {
		Product product = null;
		Connection connection = getConnection();
		
		product = new ProductDao().findProductByNo(connection, no);

		// 조회수 증가 로직
		if(product != null) {
			int result = new ProductDao().updateView(connection, product);
		
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		
		close(connection);

		
		return product;
	}

	
}
