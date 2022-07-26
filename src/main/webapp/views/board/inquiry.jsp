<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<section id="content">
	<div class="write">
		<div class="information">
			<button>문의등록</button>
			<br>
			<h2>1:1문의</h2>
			<hr>
			<select class="category" name="category" required>
				<option value="1:1문의">1:1문의</option>
				<option value="신고">신고</option>
			</select>
			<br>
			<input type="text" name="title" id="title"
				placeholder="제목을 입력하세요." required>
		</div>
		<div class="inqueiry-write-box">
			<br>
			<span><b>문의 내용 *</b></span>
			<br><br>
			<textarea name="content" cols="130" rows="15"
				placeholder="문의 내용을 자세히 입력해주세요.(10자 이상)"></textarea>
			<br>
			<br>
			<hr style="width:90%; margin: 20px 0 0 5%">
			<br>
			<br>
			<span><b>첨부파일</b></span>
			<label class="input-file-button" for="input-file">
				파일 선택
			</label>
			<input type="file" id="input-file"/>
			<div id="preview">
			<span>${ board.originalFileName }</span>
			</div>
		</div>
	</div>

</section>
<script>
function fileUpload(){
	var fileInput = document.getElementsByClassName("input-file");

	for( var i=0; i<fileInput.length; i++ ){
		if( fileInput[i].files.length > 0 ){
			for( var j = 0; j < fileInput[i].files.length; j++ ){
				console.log(fileInput[i].files[j].name); // 파일명 출력
			}
		}
	}

}
</script>




