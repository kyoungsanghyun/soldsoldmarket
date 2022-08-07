<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="product" value="${ list }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/likelist.css?var=1">

        <!-- ====================================================== -->
        <!-- 본문 -->
        <div class="section">

            <h2>찜한 상품</h2>

            <hr>
            <h3 class="productCount"> 찜한&nbsp상품&nbsp&nbsp  <span style="color: #0232e4;">${ listCount }</span>&nbsp개</h3>

            <!-- ====================================================== -->
            <!-- 표 -->
            
           
           <c:if test="${ empty list }">
	            <br><br><br><br>
	            <h2>찜한 상품이 없습니다.</h2>
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
	                         </a>
		                         <div class="pro-list-price">
		                         	<span><fmt:formatNumber value="${ product.PPrice }" pattern="#,###" />원</span>
		                         </div>
		                 </div>
	             </c:forEach>
		             </div>
             </c:if>           


            <!-- ====================================================== -->
            <!-- 페이지 버튼 -->
            <div class="page_wrap">
                <div class="page_nation">
                    <a class="arrow pprev" href="${ path }/mypage/likelist?page=1">&#60;&#60;</a>
                    <a class="arrow prev" href="${ path }/mypage/likelist?page=${ pageInfo.prevPage }">&#60;</a>
                    
			   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
							<a href="#" class="active">${ status.current }</a>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
							<a href="${ path }/mypage/likelist?page=${ status.current }">${ status.current }</a>
						</c:if>
					</c:forEach>
			
                    <a class="arrow next" href="${ path }/mypage/likelist?page=${ pageInfo.nextPage }">&#62;</a>
                    <a class="arrow nnext" href="${ path }/mypage/likelist?age=${ pageInfo.maxPage }">&#62;&#62;</a>
                </div>
            </div>
        </div>

        
<jsp:include page="/views/common/footer.jsp" /> 