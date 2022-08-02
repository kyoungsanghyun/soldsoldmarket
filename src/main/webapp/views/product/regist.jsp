<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/productregist.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<style>


</style>

<script>

</script>

<section id="content">
	<div class="write">
		<form name = "productRegist" action="${ path }/product/regist" method="POST" enctype="multipart/form-data">
			<div class="information">
				<button>상품등록</button>
				<br>
				<h2>기본정보</h2>
				<hr>
				<input type="hidden" name="writer" id="writerId" value="${ member.id }" readonly>
				<!-- PNo, writer는 숨겨진 값 -->
				<select class="category" name="category" required>
					<option value="1">의류</option>
					<option value="2">악세서리</option>
					<option value="3">디지털/가전</option>
					<option value="4">스포츠/레저</option>
					<option value="5">도서/음반</option>
					<option value="6">반려동물</option>
					<option value="7">기타</option>
				</select>		
				<input type="text" name="title" id="write_title"
					placeholder="상품명을 입력하세요." required>
			</div>
			<div class="board-write-box">
				<br>
				<span><b>판매 가격 *</b></span>
				<br><br>
				<input type="text" name="price" id="price"
					placeholder="가격을 입력해주세요." required> 원
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>상품 상태</b></span>
				<br><br>
				<input type="radio" name="condition" value="open"/> 개봉
				<input type="radio" name="condition" value="new"/>거의 새것
				<input type="radio" name="condition" value="used"/>사용감 있음
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>거래지역 *</b></span>
				<br><br>
				<input type="text" name="location" id="location"
					placeholder="거래지역을 입력해주세요." required>
				<hr style="width:90%; margin: 20px 0 0 5%;">     
				<br>    
				<span><b>교환 *</b></span>
				<br><br>
				<input type="radio" name="exchange" value="N"/> 불가
				<input type="radio" name="exchange" value="Y"/> 가능
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>수량</b></span>
				<br><br>
				<input type="text" name="count" id="count"
					placeholder="수량을 입력해주세요." required> 개
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>설명 *</b></span>
				<br><br>
				<textarea name="content" cols="128" rows="15" minlength="10"
					placeholder="구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 필수로 입력해 주세요. (10자 이상 입력)"></textarea>
				<br><br>
				<span><b>이미지 추가</b></span>
		        <br>
          		<br>
	           <table>
	            <tr>
					<td style="text-align: center;">
						대표이미지 : <input type="file" name="filename1" id="filename1"><br/>
						추가이미지 : <input type="file" name="filename2" id="filename2"><br/>
						추가이미지 : <input type="file" name="filename3" id="filename3"><br/>
						추가이미지 : <input type="file" name="filename4" id="filename4"><br/>
						추가이미지 : <input type="file" name="filename5" id="filename5"><br/>
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
