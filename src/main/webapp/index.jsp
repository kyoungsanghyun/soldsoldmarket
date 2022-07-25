<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<c:set var = "path" value = "${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>안녕하세요 쏠쏠 마켓입니다!!</h1>

<c:if test="${empty member}">
<button onclick="location.href='${path}/login'">로그인</button>
<button onclick="location.href='${path}/enroll'">회원가입</button>
</c:if>
<c:if test="${not empty member }">
${member.name }님 안녕하세요!

<button onclick="location.href='${path}/logout'">로그아웃</button>
</c:if>



</body>
</html>