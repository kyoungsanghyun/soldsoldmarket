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
import com.soldsoldMarket.product.model.vo.Trade;


@WebServlet("/trading.do")
public class Trading extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Trading() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("member");
    	
		int no = Integer.parseInt(request.getParameter("no"));
		String sname = request.getParameter("sname");
		Trade trade = new Trade();
		int result = 0;

		
		
		
		if(trade != null) {
			trade = new ProductService().findTradeByNoAndId(no, loginMember.getId(),sname);			
		} else {			
			trade = new ProductService().findTradeByNoAndId(no, loginMember.getId(),sname);			
		}

		
		response.setContentType("application/json;charset=UTF-8");
		
		new Gson().toJson(trade, response.getWriter());
		
		
	}

}
