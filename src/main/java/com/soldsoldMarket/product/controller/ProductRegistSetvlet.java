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

@WebServlet("/board/regist")
public class ProductRegistSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductRegistSetvlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    

    }
    @Override 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	int result2 = 0;
    	Product product = null;
		
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
    	
    	// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/product");
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
	
		// 글 정보	
    	// 파라미터로 넘어온 값들
    	int p_id = Integer.parseInt(mr.getParameter("PNo"));
    	String p_date = mr.getParameter("PDate");
    	String m_id = mr.getParameter("writer");
    	
    	// 폼
    	String category = mr.getParameter("category");
    	String p_name = mr.getParameter("title");
    	int price = Integer.parseInt(mr.getParameter("price"));
    	String p_qlt = mr.getParameter("condition");
    	String location = mr.getParameter("location");
    	String exchange = mr.getParameter("exchange");
    	int count = Integer.parseInt(mr.getParameter("count"));
    	String content = mr.getParameter("content");
    	
    	// 파일 정보
       	Enumeration<?> files = mr.getFileNames();
    	int i = 1; //선언
    	PAdd padd = new PAdd();
		
    	//files담긴 파일들을 개별적으로 순차적으로 돈다.
		while (files.hasMoreElements()) { // 업로드 된 파일 이름 얻어오기
			//files의 다음 항목을 filed에 담는다.
			String file = (String) files.nextElement();
			//mr에서 해당 file의 이름을 filename에 담는다.
			String fileName = mr.getFilesystemName(file);
			if (fileName == null) {
				fileName = "";
			}
			if (i == 1) {
				//i가 1이면 pvo의 setPAimg1에 해당 파일명을 담는다.
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
			i++;//증가
		}
    	
    		product = new Product();
    		
	    	product.setPNo(p_id);
	    	product.setMId(m_id);
	    	product.setCId(category);
	    	product.setPName(p_name);
	    	product.setPPrice(price);
	    	product.setPQlt(p_qlt);
	    	product.setPLocation(location);
	    	product.setPExchange(exchange);
	    	product.setPQtt(count);
	    	product.setPContents(content);
	    	
	    	 
	    	result = new ProductService().insertProduct(product);
	    	result2 = new ProductService().insertPAdd(padd, product);
	    	
	    	if(result > 0 && result2 > 0) {
        		request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/");
    		} else {
        		request.setAttribute("msg", "게시글 등록 실패");
        		request.setAttribute("location", "/");
    		}

    }
}
