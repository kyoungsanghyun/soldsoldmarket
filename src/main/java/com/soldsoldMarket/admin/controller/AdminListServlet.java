package com.soldsoldMarket.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.Product;

@WebServlet("/admin/adminlist")
public class AdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminListServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	Product product = null;
////    	int pno = Integer.parseInt(request.getParameter("no"));
//    	
//    	product = new ProductService().getProductByNo(1);
//    	
//    	
//    	
//    	request.setAttribute("product", product);
//    	int page = 0; // 현재 페이지의 수
//		int listCount = 0; // 상품의 수
//		PageInfo pageInfo = null; // 페이지 정보
//		List<Product> list = null; // 상품들 리스트
//		int category = 0; // 카테고리 ID
//		String priceOrder = null; // 카테고리 가격 정렬
//		String searchWord = null; // 검색어
//    	
//		category = Integer.parseInt(request.getParameter("category"));
//		priceOrder = request.getParameter("priceOrder");
//		searchWord = request.getParameter("searchWord");
//		
//    	
//    	// page 입력 안하면 1페이지 보이게 함
//    	try {
//    		page = Integer.parseInt(request.getParameter("page"));
//    	} catch (NumberFormatException e){
//    		page = 1;
//    	}
//    	
//    	category = Integer.parseInt(request.getParameter("category"));
//		priceOrder = request.getParameter("priceOrder");
//		searchWord = request.getParameter("searchWord");
//    	
//    	
//    	request.setAttribute("pageInfo", pageInfo);
//    	request.setAttribute("list", list);
    
//    @Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	int page = 0;
//    	int listCount = 0;
//    	PageInfo pageInfo = null;
//    	List<Board> list = null;
//    	
//    	try {
//    		page = Integer.parseInt(request.getParameter("page"));
//    	} catch (NumberFormatException e) {
//			page = 1;
//		}
//    	
//    	listCount = new BoardService().getBoardCount();
//    	pageInfo = new PageInfo(page, 10, listCount, 10);    
//    	list = new BoardService().getBoardList(pageInfo);
//    	
//    	System.out.println(list);
//    	
//    	request.setAttribute("pageInfo", pageInfo);
//    	request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/admin/adminlist.jsp").forward(request, response);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
