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
        <div class="intro_text">
        
                 <div class="memberimg">
                        <img src="${ path }/resources/upload/product/고래인형.jpg" height="200" alt="프로필사진">
                  </div>
                  
            <table class="information">            
                <tr>
                    <td>회원아이디</td>
                    <td>: ${ member.id }</td>
                </tr>
                <tr>
                    <td>판매횟수</td>
                    <td>: ${ soldCount }</td>
                </tr>
                <tr>
                    <td>가입일</td>
                    <td>: ${ member.joinDate }</td>
                </tr>
            </table>
        </div>
			
			<hr>
			
            <h2>내 상점</h2>

            <hr>
            
			<c:if test="${ trading != null }">
	        <h3 class="productCount"> ${ trading }&nbsp  <span style="color: #0232e4;">${ listCount }</span>&nbsp개</h3>			
			</c:if>
			<c:if test="${ trading == null }">
	        <h3 class="productCount"> 전체상품&nbsp  <span style="color: #0232e4;">${ listCount }</span>&nbsp개</h3>			
			</c:if>
            
				
				
			<ul class="list-rank">
               <li><a class="rankBtn" href="${ path }/mypage/mystore">전체상품</a></li>
               <li><a class="rankBtn" href="${ path }/mypage/mystore?trading=판매중">판매중</a></li>
               <li><a class="rankBtn" href="${ path }/mypage/mystore?trading=예약중">예약중</a></li>
               <li><a class="rankBtn" href="${ path }/mypage/mystore?trading=판매완료">판매완료</a></li>
              </ul>
			
			

            <!-- ====================================================== -->
            <!-- 표 -->
            
            <c:if test="${ empty list }">
	            <c:if test="${ trading != null }">
		            <br><br><br><br>
		            <h2>${ trading }&nbsp 상품이 없습니다.</h2>
		            <br><br><br><br>			
			</c:if>
			<c:if test="${ trading == null }">
		            <br><br><br><br>
		            <h2>등록한 상품이 없습니다.</h2>
		            <br><br><br><br>			
			</c:if>
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
		                         <div class="pro-list-price">
		                         	<span><fmt:formatNumber value="${ product.PPrice }" pattern="#,###" />원</span>
		                         	
		                         	<c:choose>
			                         	<c:when test="${ product.PTrading == '예약중' }">
				                         	<span class="pro-list-trading" style="color: black;">${ product.PTrading }</span>
			                         	</c:when>
			                         	<c:when test="${ product.PTrading == '판매중' }">
				                         	<span class="pro-list-trading">${ product.PTrading }</span>
			                         	</c:when>
			                         	<c:when test="${ product.PTrading == '판매완료' }">
				                         	<span class="pro-list-trading" style="color: red;">${ product.PTrading }</span>
			                         	</c:when>
		                         	</c:choose>
		                         </div>
	                         </a>
		                 </div>
	             </c:forEach>
		             </div>
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
        

       
<jsp:include page="/views/common/footer.jsp" /> 
