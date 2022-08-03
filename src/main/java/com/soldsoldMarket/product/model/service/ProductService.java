package com.soldsoldMarket.product.model.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.close;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.commit;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.getConnection;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.rollback;

import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.product.model.dao.productRegistDao;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.product.model.dao.ProductDao;
import com.soldsoldMarket.product.model.vo.Heart;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Pcomment;
import com.soldsoldMarket.product.model.vo.Product;
public class ProductService {



	// 상품 정보 가져오기
	public Product getProductByNo(int no, boolean hasRead) {
		Product product = null;
		Connection connection = getConnection();
		
		product = new ProductDao().findProductByNo(connection, no);

		
		// 조회수 증가 로직
		if(product != null && !hasRead) {
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

	// 상품 이미지 가져오기
	public PAdd getProductimgByNo(int no) {
		PAdd pAdd = null;
		Connection connection = getConnection();
		
		pAdd = new ProductDao().findProductimgByNo(connection, no);
		
		close(connection);
		
		return pAdd;
		
	}
	
	// 좋아요 로직
	public int likelogic(Heart heart, Product product) {
		
		Connection connection = getConnection();
		

//		product = new ProductDao().likelogicCount(connection, heart, product);
		
		int result = new ProductDao().likelogic(connection, heart);
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);

		return result;
	}
	
	// 좋아요 숫자 증가 로직
	public int likelogicCount(Heart heart, Product product) {
		System.out.println("접근확인 카운트");
		Connection connection = getConnection();
		
		int result = new ProductDao().likelogicCount(connection, heart, product);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);

		return result;
	}

	// 좋아요 취소 로직
	public int dislikelogic(Heart heart, Product product) {
		
		Connection connection = getConnection();
		
		int result = new ProductDao().dislikelogic(connection, heart);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		
		return result;
	}
	// 좋아요 숫자 감소 로직
	public int dislikelogicCount(Heart heart, Product product) {
		System.out.println("접근확인 카운트");
		Connection connection = getConnection();
		
		int result = new ProductDao().dislikelogicCount(connection, heart, product);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		
		return result;
	}
	
	
	// 좋아요 체크 로직
	public Heart likecheck(String hid, int hno) {
		Connection connetion = getConnection();
		
		Heart heart = new ProductDao().likecheck(connetion, hid, hno);
		
		close(connetion);
		
		return heart;
	}



	// 상품 삭제 (status 로 구현됨)
	public int deleteProduct(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new ProductDao().deleteStatus(connection, no);
		
		System.out.println("service result : " + result);
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	// 댓글 삭제
	public int deletePcomment(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new ProductDao().deletePcomment(connection, no);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	
	
	
	
	// 상품 코멘트 달기

	public int saveComment(Pcomment pcomment) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new ProductDao().insertComment(connection, pcomment);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	
	// 상품 댓글
	public int saveComment(Pcomment pcomment) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new ProductDao().insertComment(connection, pcomment);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	// 상품의 개수 가져오기
	public int getProductCount(int category, String searchcWord) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new ProductDao().getProductCount(connection, category, searchcWord);
		
		close(connection);
		
		return count;
	}

	// 상품 리스트 가져오기
	public List<Product> getProductList(int category, PageInfo pageInfo, String priceOrder, String searchWord) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new ProductDao().selectProductList(connection, category, pageInfo, priceOrder, searchWord);
		
		close(connection);
		
		return list;
	}	

	
	// 상품 등록
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
	
	// 상품 이미지 등록 

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
	
    
    // 상품 삭제
	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new productRegistDao().updateStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}






	
}
