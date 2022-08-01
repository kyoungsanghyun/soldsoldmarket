package com.soldsoldMarket.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.product.model.vo.Product;
import com.soldsoldMarket.common.util.FileRename;


@WebServlet("/board/inquiry")
public class inquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public inquiryServlet() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member member = (session == null) ? null : (Member) session.getAttribute("member");
    	
    	if (member != null) {    		
    		request.getRequestDispatcher("/views/product/regist.jsp").forward(request, response);    		
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
    	int result2 = 0;
    	Product product = null;
		
    	// 파일 최대 크기 설정(10MB)
    	int maxSize = 10485760;
		
    	// 파일 저장 경로
    	String path = getServletContext().getRealPath("/resources/upload/product");
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
	}

}
