<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/mypage.css">

       <section id="content">
        <h2 align="center">회원 정보 수정</h2>
    <div id="view-container">
		<form id="memberFrm" action="${ path }/mypage/memberinfo" method="post">
			<!-- 
			<input type="hidden" name="userNo" value="${ loginMember.no }">
			-->
			<table>
	            <tr>
	                <th>프로필 사진</th>
					<td>
						<input type="file" name="profileUpdate" id="profileUpdate" 
							value="${ member.img }">				
					</td> 	
	            </tr>
	            <tr>
	                <th>이름</th>
					<td>
						<input type="text" name="nameUpdate" id="nameUpdate" 
							value="${ member.name }" required>				
					</td> 	
	            </tr>
	            <tr>
	                <th>아이디</th>
					<td>
						<input type="text" name="idUpdate" id="idUpdate" 
							value="${ member.id }" required>				
					</td> 	
	            </tr>
	            <tr>
	                <th>비밀번호</th>
					<td>
						<input type="text" name="passwordUpdate" id="passwordUpdate" 
							value="${ member.pwd }" required>				
					</td> 	
	            </tr>
	            
	            <tr>
	                <th>생일</th>
					<td>
						<input type="date" name="bDay" id="bDay" 
							value="${ member.BDay }">				
					</td> 	
	            </tr>
	            
	            <tr>
	                <th>성별</th>
					<td>
						<input type="text" name="gender" id="gender" 
							value="${ member.gender }" required>				
					</td> 	
	            </tr>
      	        <tr>
	                <th>휴대폰</th>
	                <td>
	                    <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" 
	                    	value="${ member.phone }" maxlength="11">
	                </td>
	            </tr>
	            <tr>
	                <th>주소</th>
						<td>
							<input type="text" name="address" id="address"
								value="${ member.address }">
						</td> 	
	            </tr>
	            <tr>
	                <th>소개글</th>
						<td>
							<input type="text" name="introduceUpdate" id="introduceUpdate"
								value="${ member.intro }">
						</td> 	
	            </tr>
	        </table>
	        <input class="btn" type="submit" value="정보수정">
	        <input class="btn" type="button" id="btnDelete" value="탈퇴">
	 	</form>
 	</div>
</section>

</div>
<jsp:include page="/views/common/footer.jsp" /> 
