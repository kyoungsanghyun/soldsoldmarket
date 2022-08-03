<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />


    <link rel="stylesheet" href="${path}/resources/css/noticeUpdate.css">

<div id="main">

    <section class="notice">
        <div class="page-title">
                <div class="container">
                    <h3>공지사항</h3>
                </div>
            </div>
        
            <!-- board seach area -->
            <div id="board-search">
                <div class="container">
                    <div class="search-window">
                        <form action="">
                            <div class="search-wrap">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        <!-- board list area -->
            <div id="board-list">
               <form action="${path }/notice/update?no='${notice.no}'" method="POST" enctype="multipart/form-data">
                <input type="hidden" name = "originalFileName" value = ${notice.originalFileName }>
				<input type="hidden" name = "renamedFileName" value = ${notice.renamedFileName }>
                <div class="container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th scope="col" class="th-num"><input type="text" value="${notice.no }" name="no" readonly ></th>
                            <th scope="col" class="th-title"><input type="text" value="${notice.title }" name="title" id="title" ></th>
                            <th scope="col" class="th-writer"><input type="text" value="${notice.writerId }" name="id" readonly ></th>
                            <th scope="col" class="th-date"><input type="text" value="${notice.createDate }" readonly ></th>
                            <th scope="col" class="th-count"><input type="text" value="${notice.readCount }" readonly ></th>
                        </tr>
                        <tr id="sctr">
                                <th>
                                <input type="file" id="writingFile" name="file" accept=".gif, .jpg, .png" onchange="readURL(this);">
                                </th>
                            </tr>
                        </thead>
                    </table>
                    <br>
                    <c:if test="${not empty notice.renamedFileName }">
                    <div id="cimg">
                    <img id="preview" alt="??" src='${path }/resources/upload/notice/${notice.renamedFileName}'">
                    </div>
                    </c:if>
                    <textarea name="content" id="writing" cols="30" rows="10"><c:out value="${notice.content }"/></textarea>
                        
                    <br>
                    <div id="btn1">
                    <c:if test="${not empty member && member.id == notice.writerId }">
                    <input type="submit" id="btnUpdate" value="수정 하기">
					<button type="button" id="btnDelete">삭제</button>
					</c:if>
					<input type="button" onclick="location.href='${path}/notice/list?page=1'" id="goBack" value="목록으로">
                    
                    </div>
                </div>
            </form>
                </div>
            </div>
        
        </section>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnDelete").on('click',function(){
		
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")){
			location.replace("${path}/notice/delete?no=${notice.no}");
		}
		
	});
	
});

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	    	let img = document.getElementById('preview');
	      	img.src = e.target.result;
	      	img.style.width = "400px";
	      	img.style.height = "200px";
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}


</script>
    
    <jsp:include page="/views/common/footerSk.jsp" />
    
