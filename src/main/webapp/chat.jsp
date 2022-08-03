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
<title>실시간 채팅</title>
</head>
<body>

<div class="container">
<h4>궁금한 점을 실시간으로 물어보세요</h4>
<iframe src="https://service.dongledongle.com/osg9010" frameborder="0" width="100%" height="500"></iframe>

<input type="submit" id="btnBack" value="뒤로가기" onClick="history.back()">
<input type="button" id="btnJoin" value="회원가입" onclick="location.href='../UsersJoin/index.jsp'">

</div>

</body>
</html>