package com.soldsoldMarket.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.soldsoldMarket.member.model.service.MemberService;
@WebServlet("/idcheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdCheckServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String userId = request.getParameter("enrollId");
			Map<String,Boolean> map = new HashMap< >();
			
			System.out.println(userId);
			map.put("duplicate", new MemberService().isduplicateId(userId));
			response.setContentType("application/json; charset=utf-8");
//			
			new Gson().toJson(map,response.getWriter());
	
	}

}
