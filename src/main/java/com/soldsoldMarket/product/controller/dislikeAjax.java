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
import com.soldsoldMarket.product.model.vo.Heart;
import com.soldsoldMarket.product.model.vo.Product;


@WebServlet("/dislikeAjax.do")
public class dislikeAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProductService service = new ProductService();

	
    public dislikeAjax() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("member");

    	
    	if (loginMember != null) {
    		
        	Heart heart = new Heart();
        	Product product = new Product();
        	int result = 0;
        	int minusCount = 0;
        	int no = Integer.parseInt(request.getParameter("no"));
        	
        	heart.setPNo(no);
        	heart.setMId(loginMember.getId());
        	

        	minusCount = service.dislikelogicCount(heart, product);
        	result = service.dislikelogic(heart, product);
        	
        	

    		
			session.removeAttribute("likecheck");
        	
    		
    		// 좋아요 쿠키 관련
//        	Cookie[] cookies = request.getCookies();
//        	String likehistory = "";
//        	boolean hasliked = false;
//        	
//        	if(cookies != null) {
//        		String name = null;
//        		String value = null;
//        		for (Cookie cookie : cookies) {
//        			name = cookie.getName();
//    				value = cookie.getValue();
//    			
//    			if(name.equals("likehistory")) {
//    				likehistory = value;
//    				
//    				if(value.contains("|" + no + "|")) {
//    					hasliked = true;
//    	        		
//    	        		break;
//    				}
//    			}
//    		}
//        }
//
//        	if(!hasliked) {    		
//        		Cookie cookie = new Cookie("likehistory" ,likehistory +  "|" +  no + "|");
//        		
//        		cookie.setMaxAge(-1); 
//        		response.addCookie(cookie);
//        		
//        	}
//    		
//        	
//    	
//    	
//    	
//    	} else {
//
//    		
//    	}
    	

    	}	
	}

}
