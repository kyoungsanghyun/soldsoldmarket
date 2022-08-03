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


@WebServlet(name = "ProductDeleteServlet", urlPatterns = { "/product/delete" })
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductDeleteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("member") : null;
    	
    	if(loginMember != null) {
    		
    		int no = Integer.parseInt(request.getParameter("no"));
    		int result = 0;
    		
    		
    		result = new ProductService().deleteProduct(no);
    		
    		System.out.println("no : " + no);
    		System.out.println("result : " + result);
    		
    		if(result>0) {
    			request.setAttribute("msg","정상적으로 삭제되었습니다.");
    			request.setAttribute("location","/product/list");
    		} else {
    			request.setAttribute("msg","게시글 삭제 실패");
    			request.setAttribute("location","/product/view?no=" + no);
    			
    		}
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
    		
    	}
    	
    	

}
