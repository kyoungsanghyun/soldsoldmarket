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


    <div class="section">
        <div class="intro_text">
            <table class="information">
				<tr>
                    <td>프로필 사진</td>
                    <td>img</td>
                </tr>            
                <tr>
                    <td>회원아이디 : </td>
                    <td>id</td>
                </tr>
                <tr>
                    <td>신고당한 수 : </td>
                    <td>count</td>
                </tr>
                <tr>
                    <td>주요 거래지역 : </td>
                    <td>area</td>
                </tr>
                <tr>
                    <td>판매횟수 : </td>
                    <td>count</td>
                </tr>
                <tr>
                    <td>방문횟수 : </td>
                    <td>count</td>
                </tr>
                <tr>
                    <td>가입일 : </td>
                    <td>date</td>
                </tr>
                <tr>
                    <td>소개글 : </td>
                    <td>introduce</td>
                </tr>
            </table>
        </div>
    
    <!-- intro end -->
    <hr> 
       <section id="content">
        <h2 align="center">회원 정보 수정</h2>
    <div id="view-container">
		<form id="memberFrm" action="${ path }/member/update" method="post">
			<!-- 
			<input type="hidden" name="userNo" value="${ loginMember.no }">
			-->
			<table>
	            <tr>
	                <th>이름</th>
					<td>
						<input type="text" name="name" id="name" 
							value="${ loginMember.name }" required>				
					</td> 	
	            </tr>
	            <tr>
	                <th>생일</th>
					<td>
						<input type="text" name="bDay" id="bDay" 
							value="${ loginMember.bDay }">				
					</td> 	
	            </tr>
	            <tr>
	                <th>성별</th>
					<td>
						<input type="text" name="gender" id="gender" 
							value="${ loginMember.gender }" required>				
					</td> 	
	            </tr>
      	        <tr>
	                <th>휴대폰</th>
	                <td>
	                    <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" 
	                    	value="${loginMember.phone }" maxlength="11">
	                </td>
	            </tr>
	            <tr>
	                <th>이메일</th>
					<td>
						<input type="email" placeholder="abc@abc.com" name="email" id="email"
							value="${ loginMember.email }">												
					</td> 	
	            </tr>
	            <tr>
	                <th>주소</th>
						<td>
							<input type="text" name="address" id="address"
								value="${ loginMember.address }">
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
