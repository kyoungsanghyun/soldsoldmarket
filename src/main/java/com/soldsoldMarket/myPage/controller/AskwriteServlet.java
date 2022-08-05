package com.soldsoldMarket.mypage.controller;

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
import com.soldsoldMarket.mypage.model.service.BoardService;
import com.soldsoldMarket.mypage.model.vo.M_Board;

@WebServlet("/mypage/askwrite")
public class AskwriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AskwriteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/askwrite.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 int result = 0;
         M_Board board = null;
         
         
         // 파일이 저장될 경로
         String path = getServletContext().getRealPath("/resources/upload/askboard");
         
         // 파일의 사이즈 지정 (10MB)
         int maxSize = 10485760;
         
         // 인코딩 설정
         String encoding = "UTF-8";
         
         // DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
//         MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
         MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
         
         // 폼 파라미터로 넘어온 값들 (파일에 대한 정보X)
         String title = mr.getParameter("title");
         String writer = mr.getParameter("writer");
         String content = mr.getParameter("content");
         
         // 파일에 대한 정보를 가져올 때
         String filesystemName = mr.getFilesystemName("upfile");
         String OriginalFileName = mr.getOriginalFileName("upfile");
         
         HttpSession session = request.getSession(false);
         Member loginMember = (session == null) ? null : (Member) session.getAttribute("member");

         if (loginMember != null) {
            board = new M_Board();
            
            board.setWriterId(loginMember.getId());
            board.setTitle(title);
            board.setContent(content);
            board.setOriginalFileName(OriginalFileName);
            board.setRenamedFileName(filesystemName);
            
            result = new BoardService().save(board);
            if(result >0) {
               request.setAttribute("msg", "게시글 등록 성공");
               request.setAttribute("location", "/mypage/asklist");
            } else {
               request.setAttribute("msg", "게시글 등록 실패");
               request.setAttribute("location", "/mypage/askwrite");
               
            }
            
         } else {
            request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
            request.setAttribute("location", "/");
         }
         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
      }
   }