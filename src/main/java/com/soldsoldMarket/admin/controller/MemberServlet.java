package com.soldsoldMarket.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.member.model.service.MemberService;
import com.soldsoldMarket.member.model.vo.Member;

@WebServlet("/admin/member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Member> list = null;
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
			page = 1;
		}
    	
    	listCount = new MemberService().getMemberCount();
    	pageInfo = new PageInfo(page, 10, listCount, 10);    
    	list = new MemberService().getMemberList(pageInfo);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/admin/member.jsp").forward(request, response);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
