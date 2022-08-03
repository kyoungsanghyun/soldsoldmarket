package com.soldsoldMarket.product.controller;


import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.common.util.FileRename;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;

@WebServlet("/product/regist")
public class ProductRegistSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductRegistSetvlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	Member member = (session == null) ? null : (Member) session.getAttribute("member");
    	
    	if (member != null) {    		
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
    	int result2 = 0;
    	Product product = null;
		
    	// 파일의 최대 크기 (10MB)
    	int maxSize = 10485760;
    	
    	// 파일의 저장 경로
    	String path = getServletContext().getRealPath("/resources/upload/product");
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
	
		// 글 게시자 정보
    	String m_id = mr.getParameter("writer");
    	
    	// 폼파라미터
    	String category = mr.getParameter("category");
    	String p_name = mr.getParameter("title");
    	int price = Integer.parseInt(mr.getParameter("price"));
    	String p_qlt = mr.getParameter("condition");
    	String location = mr.getParameter("location");
    	String exchange = mr.getParameter("exchange");
    	int count = Integer.parseInt(mr.getParameter("count"));
    	String content = mr.getParameter("content");
    	
    	// 파일 정보 가져오기
       	Enumeration<?> files = mr.getFileNames();
    	int i = 1;
    	PAdd padd = new PAdd();
		
		while (files.hasMoreElements()) { 
			String file = (String) files.nextElement();
			String fileName = mr.getFilesystemName(file);
			if (fileName == null) {
				fileName = "";
			}
			if (i == 1) {
				padd.setPAimg5(fileName);
			} else if (i == 2) {
				padd.setPAimg4(fileName);
			} else if (i == 3) {
				padd.setPAimg3(fileName);
			} else if (i == 4) {
				padd.setPAimg2(fileName);
			} else if (i == 5) {
				padd.setPAimg1(fileName);
			}
			i++;
		}
    	
		
		HttpSession session = request.getSession(false);
    	Member member = (session == null) ? null : (Member) session.getAttribute("member");
    	
			if (member != null) {    	
    		product = new Product();
    		
	    	product.setMId(m_id);
	    	product.setCId(category);
	    	product.setPName(p_name);
	    	product.setPPrice(price);
	    	product.setPQlt(p_qlt);
	    	product.setPLocation(location);
	    	product.setPExchange(exchange);
	    	product.setPQtt(count);
	    	product.setPContents(content);
	    	
	    	System.out.println(category);
	    	
	    	 
	    	result = new ProductService().insertProduct(product);
	    	result2 = new ProductService().insertPAdd(padd, product);
	    	
	    	if(result > 0 && result2 > 0) {
        		request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/");
    		} else {
        		request.setAttribute("msg", "게시글 등록 실패");
        		request.setAttribute("location", "/");
    		}
	    } else {
			request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
    