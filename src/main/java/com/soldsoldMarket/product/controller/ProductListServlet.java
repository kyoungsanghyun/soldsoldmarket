package com.soldsoldMarket.product.controller;

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

@WebServlet("/product/list")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductListServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int page = 0; // 현재 페이지의 수
    	int listCount = 0; // 상품의 수
    	PageInfo pageInfo = null; // 페이지 정보
    	List<Product> list = null; //  상품들 리스트
    	int category = 0; // 카테고리 ID
    	String priceOrder = null; // 카테고리 가격 정렬
    	
    	category = Integer.parseInt(request.getParameter("category"));
    	priceOrder = request.getParameter("priceOrder");
    	
    	
    	// page 입력 안하면 1페이지 보이게 함
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e){
    		page = 1;
    	}
    	
    	listCount = new ProductService().getProductCount(category);
    	pageInfo = new PageInfo(page, 5, listCount, 10);
    	list = new ProductService().getProductList(category, pageInfo, priceOrder);
    	
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	request.setAttribute("category", category);
    	request.getRequestDispatcher("/views/product/list.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
