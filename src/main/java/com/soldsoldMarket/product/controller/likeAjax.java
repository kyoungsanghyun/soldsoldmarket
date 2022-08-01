package com.soldsoldMarket.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.Product;


@WebServlet("/likeAjax.do")
public class likeAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProductService service = new ProductService();

    public likeAjax() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Product product = null;
		int result = 0;
		
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		request.getRequestDispatcher("/views/board/write.jsp").forward(request, response);    		
    	} else {
    		
//        	int no = Integer.parseInt(request.getParameter("no"));
    		result = service.likelogic(product);
    		request.setAttribute("product", product);
    		System.out.println("되나 ?");
    		
    		if (result > 0) {
    		}
    		
//    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
//    		request.setAttribute("location", "/");
//    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
    }


}
