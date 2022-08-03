<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<c:set var = "path" value = "${pageContext.request.contextPath}"/>    
    

<jsp:include page="/views/common/header.jsp" />


    <link rel="stylesheet" href="${path}/resources/css/view.css">

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
                <div class="container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th scope="col" class="th-num">${notice.no }</th>
                            <th scope="col" class="th-title">${notice.title }</th>
                            <th scope="col" class="th-writer">${notice.writerId }</th>
                            <th scope="col" class="th-date">${notice.createDate }</th>
                            <th scope="col" class="th-count">${notice.readCount }</th>
                        </tr>
                        </thead>
                    </table>
                    <br>
                    <c:if test="${not empty notice.renamedFileName }">
                    <div id="cimg">
                    <img alt="??" src='${path }/resources/upload/notice/${notice.renamedFileName}'">
                    </div>
                    </c:if>
                    <textarea name="content" id="writing" cols="30" rows="10" readonly>${notice.content }</textarea>
                    
                    <br>
                    <div id="btn1">
                    <c:if test="${not empty member && member.id == notice.writerId }">
					<button type="button" id="btnUpdate" onclick = "location.href ='${path}/notice/update?no=${notice.no}'">수정</button>
					<button type="button" id="btnDelete">삭제</button>
					</c:if>
                    <button onclick="location.href='${path}/notice/list?page=1'" id="goBack">목록으로</button>
                    
                    </div>
                </div>
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


</script>
    
    <jsp:include page="/views/common/footerSk.jsp" />
    
