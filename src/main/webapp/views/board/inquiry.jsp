<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/productregist.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<section id="content">
	<div class="write">
		<form name = "inquiry" action="${ path }/board/inquiry" method="POST" enctype="multipart/form-data">
		<div class="information">
			<button>문의등록</button>
			<br>
			<h2>1:1문의</h2>
			<hr>
			<input type="hidden" name="writer" id="writerId" value="${ member.id }" readonly>
			<select class="category" name="category" required>
				<option value="Q">1:1문의</option>
				<option value="R">신고</option>
			</select>
			<br>
			<input type="text" name="title" id="title"
				placeholder="제목을 입력하세요." required>
		</div>
		<div class="inqueiry-write-box">
			<br>
			<span><b>문의 내용 *</b></span>
			<br><br>
			<textarea name="content" cols="130" rows="15" minlangth="10"
				placeholder="문의 내용을 자세히 입력해주세요.(10자 이상)"></textarea>
			<br>
			<br>
			<hr style="width:90%; margin: 20px 0 0 5%">
			<br>
			<br>
			<span><b>첨부파일</b></span>
			<br><br>
			<table>
	            <tr>
					<td style="text-align: center;">
						첨부파일1 : <input type="file" name="filename1" id="filename1"><br/>
						첨부파일2 : <input type="file" name="filename2" id="filename2"><br/>
						첨부파일3 : <input type="file" name="filename3" id="filename3"><br/>
						첨부파일4 : <input type="file" name="filename4" id="filename4"><br/>
						첨부파일5 : <input type="file" name="filename5" id="filename5"><br/>
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

<script type="text/javascript">

</script>




