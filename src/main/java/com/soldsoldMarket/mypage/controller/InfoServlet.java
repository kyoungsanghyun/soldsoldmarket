package com.soldsoldMarket.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.member.model.vo.Member;

@WebServlet("/mypage/memberinfo")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InfoServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/memberinfo.jsp").forward(request, response);
		
		
//		HttpSession session = request.getSession(false);
//		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember"); 
//		
//		if (loginMember != null) {
//			request.getRequestDispatcher("/views/mypage/memberinfo.jsp").forward(request, response);
//		} else {
//			request.setAttribute("msg", "로그인 후 회원정보를 수정해 주세요.");
//			request.setAttribute("location", "/");
//			
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
