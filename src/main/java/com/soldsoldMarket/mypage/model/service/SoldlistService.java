package com.soldsoldMarket.mypage.model.service;

import java.sql.Connection;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.mypage.model.dao.SoldListDao;
import com.soldsoldMarket.product.model.vo.Product;

public class SoldListService {

	// 회원의 상품 리스트 가져오기
	public List<Product> getMemberProductList() {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new SoldListDao().selectMemberProductList(connection);
		
		close(connection);
				
		return list;
	}

}
