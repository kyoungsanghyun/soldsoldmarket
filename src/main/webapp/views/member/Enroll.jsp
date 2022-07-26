<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   

<c:set var = "path" value = "${pageContext.request.contextPath}"/>    

<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	<link rel="stylesheet" type="text/css" href="${path }/resources/css/enroll.css">


</head>
<body>


    <div id="wrap01">
    <div id="header01"></div>

    <div id="content01">
            <img src="${path }/resources/images/로고.png" id="img01">

            <form id="enrollForm" action="${path }/enroll" method="post">
                    <input type="text" name="enrollId" id="enrollId" placeholder="아이디 ">
                    <input type="button" id="idcheck" value="중복검사" >
                    <br>
                    <input type="password" name="enrollPass" placeholder="비밀번호">
                    <br>
                    <input type="password" name="enrollPC" placeholder="비밀번호 확인">
                    <br>
                    <input type="text" name="enrollName" placeholder="이름">
                    <br>
                    <input type="text" name="enrollAdress" placeholder="주소">
                    <br>
                    <input type="text" name="enrollBY" id="birthYear" placeholder="년(4자)" >
                    <select id="birthMonth" name="enrollBM" style="height: 45px;">
                        <option selected>===월===</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                    <input type="text" id="birthDay" name="enrollBD" placeholder="일">
                    <br>
                    <select name="enrollGender" style="height: 45px;">
                        <option selected>===성별===</option>
                        <option value="M">남자</option>
                        <option value="F">여자</option>
                    </select>
                    <br>
                    <input type="tel" name="enrollPhone" placeholder="(예시))010-1234-5678">
                    <br>
					<input type="submit" id="enrollbtn" value="회원가입">        
					    </form>
    </div>
</div>

            <jsp:include page="/views/common/footerSk.jsp" />
<script>

$(document).ready(function(){

	$("#idcheck").on('click',function(){
			let enroll = $("#enrollId").val().trim();
			
			$.ajax({
				type:"Post",
				url:"${path}/idcheck",
				dataType:"json",
				data:{
					"enrollId":enroll
				},
				success:function(obj){
					if(obj.duplicate == true){
						alert("이미 사용중인 아이디 입니다.");
					}else{
						alert("사용 가능한 아이디 입니다.");
					}
					
				},
				error:function(e){
					console.log(e);
				}
				
			})
			
		});
		
	});
	


</script>

    
</body>
</html>