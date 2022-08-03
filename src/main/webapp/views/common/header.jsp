<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>soldsoldMarket</title>
    <link rel="stylesheet" href="${ path }/resources/css/headerFooter.css"> 
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
    
</head>

<body>

    <main>
            <!-- ============================================================================================= -->
            <!-- header -->
            <!-- ============================================================================================= -->

            <header>
                <!-- -------------------------- nav_top --------------------------  -->
                <c:if test="${empty member }">
                <nav>
                    <ul class="nav_top">
                        <li><a href="${path}/login">로그인</a></li>
                        <li><a href="${path}/enrollCheck">회원가입</a></li>
                    </ul>
                </nav>
                </c:if>
                <c:if test="${not empty member }">
                <nav>
                    <ul class="nav_top">
                        <li>${member.name} 님 </li>
                        
                        <c:if test="${member.author == 'C' }">
                        <li><a href="#">내 상점</a></li>
                        <li><a href="${path }/logout">로그아웃</a></li>
                        </c:if>
                        
                        <c:if test="${member.author == 'M' }">
                        <li><a href="#">관리자 페이지</a></li>
                        <li><a href="${path }/logout">로그아웃</a></li>
                        </c:if>
                    </ul>
                </nav>
                </c:if>
                <hr>


                <!-- -------------------------- nav_middle --------------------------  -->
                <div class="nav_middle">
                    <div class="no1">
                    <a class="logo" href="${ path }/home">
                        <img src="${ path }/resources/images/logo.png" height="90" alt="쏠쏠마켓 로고">
                    </a>
                    </div>

                    <form class="search" action="${ path }/product/list">
                    	<input type="hidden" name="category" value="0"> 
                        <input type="text" placeholder="검색어 입력" 
                               name="searchWord" value="${ param.searchWord }"/>
                       <img src="${ path }/resources/images/icon/search.png">
                    </form>    


                    <ul class="nav_middle_right">
                        <li>
                            <a href="${ path }/views/product/regist.jsp">
                                <img src="${ path }/resources/images/icon/edit.png" width="23" height="24" alt="상품등록 아이콘"> 상품등록
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="${ path }/resources/images/icon/account.png" width="23" height="24" alt="마이쏠쏠 아이콘"> 마이쏠쏠
                            </a>
                            <ul class="drop_down">
                                <li>
                                    <a href="${ path }/mypage/mystore">내 상점</a>
                                </li>
                                <li>
                                    <a href="${ path }/mypage/memberinfo">회원정보</a>
                                </li>
                                <li><a href="${ path }/views/mypage/asklist.jsp">문의내역</a></li>
                                <li><a href="${ path }/mypage/soldlist">거래내역</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">
                                <img src="${ path }/resources/images/icon/favorite.png" width="23" height="24" alt="찜하기 아이콘"> 찜하기
                            </a>
                        </li>
                    </ul>
                </div>

                <hr>
                
            </header>     