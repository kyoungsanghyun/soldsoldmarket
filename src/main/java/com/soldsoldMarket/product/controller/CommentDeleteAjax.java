package com.soldsoldMarket.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.Product;


@WebServlet("/CommentDeleteAjax.do")
public class CommentDeleteAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProductService service = new ProductService();

    public CommentDeleteAjax() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("정상접근 확인 (코멘트 삭제)");
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("member") : null;
    	
    	if(loginMember != null) {
    		
    		int no = Integer.parseInt(request.getParameter("no"));
    		int result = 0;
    		
    		
    		result = new ProductService().deletePcomment(no);
    		
    		
    		
    	}
    		
    	}

}
