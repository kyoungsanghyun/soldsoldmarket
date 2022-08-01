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

@WebServlet("/login2")
public class LoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet2() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String bday = request.getParameter("birthday");
		
		
		
		System.out.println(name);
		System.out.println(gender);
		System.out.println(email);
		boolean checkEmail = false;
		Member loginMember = null;
		HttpSession session = null;
		
		checkEmail = new MemberService().isduplicateId(email);
		
		if(checkEmail) {
			//로그인로직
			loginMember = new MemberService().loginByE(email);
			
			if(loginMember != null) {
				session = request.getSession();
				session.setAttribute("member", loginMember);
				response.sendRedirect(request.getContextPath()+"/home");
				
			}else {
				request.setAttribute("msg", "로그인 실패");
				request.setAttribute("location", "/");
				request.getRequestDispatcher("/views/common/msg.jsp")
							.forward(request, response);
			}
		}else {
			//간략회원가입로직
			
			Member member = new Member();
			member.setId(email);
			member.setName(name);
			
			request.setAttribute("member", member);
			
			request.getRequestDispatcher("/views/member/easyEnroll.jsp")
			.forward(request, response);
			
			
		}
		
		
		
//		request.getRequestDispatcher("/views/member/Login.jsp")
//			.forward(request, response);

		
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
		System.out.println(request.getParameter("profile_nickname"));
		
		System.out.println(id+pwd);
		System.out.println(loginMember);
		
		
	
	}

}
