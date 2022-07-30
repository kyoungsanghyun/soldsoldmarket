package com.soldsoldMarket.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.Product;


@WebServlet("/home")
public class HomeProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeProductServlet() {
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Product> list = null;
    	
    	list = new ProductService().getProductList();
    	
    	System.out.println(list);
    	
    	request.setAttribute("list", list);
    	request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
