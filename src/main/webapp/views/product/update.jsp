<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/productregist.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<script>


</script>

<section id="content">
	<div class="write">
		<form name = "productRegist" action="${ path }/product/update" method="POST" enctype="multipart/form-data">
			<div class="information">
				<button>상품수정</button>
				<br>
				<h2>기본정보</h2>
				<hr>
				<input type="hidden" name="writer" id="writerId" value="${ product.MId }" readonly>
				<!-- PNo, writer는 숨겨진 값 -->
				<select class="category" name="category" required>
					<option value="1" ${ product.CId eq '1'? 'selected' : '' }>의류</option>
					<option value="2" ${ product.CId eq '2'? 'selected' : '' }>악세서리</option>
					<option value="3" ${ product.CId eq '3'? 'selected' : '' }>디지털/가전</option>
					<option value="4" ${ product.CId eq '4'? 'selected' : '' }>스포츠/레저</option>
					<option value="5" ${ product.CId eq '5'? 'selected' : '' }>도서/음반</option>
					<option value="6" ${ product.CId eq '6'? 'selected' : '' }>반려동물</option>
					<option value="7" ${ product.CId eq '7'? 'selected' : '' }>기타</option>
				</select>
				<br>		
				<input type="text" name="title" id="title" value="${ product.PName }" required>
				<select class="status" name="status" required>
					<option value="거래중">거래중</option>
					<option value="예약">예약</option>
					<option value="거래완료">거래완료</option>
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
				<input type="radio" name="condition" value="open" checked='<c:if test="${product.PQlt eq 'open'}"></c:if>'> 개봉
				<input type="radio" name="condition" value="new" checked='<c:if test="${product.PQlt eq 'new'}"></c:if>'>거의 새것
				<input type="radio" name="condition" value="used" checked='<c:if test="${product.PQlt eq 'used'}"></c:if>'>사용감 있음
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>거래지역 *</b></span>
				<br><br>
				<input type="text" name="place" id="place" value="${ product.PLocation }" required>
				<hr style="width:90%; margin: 20px 0 0 5%;">     
				<br>    
				<span><b>교환 *</b></span>
				<br><br>
				<input type="radio" name="exchange" value="no" checked='<c:if test="${product.PExchange eq 'no'}"></c:if>'> 불가
				<input type="radio" name="exchange" value="yes" checked='<c:if test="${product.PExchange eq 'yes'}"></c:if>'> 가능
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>수량</b></span>
				<br><br>
				<input type="text" name="count" id="count" value="${ product.PQtt }" required> 개
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>설명 *</b></span>
				<br><br>
				<textarea name="content" cols="128" rows="15">${ product.Pcontents }</textarea>
				<br><br>
				<span><b>이미지 추가</b></span>
		        <br>
          		<br>
	            <table>
	            <tr>
					<td style="text-align: center;">
						대표이미지 : <input type="file" name="filename1" id="filename1">
						<c:if test="${ not empty padd.PAimg1 }">
							<span>${ padd.PAimg1 }</span>
						</c:if>
						<br/>
						추가이미지 : <input type="file" name="filename2" id="filename2">
						<c:if test="${ not empty padd.PAimg2 }">
							<span>${ padd.PAimg2 }</span>
						</c:if>
						<br/>
						추가이미지 : <input type="file" name="filename3" id="filename3">
						<c:if test="${ not empty padd.PAimg3 }">
							<span>${ padd.PAimg3 }</span>
						</c:if>
						<br/>
						추가이미지 : <input type="file" name="filename4" id="filename4">
						<c:if test="${ not empty padd.PAimg4 }">
							<span>${ padd.PAimg4 }</span>
						</c:if>
						<br/>
						추가이미지 : <input type="file" name="filename5" id="filename5">
						<c:if test="${ not empty padd.PAimg5 }">
							<span>${ padd.PAimg5 }</span>
						</c:if>
						<br/>
					</td>
				</tr>
	            </table> 
	          	<div class="bottom">
	            	<button type="submit">등록하기</button>
	         	</div>
	         	
	         	
	      </div>
       </form>
     </div>
  </section>

<jsp:include page="/views/common/footer.jsp" />