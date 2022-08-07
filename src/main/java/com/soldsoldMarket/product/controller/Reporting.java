package com.soldsoldMarket.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.soldsoldMarket.member.model.service.MemberService;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.member.model.vo.Report;


@WebServlet("/reporting.do")
public class Reporting extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Reporting() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("member");
    	
		String sname = request.getParameter("sname");
		Report report = new Report();
		int result = 0;

		
		
		
		if(report != null) {
			report = new MemberService().findReportByNoAndId(loginMember.getId(), sname);			
		} else {			
			report = new MemberService().findReportByNoAndId(loginMember.getId(), sname);			
		}

		
		response.setContentType("application/json;charset=UTF-8");
		
		new Gson().toJson(report, response.getWriter());
		
		
	}

}
