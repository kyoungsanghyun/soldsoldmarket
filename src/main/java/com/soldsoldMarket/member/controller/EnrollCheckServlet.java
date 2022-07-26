package com.soldsoldMarket.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/enrollCheck")
public class EnrollCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EnrollCheckServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/views/member/enrollCheck.jsp");	
	}

}
