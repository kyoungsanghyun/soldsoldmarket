package com.soldsoldMarket.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.notice.model.service.NoticeService;
import com.soldsoldMarket.notice.model.vo.Notice;

@WebServlet("/notice/list")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeServlet() {
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = 0;
		int boardCount = 0;
		List<Notice> list = null;
		boardCount = new NoticeService().getNoticeCount();
		try {
    		page = Integer.parseInt(request.getParameter("page"));
			
		} catch (NumberFormatException e) {
			page = 1;
		}
		
		
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, 5);
		list = new NoticeService().getNoticeList(pageInfo);
		
		request.setAttribute("list", list);
    	request.setAttribute("pageInfo", pageInfo);
    	request.getRequestDispatcher("/views/notice/notice.jsp")
    			.forward(request, response);

		
	
	
	}


}
