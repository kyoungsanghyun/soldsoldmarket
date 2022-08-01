package com.soldsoldMarket.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Pcomment;
import com.soldsoldMarket.product.model.vo.Product;

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
    	
    	
    	int no = Integer.parseInt(request.getParameter("no"));
    	System.out.println(request.getParameter("no"));
    	System.out.println(no);
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
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	
    	
    	if (loginMember != null) {
//    		request.getRequestDispatcher("/views/board/write.jsp").forward(request, response);    		
    		System.out.println(loginMember + "로그인");
    	} else {
    		System.out.println(loginMember + "로그인 안됨");
//    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
//    		request.setAttribute("location", "/");
//    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
    
    	
    	
    	
    	
    	product = new ProductService().getProductByNo(no ,hasRead);
    	pAdd = new ProductService().getProductimgByNo(no);
    	pcomment = new ProductService().getPcommentByNo(no);
    	
    	System.out.println(no);
    	
    	
    	request.setAttribute("product", product);
    	request.setAttribute("padd", pAdd);
    	request.setAttribute("pcomment", pcomment);
    	request.getRequestDispatcher("/views/product/view.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
