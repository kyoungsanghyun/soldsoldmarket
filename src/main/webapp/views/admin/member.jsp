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
	<h2 align="center">관리자페이지</h2>
	
	<nav>
			<ul class="main-nav">
				<li class="admin-member"><a href="${ path }/admin/member">회원관리</a></li>
				<li id="admin-board"><a href="${ path }/admin/adminlist">게시글관리</a></li>
				<li id="admin-report"><a href="${ path }/admin/report">신고관리</a></li>
				<li id="admin-comment"><a href="${ path }/admin/comment">댓글관리</a></li>
			</ul>
		</nav>
		
		<br>
		
		<div id="mainWrapper">

        <ul>
            <!-- 게시판 제목 -->
            <h5 align="center">회원 관리</h5>

            <!-- 게시판 목록  -->
            <table class="table">
			<tr>
				<th>아이디</th>
				<th>회원명</th>
				<th>이메일</th>
				<th>전화</th>
				<th>주소</th>
				<th>권한</th>
				<th>차단</th>
			</tr>
                    <!-- 게시물이 출력될 영역 -->
                     <c:if test="${ empty list }">
				<tr>
					<td align="center" colspan="7">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>
			<c:if test="${ not empty list }">
				<c:forEach var="member" items="${ list }">
					<tr>
						<td>${member.id}</td>
						<td>${member.name}</td>
						<td>${member.name}</td>
						<td>${member.phone}</td>
						<td>${member.address}</td>
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
			<a class="page-link" href='${ path }/admin/member?page=1'">&lt;&lt;</a>
      		</li>

			<!-- 이전 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/admin/member?page=${ pageInfo.prevPage }'>&lt; 
      		</a>
      		</li>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<li class="page-item"><a href='${ status.current }'></a></li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<li class="page-item"><a class="page-link" href='${ path }/admin/member?page=${ status.current }'>${ status.current }</a></li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/admin/member?page=${ pageInfo.nextPage }'>&gt;
      		</a>
      		</li>

			<!-- 맨 끝으로 -->
			<li class="page-item">
			<a class="page-link" href='${ path }/admin/member?page=${ pageInfo.maxPage }'">&gt;&gt;</a>
			</li>
            </ul>
            </nav>
</section>


<jsp:include page="/views/common/footer.jsp" />