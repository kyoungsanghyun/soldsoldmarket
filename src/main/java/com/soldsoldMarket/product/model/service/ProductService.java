package com.soldsoldMarket.product.model.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.common.util.PageInfo;
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
	
	// 상품의 총개수 확인
	public int getProductCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new ProductDao().getProductCount(connection);
		
		close(connection);
		
		return count;
	}

	// 상품 전체 가져오기
	public List<Product> getProductList(PageInfo pageInfo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new ProductDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	
}
