package com.soldsoldMarket.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.Heart;


@WebServlet("/like.do")
public class Like extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Like() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("member");
    	
		int no = Integer.parseInt(request.getParameter("no"));
		int result = 0;
		int count = 0;
		
		System.out.println(no);
		System.out.println(loginMember.getId());
		
		// 1. no값과 id값이 Heart테이블과 동일한 값이 저장되어있는지 조회
		Heart heart = new ProductService().findHeartByNoAndId(no, loginMember.getId());
		
		// 2. heart가 null 이 아니면 DELETE 수행 null 
		
		if(heart != null) {
			// DELETE 수행
			count = new ProductService().likeminusCount(no, loginMember.getId());
			result = new ProductService().heartDelete(no,loginMember.getId());
			heart = new ProductService().findHeartByNoAndId(no, loginMember.getId());
			
		} else {
			// INSERT 수행
			result = new ProductService().heartSave(no,loginMember.getId());
			heart = new ProductService().findHeartByNoAndId(no, loginMember.getId());
			count = new ProductService().likeplusCount(no, loginMember.getId());
		}
		
		System.out.println(heart);
		
		response.setContentType("application/json;charset=UTF-8");
		
		new Gson().toJson(heart, response.getWriter());
		
		
	}

}
