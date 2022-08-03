package com.soldsoldMarket.mypage.model.service;

import java.sql.Connection;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.mypage.model.dao.SoldlistDao;
import com.soldsoldMarket.product.model.vo.Product;

public class SoldlistService {

	// 회원의 상품 리스트 가져오기
	public List<Product> getMemberProductList(String memberId, PageInfo pageInfo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new SoldlistDao().selectMemberProductList(connection, memberId, pageInfo);
		
		close(connection);
				
		return list;
	}

	// 회원의 상품 개수 가져오기
	public int getMemberProductCount(String memberId) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new SoldlistDao().getMemberProductCount(connection, memberId);
		
		close(connection);
				
		return count;
	}

}