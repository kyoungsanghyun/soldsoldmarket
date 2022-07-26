<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${ path }/resources/css/admin.css">
<jsp:include page="/views/common/header.jsp" />

<style>
	ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
}

    #mainWrapper{
        width: 800px;
        margin: 0 auto; /*가운데 정렬*/
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:50px;
        vertical-align:middle;
        line-height:30px;
}

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color:#c9c9c9;
        font-weight:bold;
        text-align:center;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
         
    	height:30px;
    	line-height:30px;
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
}    

    #ulTable > li > ul > li:first-child               {width:15%;} /*아이디 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:15%;} /*회원명 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:15%;} /*이메일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*전화 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li  {width:15%;} /*주소 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li{width:15%;} /*권한 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li+li{width:10%;} /*차단 열 크기*/

    #divPaging {
          clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px;

}

    .left {
        text-align : left;
}
</style>

<section id="content">
	<h2 align="center">관리자페이지</h2>
	
	<nav>
			<ul class="main-nav">
				<li class="admin-member"><a href="${ path }/board/member">회원관리</a></li>
				<li id="admin-board"><a href="${ path }/board/list">게시글관리</a></li>
				<li id="admin-report"><a href="${ path }/board/report">신고관리</a></li>
				<li id="admin-comment"><a href="${ path }/board/comment">댓글관리</a></li>
			</ul>
		</nav>
		
		<br>
		
		<div id="mainWrapper">

        <ul>
            <!-- 게시판 제목 -->
            <li>회원관리 </li>

            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>아이디</li>
                            <li>회원명</li>
                            <li>이메일</li>
                            <li>전화</li>
                            <li>주소</li>
                            <li>권한</li>
                            <li>차단</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
                    <li>
                        <ul>
                            <li>kh</li>
                            <li>회원명</li>
                            <li>naver.com</li>
                            <li>010-0000-0000</li>
                            <li>경기도</li>
                            <li></li>
                            <li><a href="/">차단</a></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>kh</li>
                            <li>회원명</li>
                            <li>naver.com</li>
                            <li>010-0000-0000</li>
                            <li>경기도</li>
                            <li></li>
                            <li><a href="/">차단</a></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>kh</li>
                            <li>회원명</li>
                            <li>naver.com</li>
                            <li>010-0000-0000</li>
                            <li>경기도</li>
                            <li></li>
                            <li><a href="/">차단</a></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>kh</li>
                            <li>회원명</li>
                            <li>naver.com</li>
                            <li>010-0000-0000</li>
                            <li>경기도</li>
                            <li></li>
                            <li><a href="/">차단</a></li>
                        </ul>
                    <li>
                    <li>
                        <ul>
                            <li>kh</li>
                            <li>회원명</li>
                            <li>naver.com</li>
                            <li>010-0000-0000</li>
                            <li>경기도</li>
                            <li></li>
                            <li><a href="/">차단</a></li>
                        </ul>
                    <li>     
                    <li>
                        <ul>
                            <li>kh</li>
                            <li>회원명</li>
                            <li>naver.com</li>
                            <li>010-0000-0000</li>
                            <li>경기도</li>
                            <li></li>
                            <li><a href="/">차단</a></li>
                        </ul>
                    <li>                                                         
                </ul>
            </li>

            <!-- 게시판 페이징 영역 -->
            <li>
                <div id="divPaging">
                    <div>◀</div>
                       <div><b>1</b></div>
                    <div>2</div>
                    <div>3</div>
                    <div>4</div>
                    <div>5</div>
                    <div>▶</div>
                </div>
            </li>

        </ul>
</section>


<jsp:include page="/views/common/footer.jsp" />