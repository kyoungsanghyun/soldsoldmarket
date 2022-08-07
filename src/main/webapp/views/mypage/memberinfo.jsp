<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<style>
	.board_list td {
		width: calc(100% - 350px);
	}
	
</style>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/memberInfo.css">

       <div class="section">

        <h2>회원 정보 수정</h2>

        <hr>

		<form id="memberFrm" action="${ path }/mypage/memberinfo" method="post">
			

			<table class="board_list">
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
						${ member.name }		
					</td> 	
	            </tr>
	            <tr>
	                <th>아이디</th>
					<td>
						<input type="text" name="idUpdate" id="idUpdate" readonly
									value="${ member.id }">		
					</td> 	
	            </tr>
	            <tr>
	                <th>생일</th>
					<td>
						${ member.BDay }			
					</td> 	
	            </tr>
	            
	            <tr>
	                <th>성별</th>
					<td>
						${ member.gender }			
					</td> 	
	            </tr>
      	        <tr>
	                <th>휴대폰</th>
	                <td>
	                    <input type="tel" placeholder="010-1234-5678" name="phone" id="phone" 
	                    	value="${ member.phone }" maxlength="13">
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
	        <div class="page_wrap">
	        <input class="btn" type="submit" value="정보수정">
	        <input class="btn" type="button" id="btnDelete" value="탈퇴">
	        </div>
	        
	 	</form>
</div>

<jsp:include page="/views/common/footer.jsp" /> 
