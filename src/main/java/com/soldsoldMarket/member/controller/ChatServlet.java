package com.soldsoldMarket.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chat")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.getRequestDispatcher("/chat.jsp")
	.forward(request, response);
	}

}
