package com.soldsoldMarket.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soldsoldMarket.notice.model.service.NoticeService;
import com.soldsoldMarket.notice.model.vo.Notice;

@WebServlet("/notice/view")
public class ViewSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewSerlvet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Notice notice = null;
		int no = Integer.parseInt(request.getParameter("no"));

		//새로 고침 시 조회 수가 증가하는 것을 방지하는 로직
		// 쿠키에 조회한 게시글의 번호를 기록하여 한 번 조회하면 그 뒤에는 조회 수가 올라가지 않도록 설정
		//1. 쿠키에 조회한 이력이 있는지 확인
		Cookie[] cookies = request.getCookies();
		String boardHistory = ""; //조회한 게시글 번호를 저장하는 변수
		boolean hasRead = false; // 읽은 글이면 true 안읽었으면 false
		
		if(cookies != null) {
			String name = null;
			String value = null;
			
			for(Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();

				//boardHistory인 쿠키 값을 찾기
				if(name.equals("boardHistory")) {
					boardHistory = value;
					
					if(value.contains("|"+no+"|")) {
						hasRead = true;
						
						break;
					}
				}
			}
		}
		
		//2. 읽지 않은 게시물이면 cookie에 기록
		if(!hasRead) {
			Cookie cookie = new Cookie("boardHistory", boardHistory+ "|"+no+"|");
			
			cookie.setMaxAge(-1);//브라우저 종료 시 삭제
			response.addCookie(cookie);
		}
		
		
		notice = new NoticeService().getNoticeByNo(no,hasRead);
		
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/views/notice/view.jsp").forward(request, response);
		
	
	
	}


}
