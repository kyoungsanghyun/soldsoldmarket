<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<link rel = "stylesheet" href = "${ path }/resources/css/bootstrap.css">
<link rel="stylesheet" href="${ path }/resources/css/admin.css">
<jsp:include page="/views/common/header.jsp" />

<style>
.pagination {
	justify-content : center;
}
</style>

<section id="content">
	<br>
	<h3 align="center">관리자페이지</h3>
	<br>
	<nav>
			<ul class="main-nav">
				<li class="admin-member"><a href="${ path }/admin/member">회원관리</a></li>
				<li id="admin-board"><a href="${ path }/admin/adminlist">게시글관리</a></li>
				<li id="admin-report"><a href="${ path }/admin/report">신고관리</a></li>
				<li id="admin-comment"><a href="${ path }/admin/comment">댓글관리</a></li>
			</ul>
		</nav>
		
		<br><br>
		

        <ul>
            <!-- 게시판 제목 -->
            <h5 align="center">게시판 관리</h5>

            <!-- 게시판 목록  -->
            <table class="table align-middle">
            <br>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>게시글내용</th>
				<th>제목</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
                    <!-- 게시물이 출력될 영역 -->
                    <c:if test="${ empty list }">
				<tr>
					<td align="center" colspan="6">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>
			<c:if test="${ not empty list }">
				<c:forEach var="board" items="${ list }">
					<tr>
						<td>${board.BId}</td>
						<td>${board.MId}</td>
						<td>${board.BContent}</td>
						<td>${board.BTitle}</td>
						<td>${board.BTimeStamp}</td>
						<td><button class="btn btn-primary btn-sm" type="submit">삭제</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
        </ul>
        
           
          
            <br><br><br>

            <!-- 게시판 페이징 영역 -->
            
            <nav aria-label="Page navigation example">
            <ul class="pagination pagination-sm">
            <li class="page-item">
			<!-- 맨 처음으로 -->
			<a class="page-link" href='${ path }/admin/adminlist?page=1'">&lt;&lt;</a>
      		</li>

			<!-- 이전 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/admin/adminlist?page=${ pageInfo.prevPage }'>&lt; 
      		</a>
      		</li>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<li class="page-item active">
					<a href='${ status.current }'></a>
					</li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<li class="page-item"><a class="page-link" href='${ path }/admin/adminlist?page=${ status.current }'>${ status.current }</a></li>
				</c:if>
			</c:forEach>
			


			<!-- 다음 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/admin/adminlist?page=${ pageInfo.nextPage }'>&gt;
      		</a>
      		</li>

			<!-- 맨 끝으로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/admin/adminlist?page=${ pageInfo.maxPage }'">&gt;&gt;</a>
			</li>
            </ul>
            </nav>

</section>


<jsp:include page="/views/common/footer.jsp" />