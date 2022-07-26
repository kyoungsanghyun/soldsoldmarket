<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/productList.css"> 

 <div class="section">
     <div class="navb"> 
         <ul class="nav_bottom">
             <li><a href="#">의류</a></li>
             <li><a href="#">악세서리</a></li>
             <li><a href="#">디지털/가전</a></li>
             <li><a href="#">스포츠/레저</a></li>
             <li><a href="#">도서/음반</a></li>
             <li><a href="#">반려동물</a></li>
             <li><a href="#">기타</a></li>
         </ul>
     </div>

     <hr>

     <div class="container">
         <div class="pro-wrap">
             <h2>전체상품</h2>
             <ul class="list-rank">
                 <li><a href="#">최신 등록순</a></li>
                 <li><a href="#">높은 가격순</a></li>
                 <li><a href="#">낮은 가격순</a></li>
             </ul>
             <ul class="pro-list">
             	<% for(int i=0; i<15; i++){ %>
                 <li>
                     <a href="#">
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
 <div class="page_wrap">
     <div class="page_nation">
         <a class="arrow pprev" href="#">&#60;&#60;</a>
         <a class="arrow prev" href="#">&#60;</a>
         <a href="#" class="active">1</a>
         <a href="#">2</a>
         <a href="#">3</a>
         <a href="#">4</a>
         <a href="#">5</a>
         <a href="#">6</a>
         <a href="#">7</a>
         <a href="#">8</a>
         <a href="#">9</a>
         <a href="#">10</a>
         <a class="arrow next" href="#">&#62;</a>
         <a class="arrow nnext" href="#">&#62;&#62;</a>
     </div>
 </div>

<jsp:include page="/views/common/footer.jsp" />