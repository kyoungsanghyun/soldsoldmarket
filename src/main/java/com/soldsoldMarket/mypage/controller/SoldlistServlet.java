package com.soldsoldMarket.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.mypage.model.service.SoldlistService;
import com.soldsoldMarket.product.model.vo.Product;
import com.soldsoldMarket.product.model.vo.Trade;

@WebServlet("/mypage/soldlist")
public class SoldlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SoldlistServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("member"); 
		
		if (loginMember == null) {
			request.setAttribute("msg", "로그인 후 거래내역을 확인해 주세요.");
			request.setAttribute("location", "/home");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
    	List<Trade> list = null; // 회원이 등록한 상품 리스트
    	int page = 0; // 페이지의 수
    	int listCount = 0; // 상품의 수
    	PageInfo pageInfo = null; // 페이지 정보
    	String memberId = null; // 로그인멤버 아이디
    	String BIdPhone = null;
    	
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
    	
		memberId = loginMember.getId();
		listCount = new SoldlistService().getMemberProductCount(memberId);
		pageInfo = new PageInfo(page, 5, listCount, 3);
		list = new SoldlistService().getMemberProductList(memberId, pageInfo);
		
		request.setAttribute("memberId", memberId);
		request.setAttribute("BIdPhone", BIdPhone);
    	request.setAttribute("list", list);
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("page", page);
    	request.setAttribute("listCount", listCount);
    	request.getRequestDispatcher("/views/mypage/soldlist.jsp").forward(request, response);
		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}