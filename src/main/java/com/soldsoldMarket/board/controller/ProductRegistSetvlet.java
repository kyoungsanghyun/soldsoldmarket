package com.soldsoldMarket.board.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.Part;
import com.soldsoldMarket.board.model.service.ProductRegistService;
import com.soldsoldMarket.common.util.FileRename;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;

@WebServlet("/board/regist")
public class ProductRegistSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductRegistSetvlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {    		
    		request.getRequestDispatcher("/views/board/write.jsp").forward(request, response);    		
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Product product = null;
    	
    	// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board");
		
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	// 파라미터로 넘어온 값들
    	int p_id = Integer.parseInt(mr.getParameter("PNo"));
    	String p_date = mr.getParameter("PDate");
    	String m_id = mr.getParameter("writer");
    	
    	//폼
    	String category = mr.getParameter("category");
    	String p_name = mr.getParameter("title");
    	String price = mr.getParameter("price");
    	String p_qlt = mr.getParameter("condition");
    	String location = mr.getParameter("location");
    	String exchange = mr.getParameter("exchange");
    	int count = Integer.parseInt(mr.getParameter("count"));
    	String content = mr.getParameter("content");
 
    	// 파일에 대한 정보
//    	 String filesystemName = mr.getFilesystemName("upimg");
//    	 String originalFileName = mr.getOriginalFileName("upimg"); 
    	
    	 try {
    		 Enumeration<?> files = mr.getFileNames();
    	 } catch(Exception e) {
    		 e.printStackTrace();
    	 }

    	
    	
    	
		System.out.println(category);
		System.out.println(p_name);
		System.out.println(price);
		System.out.println(p_qlt);
		System.out.println(location);
		System.out.println(exchange);
		System.out.println(count);
		System.out.println(content);
		System.out.println(files);


    	
    	
    
    
    		
    	
    }
    
}
