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
import com.soldsoldMarket.product.model.vo.Pcomment;



@WebServlet("/product/comment")
public class ProductCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService service = new ProductService();

    public ProductCommentServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		String content = request.getParameter("content");

		
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("member") : null;

    	if(loginMember != null) {
			Pcomment pcomment = new Pcomment();
			
			pcomment.setPNo(productNo);
			pcomment.setPCm_id(loginMember.getId());
			pcomment.setPCm_content(content);
			
			int result = service.saveComment(pcomment);
			
			if(result > 0) {
         		request.setAttribute("msg", "댓글이 등록되었습니다.");
         		request.setAttribute("location", "/product/view?no=" + productNo);
			} else {
				request.setAttribute("msg", "댓글 등록 실패");
         		request.setAttribute("location", "/product/view?no=" + productNo);
			}
    	} else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   	}
}