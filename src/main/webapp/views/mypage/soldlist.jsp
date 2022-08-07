<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="product" value="${ list }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/soldlist.css?var=1">

        <!-- ====================================================== -->
        <!-- 본문 -->
        <div class="section">

            <h2>거래내역</h2>

            <hr>
            
       	    <h3 class="productCount"> 전체&nbsp내역&nbsp&nbsp  <span style="color: #0232e4;">${ listCount }</span>&nbsp개</h3>
           
           	<select class="myProductTrading" name="myProductTrading" id="myProductTrading"> 
				<option class="mptList" value="전체상품" selected="selected">전체 내역</option>
				<option class="mptList" value="판매중">판매&nbsp요청</option>
				<option class="mptList" value="예약중">구매&nbsp요청</option>
			</select>

            <!-- ====================================================== -->
            <!-- 표 -->
            
            <c:if test="${ empty list }">
	            <br><br><br><br>
	            <h2>거래내역이 없습니다.</h2>
	            <br><br><br><br>
            </c:if>
            
            <c:if test="${ not empty list }">       
	            <table class="board_list">
	                <thead>
	                    <tr>
	                        <th>상품</th>
	                        <th>상품명</th>
	                        <th>가격</th>
	                        <th>요청자 전화번호</th>
	                        <th>거래상태</th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                	<c:forEach var="trade" items="${ list }">	                	
		                    <tr>
		                        <td class="td2"><img src="${ path }/resources/upload/product/${ trade.TPThumb }" alt="이미지"></td>
		                        <td class="td3">
		                            <a href="${path}/product/view?no=${trade.PNo}" name="no">${ trade.TPName }</a>
		                        </td>
		                        <td class="td1"><fmt:formatNumber value="${ trade.TPPrice }" pattern="#,###" />원</td>
	                        	<c:if test="${ trade.BId == memberId }">
			                        <td class="td1"></td>
			                        <td class="td4">
				                        <span class="pTrading1">구매 요청 보냄</span>		                        	
			                        </td>
	                        	</c:if>
	                        	<c:if test="${ trade.SId == memberId }">
			                        <td class="td1">${ trade.BIdPhone }</td>
			                        <td class="td4">
			                       		<span class="pTrading2">판매 요청 받음</span>		                        	
			                        </td>
	                        	</c:if>
		                    </tr>
	                    </c:forEach>
	                    	
	                </tbody>
	            </table>
           </c:if>


            <!-- ====================================================== -->
            <!-- 페이지 버튼 -->
            <div class="page_wrap">
                <div class="page_nation">
                    <a class="arrow pprev" href="${ path }/mypage/soldlist?page=1">&#60;&#60;</a>
                    <a class="arrow prev" href="${ path }/mypage/soldlist?page=${ pageInfo.prevPage }">&#60;</a>
                    
			   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
							<a href="#" class="active">${ status.current }</a>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
							<a href="${ path }/mypage/soldlist?page=${ status.current }">${ status.current }</a>
						</c:if>
					</c:forEach>
			
                    <a class="arrow next" href="${ path }/mypage/soldlist?page=${ pageInfo.nextPage }">&#62;</a>
                    <a class="arrow nnext" href="${ path }/mypage/soldlist?age=${ pageInfo.maxPage }">&#62;&#62;</a>
                </div>
            </div>
        </div>
        
        
<jsp:include page="/views/common/footer.jsp" /> 