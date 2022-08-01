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
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;

@WebServlet("/product/list")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductListServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Product> list = null;

    	PAdd padd = null;
    	
    	// page 입력 안하면 1페이지 보이게 함
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e){
    		page = 1;
    	}
    	
    	listCount = new ProductService().getProductCount();
    	pageInfo = new PageInfo(page, 5, listCount, 10);
    	list = new ProductService().getProductList(pageInfo);
    	

    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);

    	request.getRequestDispatcher("/views/product/list.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
