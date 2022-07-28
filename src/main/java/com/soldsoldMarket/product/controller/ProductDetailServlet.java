package com.soldsoldMarket.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;

@WebServlet("/product/view")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ProductDetailServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Product product = null;
    	PAdd pAdd = null;
    	
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	product = new ProductService().getProductByNo(no);
    	pAdd = new ProductService().getProductimgByNo(no);
    	
    	
    	request.setAttribute("product", product);
    	request.setAttribute("padd", pAdd);
    	System.out.println(product);
    	System.out.println("구분");
    	System.out.println(pAdd);
    	request.getRequestDispatcher("/views/product/view.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
