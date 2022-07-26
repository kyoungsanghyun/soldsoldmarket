<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/main.css"> 

 <div class="section">
     <div class="navb">
         <ul class="nav_bottom">
             <li><a href="${ path }/board/productList">의류</a></li>
             <li><a href="#">악세서리</a></li>
             <li><a href="#">디지털/가전</a></li>
             <li><a href="#">스포츠/레저</a></li>
             <li><a href="#">도서/음반</a></li>
             <li><a href="#">반려동물</a></li>
             <li><a href="#">기타</a></li>
         </ul>
     </div>

     <hr>

     <div class="main-view">
         <ul>
             <li><img src="${ path }/resources/images/banner/banner1.jpg" width="100%" /></li>
             <li><img src="${ path }/resources/images/banner/banner2.jpg" width="100%" /></li>
             <li><img src="${ path }/resources/images/banner/banner3.jpg" width="100%" /></li>
         </ul>
     </div>

     <div class="container">
         <div class="pro-wrap">
             <h2>최근 등록된 상품</h2>
             <ul class="pro-list">
             	
             	<% for(int i=0; i<10; i++){ %>
                 <li>
                     <a href="${path}/product/view">
                         <div class="thum">
                            <img src="${ path }/resources/images/product/product1.jpg" alt="이미지">
                         </div>
                         <p class="text">
                             상품 이름 <br>
                             상품 가격<br>
                         </p>
                     </a>
                 </li>
                 <% } %>
                 
             </ul>
         </div>
     </div>
 </div>

<jsp:include page="/views/common/footer.jsp" />