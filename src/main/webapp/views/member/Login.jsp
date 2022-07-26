<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<c:set var = "path" value = "${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인페이지</title>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/login.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
    <div id="wrap01">
        <div id="header01">
        </div>
        
        <div id="content01">
            <img src="${path }/resources/images/로고.png" id="img01">
                <div id="forlog">

                    <form action="${ path }/login" method="post">
                        <input type="text" name="id" id="logId" placeholder="Userid" size="25" >
                        <br>
                        <input type="password" name="pwd" id="logPassword" placeholder="password" size="25" >
                        <br>
                        <input type="submit" value="로그인" id="loginbtn">
                    </form>

                    <button id="insolbtn">회원가입</button>
                    <div class="in"><img src="${path }/resources/images/카카오.jpg" class="api"></div>
                    <div class="in"><img src="${path }/resources/images/네이버.jpg" class="api"></div>
                </div>
        </div>



<jsp:include page="/views/common/footerSk.jsp" />
       
    </div>
    <script >
    
    $(document).ready(function(){
            $('#insolbtn').on('click',function(){
            	
				location.replace('${path}/enrollCheck');            	
            	
            });
    
    });
    </script>

    
</body>
</html>