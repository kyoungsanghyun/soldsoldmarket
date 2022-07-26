<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

        
<link rel="stylesheet" href="${ path }/resources/css/productDetail.css?after">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<body>
    <!-- 전체 컨테이너 -->
    <div class="container">
        <!-- 사이드 이미지 -->
        <div class="side_img">
            <ul>
                <li><div class="side_img_box"><a href="${ path }/resources/images/testimg.jpg"><img src="${ path }/resources/images/testimg.jpg" class="side_img_box_con"></a></div></li>
                <li><div class="side_img_box"><a href="${ path }/resources/images/testimg2.jpg"><img src="${ path }/resources/images/testimg2.jpg" class="side_img_box_con"></a></div></li>
            </ul>
        </div>
        <!-- 메인이미지 -->
        <div class="main_img">
            <div id="main_img_box">
                <img src="${ path }/resources/images/testimg.jpg" id="main_img_box_con">
            </div>
        </div>

        <!-- 게시글 제목 및 가격 -->
        <div class="product_title"> 
            <div id="product_name">
            	<form action="${path}/product/view" method="get"><button>테스트버튼</button></form>
            	<input type="hidden" name="pno" value="${product.PNo}">
                <h2>${product.PName}</h2>
                <h3>${product.PPrice}</h3>
                <hr>
            </div>
        </div>

        <!-- 게시글 정보 -->
        <div class="product_info">
            <!-- 고정값 -->
            <div id="product_info_fixval">
                <ul>
                    <li>작성자</li>
                    <li>작성일</li>
                    <li>지역</li>
                    <li>제품상태</li>
                    <li>교환여부</li>
                    <li>수량</li>
                    <li>판매진행상태</li>
                </ul>
            </div>
            <!-- 변화값 -->
            <div id="product_info_varival">
                <ul>
                    <li>${product.PId}</li>
                    <li>${product.PDate}</li>
                    <li>${product.PLocation}</li>
                    <li>${product.PQlt}</li>
                    <li>${product.PExchange}</li>
                    <li>${product.PQtt}</li>
                    <li>${product.PTrading}</li>
                </ul>
            </div>
        
        </div>
        <!-- 게시글 툴바 영역 -->
        <div class="toolbar">
            <span id="toolbar_like">찜하기<img src="${ path }/resources/images/heartempty.png"></span>
            <span id="toolbar_view">조회수<img src="${ path }/resources/images/view.png">0</span>
            <span id="toolbar_share">공유하기<img src="${ path }/resources/images/share.png"></span>
            <hr>
            <span id="toolbar_buy"><img src="${ path }/resources/images/buybtn.png"></span>
            <span id="toolbar_comment"><img src="${ path }/resources/images/cmtbtn.png"></span>
        </div>
        <!-- 게시글 내용 -->
        <div class="product_detail">
            에이서 스위프트x입니다<br>
            내장그래픽사용하는 3x 아닙니다<br>
            실사용시간 100시간도 채안됩니다<br>
            라이젠5600<br>
            지포스3050ti<br>
            16기가램<br>
            256g ssd<br>
            입니다<br><br>
            라이젠백팩과 노트북거치대<br>
            노트북에 랜선이없어 랜섭꼽는 젠더도 같이드립니다<br>
            포멧해서 드립니다<br>
            윈도우미설치 제품입니다<br>
            박스풀입니다<br>
            택배배송시 포장은 야무지게하겠지만<br>
            파손시 판매자 책임 없습니다<br>
        </div>

        <div class="reply_contents">
            <ul>
                <li><img src="${ path }/resources/images/user.png" class="reply_contents_userIcon"><span>유저명</span><span> 댓글1</span></li>
                <li><img src="${ path }/resources/images/user.png" class="reply_contents_userIcon"><span>유저명</span><span> 댓글2</span></li>
                </ul>
        </div>

        <div class="reply_write">
            <span><img src="${ path }/resources/images/user.png" id="reply_write_id_icon"></span><span id="reply_write_id">유저명</span>
            <textarea placeholder="댓글을 입력해주세요." style="resize: none;" id="reply_write_area"></textarea>
            <span><img src="${ path }/resources/images/cmtupbtn.png" id="reply_write_upbtn"></span>
        </div>

    </div>
    <script src="${ path }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${ path }/resources/js/productDetail.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />