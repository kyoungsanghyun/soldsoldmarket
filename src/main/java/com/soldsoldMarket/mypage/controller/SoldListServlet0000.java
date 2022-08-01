package com.soldsoldMarket.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.mypage.model.service.SoldListService;
import com.soldsoldMarket.product.model.vo.Product;

@WebServlet("/mypage/soldList")
public class SoldListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SoldListServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Product> list = null; // 회원이 등록한 상품 리스트
    	int page = 0; // 
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	
		
		list = new SoldListService().getMemberProductList();
    	
		
    	request.setAttribute("list", list);
    	request.setAttribute("pageInfo", pageInfo);
    	request.getRequestDispatcher("/views/mypage/soldlList.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
