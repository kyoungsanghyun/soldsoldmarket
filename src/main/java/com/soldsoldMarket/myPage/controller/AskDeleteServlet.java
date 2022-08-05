package com.soldsoldMarket.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.soldsoldMarket.mypage.model.service.BoardService;

@WebServlet("/mypage/askdelete")
public class AskDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AskDeleteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크 & 본인 게시글 여부 확인(직접 적용시켜 보세요.)
    	int result = 0;
    	
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	System.out.println("게시글 번호 : " + no);    	
    	
    	result = new BoardService().delete(no);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 삭제 성공");
    		request.setAttribute("location", "/mypage/asklist");
    	} else {
    		request.setAttribute("msg", "게시글 삭제 실패");
    		request.setAttribute("location", "/mypage/askboardview?no=" + no);
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	
    }


}
