<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/soldlist.css">

        <!-- ====================================================== -->
        <!-- 본문 -->
        <div class="section">

            <h2>거래내역</h2>

            <hr>

            <!-- ====================================================== -->
            <!-- 표 -->
            <table class="board_list">
                <thead>
                    <tr>
                        <th>날짜</th>
                        <th>상품</th>
                        <th>상품명</th>
                        <th>거래상태</th>
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
                        <td>2022-07-24</td>
                        <td>작성자</td>
                        <td class="tit">
                            <a href="">문의합니다.</a>
                        </td>
                        <td>답변예정</td>
                    </tr>


                </tbody>
            </table>


            <!-- ====================================================== -->
            <!-- 페이지 버튼 -->
            <div class="page_wrap">
                <div class="page_nation">
                    <a class="arrow pprev" href="#">&#60;&#60;</a>
                    <a class="arrow prev" href="#">&#60;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a class="arrow next" href="#">&#62;</a>
                    <a class="arrow nnext" href="#">&#62;&#62;</a>
                </div>
            </div>
        </div>
        
        
<jsp:include page="/views/common/footer.jsp" /> 
