package com.soldsoldMarket.product.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.soldsoldMarket.common.util.FileRename;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.product.model.service.ProductService;
import com.soldsoldMarket.product.model.vo.PAdd;
import com.soldsoldMarket.product.model.vo.Product;

@WebServlet("/product/update")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductUpdateServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크 & 본인 게시글 여부 확인 (추후 적용)
    	Product product = null;
    	PAdd padd = null;
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	System.out.println("게시글 번호 : " + no);
    	
    	product = new ProductService().getProductByNo(no, false);
    	
    	System.out.println(product);
    	
    	request.setAttribute("product", product);
    	request.setAttribute("padd", padd);
    	request.getRequestDispatcher("/views/product/update.jsp").forward(request, response);
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
    	
    	// 글 번호
    	int p_no = Integer.parseInt(mr.getParameter("p_no"));
    	
    	// 폼파라미터
    	String category = mr.getParameter("category");
    	String p_name = mr.getParameter("title");
    	int price = Integer.parseInt(mr.getParameter("price"));
    	String p_qlt = mr.getParameter("condition");
    	String location = mr.getParameter("place");
    	String exchange = mr.getParameter("exchange");
    	int count = Integer.parseInt(mr.getParameter("count"));
    	String content = mr.getParameter("content");
    	
    	// 새로 첨부된 이미지 적용
    	Enumeration<?> files = mr.getFileNames();
    	int i = 1;
    	PAdd new_padd = new PAdd();
    	
    	while (files.hasMoreElements()) { // 업로드 된 파일 이름 얻어오기
            String file = (String) files.nextElement();
            String fileName = mr.getFilesystemName(file);
            new_padd.setPNo(p_no);
            
            if (i == 1) {
               if(fileName == null) {
                  new_padd.setPAimg5(mr.getParameter("imgpre5"));
               }else {
            	  new_padd.setPAimg5(fileName);
               }
            } else if (i == 2) {
               if(fileName == null) {
            	  new_padd.setPAimg4(mr.getParameter("imgpre4"));
               }else {
            	  new_padd.setPAimg4(fileName);
               }
            } else if (i == 3) {
               if(fileName == null) {
            	  new_padd.setPAimg3(mr.getParameter("imgpre3"));
               }else {
            	  new_padd.setPAimg3(fileName);
               }
            } else if (i == 4) {
                if(fileName == null) {
              	  new_padd.setPAimg2(mr.getParameter("imgpre2"));
                 }else {
              	  new_padd.setPAimg2(fileName);
                 }
            } else if (i == 5) {
                if(fileName == null) {
                	  new_padd.setPAimg1(mr.getParameter("imgpre1"));
                   }else {
                	  new_padd.setPAimg1(fileName);
            }
            i++;
            }
    	}
            
            HttpSession session = request.getSession(false);
        	Member member = (session == null) ? null : (Member) session.getAttribute("member");
        	
    			if (member != null) {    	
        		product = new Product();
        		
        		product.setPNo(p_no);
    	    	product.setMId(m_id);
    	    	product.setCId(category);
    	    	product.setPName(p_name);
    	    	product.setPPrice(price);
    	    	product.setPQlt(p_qlt);
    	    	product.setPTrading(mr.getParameter("status")); // getPTrading
    	    	product.setPLocation(location);
    	    	product.setPExchange(exchange);
    	    	product.setPQtt(count);
    	    	product.setPContents(content);
  
    	    	result = new ProductService().updateProduct(product);
    	    	System.out.println("result >>>" + result);
//    	    	result2 = new ProductService().updateProductImg(new_padd, product);
//    	    	System.out.println("result 222 >>>" + result2);
		    	
    	    	if (result > 0 ) { 
            		request.setAttribute("msg", "게시글 수정 성공");
    	    	} else {
    	    		request.setAttribute("msg", "게시글 수정 실패");
    	    	}

    	    	request.setAttribute("location", "/product/view?no=" + product.getPNo());
    	    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    			}
    }
}

