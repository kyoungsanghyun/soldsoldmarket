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
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.board.model.vo.BAdd;
import com.soldsoldMarket.board.model.vo.board;
import com.soldsoldMarket.board.model.service.BoardService;
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
    		request.getRequestDispatcher("/views/board/inquiry.jsp").forward(request, response);    		
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
    	int result2 = 0;
    	board board = null;
		
    	// 파일 최대 크기 설정(10MB)
    	int maxSize = 10485760;
		
    	// 파일 저장 경로
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	// 글 게시자 정보
    	String m_id = mr.getParameter("writer");
    	
    	// 폼파라미터
    	char bType = mr.getParameter("category").charAt(0);
    	String bTitle = mr.getParameter("title");
    	String bContent = mr.getParameter("content");
    	
    	// 파일 정보 가져오기
       	Enumeration<?> files = mr.getFileNames();
    	int i = 1;
    	BAdd badd = new BAdd();
		
		while (files.hasMoreElements()) { 
			String file = (String) files.nextElement();
			String fileName = mr.getFilesystemName(file);
			if (fileName == null) {
				fileName = "";
			}
			if (i == 1) {
				badd.setBAimg5(fileName);
			} else if (i == 2) {
				badd.setBAimg4(fileName);
			} else if (i == 3) {
				badd.setBAimg3(fileName);
			} else if (i == 4) {
				badd.setBAimg2(fileName);
			} else if (i == 5) {
				badd.setBAimg1(fileName);
			}
			i++;
		}
		
		HttpSession session = request.getSession(false);
		Member member = (session == null) ? null : (Member) session.getAttribute("member");

			if (member != null) {    	
			board = new board();
	    
			board.setMId(m_id);
			board.setBType(bType);
			board.setBTitle(bTitle);
			board.setBContent(bContent);
			
	    	result = new BoardService().insertInquiry(board);
	    	result2 = new BoardService().insertBAdd(badd, board);
	    	
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


