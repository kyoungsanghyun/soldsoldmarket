package com.soldsoldMarket.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.member.model.service.MemberService;
import com.soldsoldMarket.member.model.vo.Member;

@WebServlet(name = "login",urlPatterns =  "/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/member/Login.jsp")
			.forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		Member loginMember = new MemberService().login(id,pwd);
		HttpSession session = null;
		
		
		if(loginMember != null) {
			session = request.getSession();
			session.setAttribute("member", loginMember);
			response.sendRedirect(request.getContextPath()+"/");
			
		}else {
			request.setAttribute("msg", "아이디나 비밀번호를 확인하세요");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp")
						.forward(request, response);
		}
		
		
		System.out.println(id+pwd);
		System.out.println(loginMember);
		
		
	
	}

}
