package com.soldsoldMarket.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soldsoldMarket.member.model.service.MemberService;
import com.soldsoldMarket.member.model.vo.Member;

@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/Enroll.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int result = 0;
		
		String id = request.getParameter("enrollId");
		String pwd = request.getParameter("enrollPass");
		String pc = request.getParameter("enrollPC");
		String name = request.getParameter("enrollName");
		String address = request.getParameter("enrollAdress");
		String bYear = request.getParameter("enrollBY");
		String bMonth = request.getParameter("enrollBM");
		String bDay = request.getParameter("enrollBD");
		String gender = request.getParameter("enrollGender");
		String phone = request.getParameter("enrollPhone");
		LocalDate bd  = LocalDate.of(Integer.parseInt(bYear), Integer.parseInt(bMonth), Integer.parseInt(bDay));
		Date birthDay = Date.valueOf(bd);
		
		if(pc.equals(pwd)) {
		
		Member member = new Member();
		member.setAddress(address);
		member.setBDay(birthDay);
		member.setId(id);
		member.setPwd(pwd);
		member.setPhone(phone);
		member.setGender(gender);
		member.setName(name);
		
		result = new MemberService().save(member);
		if(result > 0) {
			
			request.setAttribute("msg", "회원가입 완료.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
		}else {
			request.setAttribute("msg", "회원가입 실패.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			
		}
		
		
		}else {
			request.setAttribute("msg", "비밀번호와 비밀번호체크가 다릅니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
		}
		
		System.out.println(pc.equals(pwd));
		System.out.println(birthDay);
		
		
	}

}
