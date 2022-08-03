package com.soldsoldMarket.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.member.model.vo.Member;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {
	public AdminFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 관리자 페이지 권한 처리
		//  - 관리자가 아닌 경우에는 페이지를 볼 수 없도록 처리
		HttpSession session = ((HttpServletRequest)request).getSession(false);
		Member loginMember = (Member)(session.getAttribute("member"));
		
		if(loginMember == null || !loginMember.getAuthor().equals("M")) {
			request.setAttribute("msg","잘못된 경로로 접근하셨습니다.");
			request.setAttribute("location","/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
			System.out.println(loginMember);

			return;
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}
	
	

}
