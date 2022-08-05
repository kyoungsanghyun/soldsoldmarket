<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/askboardview.css">

<div class="section">   

        <h2>게시판</h2>

        <hr>

        <table class="board_list">
                <tr>
                    <th>글번호</th>
                    <td>${ board.no }</td>
                </tr>
                <tr>
                    <th>제 목</th>
                    <td>${ board.title }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ board.writerId }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                        <c:if test="${ empty board.originalFileName }">
                            <span>-</span>
                        </c:if>
                        <c:if test="${ not empty board.originalFileName }">
                        <img src="${ path }/resources/images/file.png" width="20px" height="20px">
                        <a href="javascript:" id="fileDown">
                        <span>${ board.originalFileName }</span>
                        </a>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th class="content">내 용</th>
                <td>${ board.content }</td>
            </tr>
        </table>

      
      <div class="buttons">
                    <c:if test="${ member.id == board.writerId }">
                        <button type="button" id="btnDelete">삭제</button>
                    </c:if>
                    <button type="button" onclick="location.href='${ path }/mypage/asklist'">목록으로</button>
      </div>


    </div>

<script>
	$(document).ready(() => {
		$("#btnDelete").on("click", () => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${ path }/mypage/askdelete?no=${ board.no }");
			}
		});
		
		$("#fileDown").on("click", () => {
			location.assign("${ path }/mypage/filedown?oname=${ board.originalFileName }&rname=${ board.renamedFileName }")
		});
		
	});
</script>




<jsp:include page="/views/common/footer.jsp" /> 