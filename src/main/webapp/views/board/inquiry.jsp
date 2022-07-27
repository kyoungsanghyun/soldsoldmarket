<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<link rel="stylesheet" href="${ path }/resources/css/productregist.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<section id="content">
	<div class="write">
		<form>
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
			<br><br>
			<ul class="__add" style="list-style: none;"> 
			  <li>
			   <input type="file" id="input-file" name="file_path" class="files">
			   <button type="button" class="_add" style="vertical-align: sub">추가</button>
			  </li> 
			</ul>
		</div>
		</form>
		
	</div>

</section>

<script type="text/javascript">
var maxAppend = 1;

$('.__add ._add').on('click',function(){ 
   if(maxAppend >= 5){
      alert("파일 업로드 최대 개수는 5개 입니다.");
      return;
   }else{
       $('.__add').append('<li><input type="file"name="file_path" class="files"> <button type="button" class="_add" onclick="addDel(this);">삭제</button></li>'); 
       maxAppend ++;
   }
   
 });
 
 function addDel(a){ 
    $(a).closest('li').remove(); 
    maxAppend --;
 }
</script>




