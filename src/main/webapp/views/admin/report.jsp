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

    #ulTable > li > ul > li:first-child               {width:5%;} /*번호 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:40%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li  {width:15%;} /*신고취소 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li+li{width:10%;} /*삭제 열 크기*/

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
				<li class="admin-member"><a href="${ path }/admin/member">회원관리</a></li>
				<li id="admin-board"><a href="${ path }/admin/list">게시글관리</a></li>
				<li id="admin-report"><a href="${ path }/admin/report">신고관리</a></li>
				<li id="admin-comment"><a href="${ path }/admin/comment">댓글관리</a></li>
			</ul>
		</nav>
		
		<br>
		
		<div id="mainWrapper">

        <ul>
            <!-- 게시판 제목 -->
            <li>신고관리</li>

            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>번호</li>
                            <li>작성자</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>신고취소</li>
                            <li>삭제</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
                    <li>
                        <ul>
                            <li>0</li>
                            <li>작성자</li>
                            <li>제목</li>
                            <li>2022/00/00</li>
                            <li><a href="/">신고취소</a></li>
                            <li><a href="/">삭제</a></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>0</li>
                            <li>작성자</li>
                            <li>제목</li>
                            <li>2022/00/00</li>
                            <li><a href="/">신고취소</a></li>
                            <li><a href="/">삭제</a></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>0</li>
                            <li>작성자</li>
                            <li>제목</li>
                            <li>2022/00/00</li>
                            <li><a href="/">신고취소</a></li>
                            <li><a href="/">삭제</a></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>0</li>
                            <li>작성자</li>
                            <li>제목</li>
                            <li>2022/00/00</li>
                            <li><a href="/">신고취소</a></li>
                            <li><a href="/">삭제</a></li>
                        </ul>
                    <li>
                    <li>
                        <ul>
                            <li>0</li>
                            <li>작성자</li>
                            <li>제목</li>
                            <li>2022/00/00</li>
                            <li><a href="/">신고취소</a></li>
                            <li><a href="/">삭제</a></li>
                        </ul>
                    <li>     
                    <li>
                        <ul>
                            <li>0</li>
                            <li>작성자</li>
                            <li>제목</li>
                            <li>2022/00/00</li>
                            <li><a href="/">신고취소</a></li>
                            <li><a href="/">삭제</a></li>
                        </ul>
                    <li>                                                         
                </ul>
            </li>
            
            <br><br><br>

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