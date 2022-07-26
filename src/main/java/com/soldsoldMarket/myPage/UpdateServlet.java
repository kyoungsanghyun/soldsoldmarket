package com.soldsoldMarket.myPage;

import java.io.IOException;
import java.lang.reflect.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/member/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateServlet() {
    }
    
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
      
    int result = 0;
      
    if (loginMember != null) {
    	  // 2. 사용자가 수정한 내용을 가지고 Member 객체를 생성
		  Member member = new Member();
		      
		  member.setNo(loginMember.getNo());
//		  member.setNo(request.getParameter("userNo"));
		  member.setId(request.getParameter("userId"));
		  member.setName(request.getParameter("userName"));
		  member.setPhone(request.getParameter("phone"));
		  member.setEmail(request.getParameter("email"));
		  member.setAddress(request.getParameter("address"));
		  
		  System.out.println(member);
		  
		  result = new MemberService().save(member);
		  
		  if (result > 0) {
			  // 회원 정보 수정 성공
			  // 세션 갱신한다.
			  session.setAttribute("loginMember", new MemberService().findMemberById(loginMember.getId()));
			  request.setAttribute("msg", "회원 정보 수정 완료");
	          request.setAttribute("location", "/member/mypage");
			  
		  } else {
			  request.setAttribute("msg", "회원 정보 수정 실패");
	          request.setAttribute("location", "/member/mypage");
		  } 
         } else {
          request.setAttribute("msg", "로그인 후 수정해 주세요.");
          request.setAttribute("location", "/");
           
         }
          request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
           
         
    
    
    
    
    
    
  }

}