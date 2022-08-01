package com.soldsoldMarket.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Privacy")
public class PrivacyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PrivacyServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("views/member/Privacy.jsp").forward(request, response);

	}

}
