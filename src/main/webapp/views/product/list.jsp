<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<c:set var="category" value="${ category }"/>
<c:set var="searchWord" value="${ searchWord }"/>
<c:set var="priceOrder" value="${ priceOrder }"/>
<c:set var="categoryList" value="${ categoryList }"/>


<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/productList.css?ver=1"> 

<%-- <form id="listForm" action="${ path }/product/list" method="post">
	<input type="hidden" name="category" 	id="category" 	value="${ category }">
	<input type="hidden" name="searchWord" 	id="searchWord" value="${ searchWord }">
	<input type="hidden" name="priceOrder" 	id="priceOrder" value="${ priceOrder }">
	<input type="hidden" name="page" 		id="page" 		value="${ page }">
</form> --%>
 
 <div class="section">
     <div class="navb"> 
         <ul class="nav_bottom">
<%--              <c:forEach items="${ categoryList }" var="categoryItem" varStatus="status" >
	             <li><a style="cursor:pointer;" onclick="changeCategory('${ status.index }');">${ categoryItem }</a></li>
             </c:forEach> --%>
              <li><a href="${ path }/product/list?category=0">전체상품</a></li>
			 <li><a href="${ path }/product/list?category=1">의류</a></li>
			 <li><a href="${ path }/product/list?category=2">악세서리</a></li>
			 <li><a href="${ path }/product/list?category=3">디지털/가전</a></li>
			 <li><a href="${ path }/product/list?category=4">스포츠/레저</a></li>
			 <li><a href="${ path }/product/list?category=5">도서/음반</a></li>
			 <li><a href="${ path }/product/list?category=6">반려동물</a></li>
			 <li><a href="${ path }/product/list?category=7">기타</a></li>
         </ul>
     </div>

     <hr>

     <div class="container">
         <div class="pro-wrap">
         		<c:if test="${ empty searchWord }">
       				<c:choose>
       					<c:when test="${ category == 0 }"><h2>전체상품</h2></c:when>
       					<c:when test="${ category == 1 }"><h2>의류</h2></c:when>
       					<c:when test="${ category == 2 }"><h2>악세서리</h2></c:when>
       					<c:when test="${ category == 3 }"><h2>디지털/가전</h2></c:when>
       					<c:when test="${ category == 4 }"><h2>스포츠/레저</h2></c:when>
       					<c:when test="${ category == 5 }"><h2>도서/음반</h2></c:when>
       					<c:when test="${ category == 6 }"><h2>반려동물</h2></c:when>
       					<c:when test="${ category == 7 }"><h2>기타</h2></c:when>
       				</c:choose>
         		</c:if>
         		
         		<c:if test="${ not empty searchWord }">
         			<h2><span style="color: #0232e4;"> ${ searchWord } </span>의 검색결과</h2>
         		</c:if>


         	
         	
             <ul class="list-rank">
 <%--                 <li><a id="recent" class="rankBtn" style="cursor:pointer;" onclick="changeProductList('${ category }', '${searchWord}', '', '1');">최신 등록순</a></li>
                 <li><a id="high" class="rankBtn" style="cursor:pointer;" onclick="changeCategory('${ category }', '${searchWord}', 'high', '');">높은 가격순</a></li>
                 <li><a id="low" class="rankBtn" style="cursor:pointer;" onclick="changeCategory('${ category }', '${searchWord}', 'low', '');">낮은 가격순</a></li> --%>
             	<c:if test="${ empty searchWord }">
	                 <li><a class="rankBtn" href="${ path }/product/list?category=${ category }&page=1">최신 등록순</a></li>
	                 <li><a class="rankBtn" href="${ path }/product/list?category=${ category }&priceOrder=high">높은 가격순</a></li>
	                 <li><a class="rankBtn" href="${ path }/product/list?category=${ category }&priceOrder=low">낮은 가격순</a></li>
             	</c:if>
             	   	<c:if test="${ not empty searchWord }">
	                 <li><a class="rankBtn" href="${ path }/product/list?category=${ category }&searchWord=${ searchWord }&page=1">최신 등록순</a></li>
	                 <li><a class="rankBtn" href="${ path }/product/list?category=${ category }&searchWord=${ searchWord }&priceOrder=high">높은 가격순</a></li>
	                 <li><a class="rankBtn" href="${ path }/product/list?category=${ category }&searchWord=${ searchWord }&priceOrder=low">낮은 가격순</a></li>                 	
             	</c:if>
             	
             </ul>
             
             <c:if test="${ empty list }">
             <br><br><br><br>
             <h2>조회된 상품이 없습니다.</h2>
             <br><br><br><br>
             </c:if>
             
             <c:if test="${ not empty list }">
		             <div class="pro-list">	
	             <c:forEach var="product" items="${ list }">
		                 <div class="pro-list-in">
		                     <a href="${path}/product/view?no=${product.PNo}" name="no">
		                         <span class="thum">		                             
		                         	<img src="${ path }/resources/upload/product/${ product.PThumb }" alt="이미지">
		                         </span>
		                         <div class="pro-list-name"> ${ product.PName }</div>
		                         <div class="pro-list-price"><fmt:formatNumber value="${ product.PPrice }" pattern="#,###" />원</div></a>
		                 </div>
	             </c:forEach>
		             </div>
             </c:if>           
         </div>
     </div>
 </div>
 
 <!-- 페이지 목록  -->
 <div class="page_wrap">
     <div class="page_nation">
     	<c:if test="${ empty searchWord }">
	         <a class="arrow pprev" href="${ path }/product/list?category=${ category }&page=1&priceOrder=${priceOrder}">&#60;&#60;</a>
	         <a class="arrow prev" href="${ path }/product/list?category=${ category }&page=${ pageInfo.prevPage }&priceOrder=${priceOrder}">&#60;</a>
	        
	   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<a href="#" class="active">${ status.current }</a>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<a href="${ path }/product/list?category=${ category }&page=${ status.current }&priceOrder=${priceOrder}">${ status.current }</a>
				</c:if>
			</c:forEach>
	
	         <a class="arrow next" href="${ path }/product/list?category=${ category }&page=${ pageInfo.nextPage }&priceOrder=${priceOrder}">&#62;</a>
	         <a class="arrow nnext" href="${ path }/product/list?category=${ category }&page=${ pageInfo.maxPage }&priceOrder=${priceOrder}">&#62;&#62;</a>
     	</c:if>
     	
     	<c:if test="${ not empty searchWord }">
       		 <a class="arrow pprev" href="${ path }/product/list?category=${ category }&searchWord=${ searchWord }&page=1&priceOrder=${priceOrder}">&#60;&#60;</a>
	         <a class="arrow prev" href="${ path }/product/list?category=${ category }&searchWord=${ searchWord }&page=${ pageInfo.prevPage }&priceOrder=${priceOrder}">&#60;</a>
         
	   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<a href="#" class="active">${ status.current }</a>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<a href="${ path }/product/list?category=${ category }&searchWord=${ searchWord }&page=${ status.current }&priceOrder=${priceOrder}">${ status.current }</a>
				</c:if>
			</c:forEach>

	         <a class="arrow next" href="${ path }/product/list?category=${ category }&searchWord=${ searchWord }&page=${ pageInfo.nextPage }&priceOrder=${priceOrder}">&#62;</a>
	         <a class="arrow nnext" href="${ path }/product/list?category=${ category }&searchWord=${ searchWord }&page=${ pageInfo.maxPage }&priceOrder=${priceOrder}">&#62;&#62;</a>
     	</c:if>

     </div>
 </div>

    <script src="${ path }/resources/js/jquery-3.6.0.js"></script>
    <script src="${ path }/resources/js/productList.js"></script>

<jsp:include page="/views/common/footer.jsp" />