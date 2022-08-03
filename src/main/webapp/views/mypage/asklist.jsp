<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/mypage.css">


    <div class="board_list_wrap">
        <table class="board_list">
            <caption class="caption1">문의내역</caption>
            <thead>
                <tr>
                    <th>날짜</th>
                    <th>이름</th>
                    <th>제목</th>
                    <th>답변상태</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2022-07-24</td>
                    <td>작성자</td>
                    <td class="tit">
                        <a href="">문의합니다.</a>
                    </td>
                    <td>답변예정</td>
                </tr>
                <tr>
                    <td>2022-07-23</td>
                    <td>작성자</td>
                    <td class="tit">
                        <a href="">문의합니다.</a>
                    </td>
                    <td>답변완료</td>
                </tr>
                <tr>
                    <td>2022-07-22</td>
                    <td>작성자</td>
                    <td class="tit">
                        <a href="">문의합니다.</a>
                    </td>
                    <td>답변완료</td>
                </tr>
                <tr>
                    <td>2022-07-21</td>
                    <td>작성자</td>
                    <td class="tit">
                        <a href="">문의합니다.</a>
                    </td>
                    <td>답변완료</td>
                </tr>
                <tr>
                    <td>2022-07-20</td>
                    <td>작성자</td>
                    <td class="tit">
                        <a href="">문의합니다.</a>
                    </td>
                    <td>답변완료</td>
                </tr>
            </tbody>
        </table>
        <div class="paging">
            <button>&lt;&lt;</button>
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>&gt;</button>
            <button>&gt;&gt;</button>
        </div>
    </div>
</div>
<jsp:include page="/views/common/footer.jsp" /> 