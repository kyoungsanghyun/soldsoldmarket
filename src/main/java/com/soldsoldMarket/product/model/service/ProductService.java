package com.soldsoldMarket.product.model.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.soldsoldMarket.common.jdbc.JDBCTemplate.*;

import com.soldsoldMarket.product.model.dao.productRegistDao;
import com.kh.mvc.board.model.dao.BoardDao;
import com.kh.mvc.board.model.vo.Reply;
import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.product.model.dao.ProductDao;
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
	
	//좋아요 기능
	public int likelogic(Product product) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new ProductDao().likelogic(connection, product);
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	// 상품 코멘트 불러오기
	public Pcomment getPcommentByNo(int no) {
		Pcomment pcomment = null;
		Connection connection = getConnection();
		
		pcomment = new ProductDao().findPcomementByNo(connection, no);
		
		close(connection);
				
		return pcomment;
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

<<<<<<< HEAD

=======
	
>>>>>>> ef20b037976f93fe13b51e4d1a8b92574252bf43
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
	
<<<<<<< HEAD
	// 상품 이미지 등록
=======
	// 상품 이미지 등록 
>>>>>>> ef20b037976f93fe13b51e4d1a8b92574252bf43
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
	
	// 상품 리스트 구하기
    public List<Product> getProductList(int category, PageInfo pageInfo) {
        List<Product> list = null;
        Connection connection = getConnection();

        list = new ProductDao().selectProductList(connection, category, pageInfo);

        close(connection);

        return list;
    }






	
}
