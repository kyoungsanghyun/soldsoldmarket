package com.soldsoldMarket.mypage.model.service;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.close;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.mypage.model.dao.LikelistDao;
import com.soldsoldMarket.product.model.vo.Product;

public class LikelistService {

	// 회원의 상품 리스트 가져오기
	public List<Product> getMemberProductList(String memberId, PageInfo pageInfo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new LikelistDao().selectMemberProductList(connection, memberId, pageInfo);
		
		close(connection);
				
		return list;
	}

	// 회원의 상품 개수 가져오기
	public int getMemberProductCount(String memberId) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new LikelistDao().getMemberProductCount(connection, memberId);
		
		close(connection);
				
		return count;
	}

}