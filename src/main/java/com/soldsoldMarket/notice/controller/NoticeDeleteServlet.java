package com.soldsoldMarket.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.notice.model.service.NoticeService;

@WebServlet("/notice/delete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null:(Member)session.getAttribute("member");		
		
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("게시글 번호 : " + no);
		
		if(loginMember == null) {
			request.setAttribute("msg", "로그인 후 삭제해 주세요.");
    		request.setAttribute("location", "/");
		}else {
			
			result = new NoticeService().delete(no);
			
			if(result > 0 ) {
				request.setAttribute("msg", "게시글 삭제 성공");
				request.setAttribute("location", "/notice/list");
			}else {
				request.setAttribute("msg", "게시글 삭제 실패");
				request.setAttribute("location", "/notice/list");
			}
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}


}
