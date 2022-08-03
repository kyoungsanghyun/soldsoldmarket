package com.soldsoldMarket.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.soldsoldMarket.common.util.FileRename;
import com.soldsoldMarket.member.model.vo.Member;
import com.soldsoldMarket.notice.model.service.NoticeService;
import com.soldsoldMarket.notice.model.vo.Notice;

@WebServlet("/notice/update")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeUpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(false);
		Member loginmember = session==null? null: (Member)session.getAttribute("member");
		int no = Integer.parseInt(request.getParameter("no"));
    	Notice notice = null;
    	notice = new NoticeService().getNoticeByNo(no,true);
    	
    	
    	if((loginmember != null) && loginmember.getId().equals(notice.getWriterId())) {
    		
    		request.setAttribute("notice", notice);
    		request.getRequestDispatcher("/views/notice/update.jsp").forward(request, response);
    		
    	}else {
    		request.setAttribute("msg", "로그인후 시도하세요/ 본인 게시글만 수정 가능합니다.");
			request.setAttribute("location", "/notice/list");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    		
    	}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Notice notice = null;
    	int result = 0;
    	
    	//파일이 저장될 경로
		String path = getServletContext().getRealPath("/resources/upload/notice");
		
		//파일 사이즈 지정(10MB)
		int maxSize = 10485760;
		
		//인코딩 설정
		String encoding = "UTF-8";
		
		//DefaultFileRenamePolicy : 중복되는 이름 뒤에 1~9999를 붙인다.
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    			
		notice = new Notice();
		notice.setNo(Integer.parseInt(mr.getParameter("no")));
		notice.setTitle(mr.getParameter("title"));
		notice.setWriterId(mr.getParameter("id"));
		notice.setContent(mr.getParameter("content"));
		
		String of = mr.getOriginalFileName("file");
		String fs = mr.getFilesystemName("file");
		
		if(of != null && !of.equals("")) {
			File file = new File(path+"/"+mr.getParameter("renamedFileName"));
			if(file.exists()) {
				file.delete();
			}
			
			notice.setOriginalFileName(of);
			notice.setRenamedFileName(fs);
		}else {
			notice.setOriginalFileName(mr.getParameter("originalFileName"));
			notice.setRenamedFileName(mr.getParameter("renamedFileName"));
		}
		
		
		result = new NoticeService().save(notice);
		
		if(result > 0 ) {
			request.setAttribute("msg", "게시글 수정 성공");
		}else {
			request.setAttribute("msg", "게시글 수정 실패");
		}
		request.setAttribute("location", "/notice/view?no="+notice.getNo());
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
    }

}
