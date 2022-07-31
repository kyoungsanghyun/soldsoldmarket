<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/mypage.css">

    <div class="section">
        <div class="intro_text">
            <table class="information">
				<tr>
                    <td>프로필 사진</td>
                    <td>img</td>
                </tr>            
                <tr>
                    <td>회원아이디 : </td>
                    <td>id</td>
                </tr>
                <tr>
                    <td>신고당한 수 : </td>
                    <td>count</td>
                </tr>
                <tr>
                    <td>주요 거래지역 : </td>
                    <td>area</td>
                </tr>
                <tr>
                    <td>판매횟수 : </td>
                    <td>count</td>
                </tr>
                <tr>
                    <td>방문횟수 : </td>
                    <td>count</td>
                </tr>
                <tr>
                    <td>가입일 : </td>
                    <td>date</td>
                </tr>
                <tr>
                    <td>소개글 : </td>
                    <td>introduce</td>
                </tr>
            </table>
        </div>
    
    <!-- intro end -->
    <hr>
    <div>
        <div class="product">상품</div>  
        <select class="absolute">
            <option selected>전체</option>
            <option>판매중</option>
            <option>판매완료</option>
            <option>예약중</option>
        </select>
    </div>

    <hr>

    <div class="product_count">전체 0개</div>
    <br>
    <ul class="product_enroll">
        <li>
            <div class="product_img">
            </div>
            <div class="product_name">상품이름</div>
            <div class="product_price">상품가격</div>
        </li>
        <li>
            <div class="product_img">
                    <img src="/resources/image/flower1.PNG" alt="">
            </div>
            <div class="product_name">상품이름</div>
            <div class="product_price">상품가격</div>
        </li>
        <li>
            <div class="product_img">
                    <img src="/resources/image/flower1.PNG" alt="">
            </div>
            <div class="product_name">상품이름</div>
            <div class="product_price">상품가격</div>
        </li>
        <li>
            <div class="product_img">
                    <img src="/resources/image/flower1.PNG" alt="">
            </div>
            <div class="product_name">상품이름</div>
            <div class="product_price">상품가격</div>
        </li>
    </ul>
	</div>
<jsp:include page="/views/common/footer.jsp" /> 
