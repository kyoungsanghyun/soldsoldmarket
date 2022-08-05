package com.soldsoldMarket.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soldsoldMarket.common.util.PageInfo;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.mypage.model.service.BoardService;
import com.soldsoldMarket.mypage.model.vo.M_Board;

@WebServlet("/mypage/asklist")
public class AsklistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AsklistServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("member"); 
		
		if (loginMember != null) {
			
			int page = 0;
	    	int listCount = 0;
	    	PageInfo pageInfo = null;
	    	List<M_Board> list = null;

	    	try {
	    		page = Integer.parseInt(request.getParameter("page"));
	    	} catch (NumberFormatException e) {
				page = 1;
			}
	    	
	    	listCount = new BoardService().getBoardCount();
	    	pageInfo = new PageInfo(page, 5, listCount, 5); // 게시글 갯수 설정
	    	list = new BoardService().getBoardList(pageInfo);
	    	
	    	request.setAttribute("pageInfo", pageInfo);
	    	request.setAttribute("list", list);
	
					
			request.getRequestDispatcher("/views/mypage/asklist.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "로그인 후 문의내역을 확인해 주세요.");
			request.setAttribute("location", "/");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		

		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
