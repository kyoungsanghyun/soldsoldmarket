<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp" />

<style>
	div #pageBar{margin-top:10px; text-align:center; }
	h2 { text-align: center;}
</style>

<link rel="stylesheet" href="${ path }/resources/css/mypage.css">


    <div class="board_list_wrap">
            <h2>문의내역</h2>
        <table class="board_list">
			<button type="button" onclick="location.href='${path}/board/write'">글쓰기</button>
                <tr>
                    <th>번호</th>
                    <th>날짜</th>
                    <th>아이디</th>
                    <th>제목</th>
                    <th>답변상태</th>
                </tr>
                <c:if test="${ empty list }">
                	<tr>
                		<td colspan="6">
                			조회된 문의가 없습니다.
                		</td>
                	</tr>
                </c:if>
                <c:if test="${ not empty list }">
	                <c:forEach var="board" items="${ list }">
		                <tr>
		                	<td>${ board.rowNum }</td>
		                    <td>${ board.createDate }</td>
		                    <td>${ board.writerId }</td>
		                    <td class="tit">
		                        <a href="${ path }/mypage/askboardview?no=${ board.no }">
		                        	${ board.title }
		                        </a>
		                    </td>
		                    <td>${ board.answerStatus }</td>
		                </tr>
	                </c:forEach>
                </c:if>
        </table>
        <div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/mypage/asklist?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/mypage/asklist?page=${ pageInfo.prevPage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<button disabled>${ status.current }</button>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<button onclick="location.href='${ path }/mypage/asklist?page=${ status.current }'">${ status.current }</button>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/mypage/asklist?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/mypage/asklist?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
    </div>
</div>
<jsp:include page="/views/common/footer.jsp" /> 