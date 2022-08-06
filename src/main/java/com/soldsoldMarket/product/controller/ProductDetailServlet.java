package com.soldsoldMarket.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.member.model.service.MemberService;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.member.model.vo.Report;
import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.Heart;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Pcomment;
import com.soldsoldMarket.product.model.vo.Product;
import com.soldsoldMarket.product.model.vo.Trade;

@WebServlet("/product/view")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ProductDetailServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Product product = null;
    	PAdd pAdd = null;
    	Pcomment pcomment = null;
    	Member member = null;
    	Heart heart = null;
    	Trade trade = null;
    	
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	// 조회수 쿠키 관련
    	Cookie[] cookies = request.getCookies();
    	String viewhistory = "";
    	boolean hasRead = false;
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		for (Cookie cookie : cookies) {
    			name = cookie.getName();
				value = cookie.getValue();
			
			if(name.equals("viewhistory")) {
				viewhistory = value;
				
				if(value.contains("|" + no + "|")) {
					hasRead = true;
					
					break;
				}
			}
		}
    }

    	if(!hasRead) {    		
    		Cookie cookie = new Cookie("viewhistory" ,viewhistory +  "|" +  no + "|");
    		
    		cookie.setMaxAge(-1); 
    		response.addCookie(cookie);
    	}
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("member");
    	
    	
    	
    	product = new ProductService().getProductByNo(no ,hasRead);
    	pAdd = new ProductService().getProductimgByNo(no);
    	

    	if (loginMember != null) { 		
    		// 자료가 있다면 회원님과 거래중으로 변경
    		Trade buy = new ProductService().tradecheck(no, loginMember.getId(), product.getMId());
    		
    		request.setAttribute("buy", buy);
    		System.out.println(buy);
    		
    		// 해당글에 판매자를 신고했는지 체크
    		Report report = new MemberService().reportingcheck(loginMember.getId(), product.getMId());
    		
    		request.setAttribute("report", report);
    		System.out.println(report);

    		// like가 null 이면 안보이게
    		Heart like = new ProductService().likecheck(loginMember.getId(), no);
    		request.setAttribute("like", like);

    		System.out.println(like);
    	} else {
    		
    	}
    

    	
    	request.setAttribute("no", product);
    	request.setAttribute("product", product);
    	request.setAttribute("padd", pAdd);
    	request.setAttribute("pcomment", pcomment);
    	request.getRequestDispatcher("/views/product/view.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
