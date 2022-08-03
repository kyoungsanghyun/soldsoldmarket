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
             
             <c:if test="${ empty list }">
             <br><br><br><br>
             <h2>조회된 상품이 없습니다.</h2>
             <br><br><br><br>
             </c:if>
             <!--  -->
             <c:if test="${ not empty list }">
		             <ul class="pro-list">	
	             <c:forEach var="product" items="${ list }">
		                 <li>
		                     <a href="${path}/product/view?no=${product.PNo}" name="">
		                         <div class="thum">
		                             <img src="${ path }/${ product.PThumb }" alt="이미지">
		                         </div>
		                         <input type="hidden" value="${product.PNo}">
		                         <div class="text"> ${ product.PName }</div>
		                         <div class="text"> ${ product.PPrice }</div>
		                     </a>
		                 </li>
	             </c:forEach>
		             </ul>
             </c:if>
             
         </div>
     </div>
 </div>
 
 <!-- 페이지 목록  -->
 <div class="page_wrap">
     <div class="page_nation">
         <a class="arrow pprev" href="${ path }/product/list?page=1">&#60;&#60;</a>
         <a class="arrow prev" href="${ path }/product/list?page=${ pageInfo.prevPage }">&#60;</a>
         
   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
			<c:if test="${ status.current == pageInfo.currentPage }">
				<a href="#" class="active">${ status.current }</a>
			</c:if>
			<c:if test="${ status.current != pageInfo.currentPage }">
				<a href="${ path }/product/list?page=${ status.current }">${ status.current }</a>
			</c:if>
		</c:forEach>

         <a class="arrow next" href="${ path }/product/list?page=${ pageInfo.nextPage }">&#62;</a>
         <a class="arrow nnext" href="${ path }/product/list?page=${ pageInfo.maxPage }">&#62;&#62;</a>
     </div>
 </div>

<jsp:include page="/views/common/footer.jsp" />