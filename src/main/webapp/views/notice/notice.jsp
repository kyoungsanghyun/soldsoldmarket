<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<c:set var = "path" value = "${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${path }/resources/css/notice.css">
    <script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="/views/common/header.jsp" />
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
                <c:if test='${member.authority=="M" }'>
                    <button id="goWrite" onclick="location='${path}/notice/write'">글쓰기</button>
                </c:if>
                    <div class="search-window">
                            <div class="search-wrap">
                            </div>
                    </div>
                </div>
            </div>
            
        <!-- board list area -->
            <div id="board-list">
                <div class="container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-writer">작성자</th>
                            <th scope="col" class="th-date">등록일</th>
                            <th scope="col" class="th-count">조회수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty list }">
                        <tr>
                            <td>1</td>
                            <th>
                            <a href="#!">게시글이 없습니다.</a>
                            </th>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        </c:if>
                        
                        <c:if test="${not empty list }">
                        <c:forEach var="notice" items="${list}" >
                        
                        <tr>
                            <td>${notice.rowNum }</td>
                            <th>
                            <a href="${ path }/notice/view?no=${ notice.no }">
								${ notice.title }
							</a>
                            </th>
                            <td>${notice.writerId }</td>
                            <td>${notice.createDate }</td>
                            <td>${notice.readCount }</td>
                        </tr>
                        
                        </c:forEach>
                        </c:if>
                        
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${path}/notice/list?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${path}/notice/list?page=${pageInfo.prevPage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }"
				varStatus="status">
			<c:if test="${status.current == pageInfo.currentPage }">
			<button disabled style="background-color: black; color: white;">${status.current }</button>
			</c:if>
			
			<c:if test="${status.current != pageInfo.currentPage }">
			<button onclick="location.href='${path}/notice/list?page=${status.current }'">${status.current }</button>
			</c:if>
			</c:forEach>
			

			<!-- 다음 페이지로 -->
			<button onclick="location.href='${path}/notice/list?page=${pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/notice/list?page=${pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
        
        </section>
    
        
    <jsp:include page="/views/common/footerSk.jsp" /> 
    
</body>
</html>