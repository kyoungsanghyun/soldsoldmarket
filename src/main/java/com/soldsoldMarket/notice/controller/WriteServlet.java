package com.soldsoldMarket.notice.controller;

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

@WebServlet("/notice/write")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/notice/writing.jsp").
		forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Notice notice =null;
		int result = 0;
		
		//파일이 저장될 경로
		String path = getServletContext().getRealPath("/resources/upload/notice");
		
		//파일 사이즈 지정(10MB)
		int maxSize = 10485760;
		
		//인코딩 설정
		String encoding = "UTF-8";
		
		//DefaultFileRenamePolicy : 중복되는 이름 뒤에 1~9999를 붙인다.
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		
		
		//폼파라미터 값
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");
		
		//파일에 대한 정보가져오기 filesystem - 기록된 이름 origin - 사용자가 올린 원본파일명
		
		String filesystemName = mr.getFilesystemName("file");
		String originalFileName = mr.getOriginalFileName("file");
//		System.out.println(filesystemName);
//		System.out.println(originalFileName);
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null:(Member)session.getAttribute("member");		
		
		if(loginMember != null) {
			notice = new Notice();
			
			notice.setWriterId(loginMember.getId());
			notice.setTitle(title);
			notice.setContent(content);
			notice.setOriginalFileName(originalFileName);
			notice.setRenamedFileName(filesystemName);
			result = new NoticeService().save(notice);
			
			if(result > 0) {
				request.setAttribute("msg", "게시글 등록 성공");
				request.setAttribute("location", "/notice/list");
				
			}else {
				request.setAttribute("msg", "게시글 등록 실패");
				request.setAttribute("location", "/notice/list");
			}
			
			
		}else {
			
			request.setAttribute("msg", "로그인후 사용해 주세요");
			request.setAttribute("location", "/");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);			
	
	
	}

}
