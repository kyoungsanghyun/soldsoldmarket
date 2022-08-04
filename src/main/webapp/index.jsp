<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/main.css?ver=1"> 
<link rel="stylesheet" href="${ path }/resources/css/chat.css"> 

<img src="${ path }/resources/images/chat01.jpg" title="실시간 채팅" id="chat">
 <div class="section">
     <div class="navb">
         <ul class="nav_bottom">
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
			             <c:forEach var="product" items="${ list }">
				                 <li>
				                     <a href="${path}/product/view?no=${product.PNo}" name="no">
				                         <div class="thum">
				                             <img src="${ path }/resources/upload/product/${ product.PThumb }" alt="이미지">
				                         </div>
			                         <div class="pro-list-name"> ${ product.PName }</div>
			                         <div class="pro-list-price"><fmt:formatNumber value="${ product.PPrice }" pattern="#,###" />원</div>
				                     </a>
				                 </li>
			             </c:forEach>
		             </ul>
		             
         </div>
     </div>
 </div>
  <script type="text/javascript">
$(document).ready(function(){
	$('#chat').on('click',function(){
		let url = "${path}/chat";
		open(url,"",status);
	})
	
	
})
 
 
 
</script>

<jsp:include page="/views/common/footer.jsp" />