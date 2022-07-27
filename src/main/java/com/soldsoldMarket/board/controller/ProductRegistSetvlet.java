package com.soldsoldMarket.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.soldsoldMarket.common.util.FileRename;
import com.soldsoldMarket.product.model.vo.Product;

@WebServlet("/board/regist")
public class ProductRegistSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductRegistSetvlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Product product = null;
    	
    	// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board");
		
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	// MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	// 폼 파라미터로 넘어온 값들
    	String category = request.getParameter("category");
    	String title = request.getParameter("title");
    	String price = request.getParameter("price");
    	String condition = request.getParameter("condition");
    	String place = request.getParameter("place");
    	String exchange = request.getParameter("exchange");
    	String count = request.getParameter("count");
    	String content = request.getParameter("content");
    	
    	System.out.println(category);
    	System.out.println(title);
    	System.out.println(price);
    	System.out.println(condition);
    	System.out.println(place);
    	System.out.println(exchange);
    	System.out.println(count);
    	System.out.println(content);
	}

}
