<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="product" value="${ list }"/>


<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/mystore.css">

        <!-- ====================================================== -->
        <!-- 본문 -->
        <div class="section">

            <h2>내 상점</h2>

            <hr>
            

	        <h3 class="productCount"> ${ trading }&nbsp  <span style="color: #0232e4;">${ listCount }</span>&nbsp개</h3>
            
	           	<select class="myProductTrading" name="myProductTrading" id="myProductTrading"> 
					<option class="mptList" value="전체상품" selected="selected">전체상품</option>
					<option class="mptList" value="판매중">판매중</option>
					<option class="mptList" value="예약중">예약중</option>
					<option class="mptList" value="판매완료">판매완료</option>
				</select>
			
			

            <!-- ====================================================== -->
            <!-- 표 -->
            
            <c:if test="${ empty list }">
	            <br><br><br><br>
	            <h2>등록한 상품이 없습니다.</h2>
	            <br><br><br><br>
            </c:if>
            
            <c:if test="${ not empty list }">
		             <ul class="pro-list">	
	             <c:forEach var="product" items="${ list }">
		                 <li>
		                     <a href="${path}/product/view?no=${product.PNo}" name="no"></a>
		                         <span class="thum">		                             
		                         	<img src="${ path }/resources/upload/product/${ product.PThumb }" alt="이미지">
		                         </span>
		                         <div class="pro-list-name"> ${ product.PName }</div>
		                         <div class="pro-list-price">
		                         	<span><fmt:formatNumber value="${ product.PPrice }" pattern="#,###" />원</span>
		                         	<span class="pro-list-trading">${ product.PTrading }</span>
		                         </div>
	                         </a>
		                 </li>
	             </c:forEach>
		             </ul>
             </c:if>           


            <!-- ====================================================== -->
            <!-- 페이지 버튼 -->
            <div class="page_wrap">
                <div class="page_nation">
                    <a class="arrow pprev" href="${ path }/mypage/mystore?page=1">&#60;&#60;</a>
                    <a class="arrow prev" href="${ path }/mypage/mystore?page=${ pageInfo.prevPage }">&#60;</a>
                    
			   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
							<a href="#" class="active">${ status.current }</a>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
							<a href="${ path }/mypage/mystore?page=${ status.current }">${ status.current }</a>
						</c:if>
					</c:forEach>
			
                    <a class="arrow next" href="${ path }/mypage/mystore?page=${ pageInfo.nextPage }">&#62;</a>
                    <a class="arrow nnext" href="${ path }/mypage/mystore?age=${ pageInfo.maxPage }">&#62;&#62;</a>
                </div>
            </div>
        </div>
        

<script>
  $(function() {
      $("#myProductTrading").on("change", function() {
    	  var trading = $(this).val();
    	  
    	  trading.submit();
      });

   });
  </script>
        
<jsp:include page="/views/common/footer.jsp" /> 
