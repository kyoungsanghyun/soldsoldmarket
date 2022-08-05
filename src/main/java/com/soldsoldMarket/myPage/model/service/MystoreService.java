package com.soldsoldMarket.mypage.model.service;

import java.sql.Connection;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.mypage.model.dao.MystoreDao;
import com.soldsoldMarket.product.model.vo.Product;

public class MystoreService {

	// 회원의 상품 리스트 가져오기
	public List<Product> getMemberProductList(String memberId, PageInfo pageInfo, String trading) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new MystoreDao().selectMemberProductList(connection, memberId, pageInfo, trading);
		
		close(connection);
				
		return list;
	}

	// 회원의 상품 개수 가져오기
	public int getMemberProductCount(String memberId, String trading) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new MystoreDao().getMemberProductCount(connection, memberId, trading);
		
		close(connection);
				
		return count;
	}

}