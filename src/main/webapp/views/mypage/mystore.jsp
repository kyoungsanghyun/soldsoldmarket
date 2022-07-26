<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp" />

    <div class="wrap">
        <div class="intro_text">
            <ul>
                <li>회원 아이디 : id</li>
                <li>신고당한 수 : 0</li>
                <li>주요 거래지역 : 서울 서대문구</li>
                <li>판매횟수 : 0</li>
                <li>가입일 : 2022-07-25</li>
            </ul>
        </div>
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

<jsp:include page="/views/common/footer.jsp" /> 
