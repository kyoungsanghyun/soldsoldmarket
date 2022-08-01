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
<script src = "https://developers.kakao.com/sdk/js/kakao.js"></script>
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
                        <input type="password" name="enrollPass" id="logPassword" placeholder="password" size="25" >
                        <br>
                        <input type="submit" value="로그인" id="loginbtn">
                    </form>

                    <button id="insolbtn">회원가입</button>
                    <div class="in"><a href="javascript:kakaoLogin();"><img src="${path }/resources/images/카카오.jpg" class="api"></a></div>
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
    
    <script type="text/javascript">
    
    //프로젝트
   //	0cd38c6cd04b96b4e236cef365812b96 
    //function saveToDos(token) { //item을 localStorage에 저장합니다. 
      //    typeof(Storage) !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token)); 
      //};
   
      
      
   window.Kakao.init("0cd38c6cd04b96b4e236cef365812b96");
   //Form
   function kakaoLogin(){
	   window.Kakao.Auth.login({
		   scope:'profile_nickname,profile_image,account_email,gender,birthday',
		   success:function(obj){
			   console.log(obj);
			   
				//saveToDos(obj.access_token)
				
			   window.Kakao.API.request({
				   url:'/v2/user/me',
				   success: function(res){
					   const kA = res.kakao_account;
					   let gender = "";
					   console.log(kA);
					   console.log(kA.profile["nickname"]);
					   console.log(kA.gender);
					   console.log(kA.email);
					   console.log(kA.birthday);

					   if(kA.gender == 'male'){
						   gender = "M";
					   }else{
						   gender = "F";
					   }
					   
					   let user = {
							   "name":kA.profile["nickname"],
							   "gender":gender,
							   "email" :kA.email,
							   "birthday":kA.birthday
					   };
					   console.log(user);
					  // console.log(sessionStorage.getItem('AccessKEY'));
					   location.assign('${path}/login2?name='+user.name+'&gender='+user.gender+'&email='+user.email
							   +'&birthday='+user.birthday);
					   
					   
				   }
				   
			   });
		   }
		   
	   });
   }
    
    
    
    
    
    </script>

    
</body>
</html>