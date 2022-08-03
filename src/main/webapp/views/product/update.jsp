<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/productregist.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>

<section id="content">
	<div class="write">
		<form name = "productRegist" action="${ path }/product/update" method="POST" enctype="multipart/form-data">
		
			<div class="information">
				<button>상품수정</button>
				<br>
				<h2>기본정보</h2>
				<hr>
				<input type="hidden" name="writer" id="writerId" value="${product.MId}" readonly> <!-- 작성자 아이디 -->
				<input type="hidden" name="p_no" value="${product.PNo}">
				<!-- 기존 파일 이름 -->
				<input type="hidden" name="imgpre5" id="imgpre5" value="${padd.PAimg1}">
				<input type="hidden" name="imgpre4" id="imgpre4" value="${padd.PAimg2}">
				<input type="hidden" name="imgpre3" id="imgpre3" value="${padd.PAimg3}">
		        <input type="hidden" name="imgpre2" id="imgpre2" value="${padd.PAimg4}">
		      	<input type="hidden" name="imgpre1" id="imgpre1" value="${padd.PAimg5}">
				<!-- 여기까지 숨겨진 값 -->
				
				<select class="category" name="category" required>
					<option value="1" <c:if test="${product.CId eq '1'}">selected</c:if>>의류 >>> ${product.CId}</option>
					<option value="2" <c:if test="${product.CId eq '2'}">selected</c:if>>악세서리</option>
					<option value="3" <c:if test="${product.CId eq '3'}">selected</c:if>>디지털/가전</option>
					<option value="4" <c:if test="${product.CId eq '4'}">selected</c:if>>스포츠/레저</option>
					<option value="5" <c:if test="${product.CId eq '5'}">selected</c:if>>도서/음반</option>
					<option value="6" <c:if test="${product.CId eq '6'}">selected</c:if>>반려동물</option>
					<option value="7" <c:if test="${product.CId eq '7'}">selected</c:if>>기타</option>
				</select>
				<br>		
				<input type="text" name="title" id="title" value="${ product.PName }" required>
				<select class="status" name="status" required>
					<option value="new">거래중</option>
					<option value="resorved">예약</option>
					<option value="soldout">거래완료</option>
				</select>
			</div>
			<div class="board-write-box">
				<br>
				<span><b>판매 가격 *</b></span>
				<br><br>
				<input type="text" name="price" id="price" value="${ product.PPrice }" required> 원
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>상품 상태</b></span>
				<br><br>
				<input type="radio" name="condition" value="open" <c:if test ="${product.PQlt eq 'open'}">checked="checked"</c:if>> 개봉
				<input type="radio" name="condition" value="new" <c:if test ="${product.PQlt eq 'new'}">checked="checked"</c:if>>거의 새것
				<input type="radio" name="condition" value="used" <c:if test ="${product.PQlt eq 'used'}">checked="checked"</c:if>>사용감 있음
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>거래지역 *</b></span>
				<br><br>
				<input type="text" name="place" id="place" value="${ product.PLocation }" required>
				<hr style="width:90%; margin: 20px 0 0 5%;">     
				<br>    
				<span><b>교환 *</b></span>
				<br><br>
				<input type="radio" name="exchange" value="N" <c:if test ="${product.PExchange eq 'N'}">checked="checked"</c:if>> 불가
				<input type="radio" name="exchange" value="Y" <c:if test ="${product.PExchange eq 'Y'}">checked="checked"</c:if>> 가능
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>수량</b></span>
				<br><br>
				<input type="text" name="count" id="count" value="${ product.PQtt }" required> 개
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>설명 *</b></span>
				<br><br>
				<textarea name="content" cols="128" rows="15" minlangth="10">${ product.PContents }</textarea>
				<br><br>
				<span><b>이미지 추가</b></span>
		        <br>
          		<br>
	            <table>
	            <tr>
					<td style="text-align: center;">
						대표이미지 : <input type="file" name="filename1" id="filename1">
						<br/>
						추가이미지 : <input type="file" name="filename2" id="filename2">
						<br/>
						추가이미지 : <input type="file" name="filename3" id="filename3">
						<br/>
						추가이미지 : <input type="file" name="filename4" id="filename4">
						<br/>
						추가이미지 : <input type="file" name="filename5" id="filename5">
						<br/>
					</td>
				</tr>
				<tr>
		          
		         </tr>
	            </table> 
	          	<div class="bottom">
	            	<button type="submit">수정하기</button>
	         	</div>
	         	
	      </div>
       </form>
     </div>
  </section>


  <script>
  
  </script>
<jsp:include page="/views/common/footer.jsp" />