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
    <title>약관 페이지</title>
    <script src="${ path }/resources/js/jquery-3.6.0.js"></script>
	<link rel="stylesheet" type="text/css" href="${path }/resources/css/enrollcheck.css">
</head>
<body>

    <div id="wrap01">
        <div id="header01">
        </div>
        <div id="content01">
            <img src="${path }/resources/images/로고.png" onclick="location.href='${ path }/home'" id="img01">
                <div id="forlog">
                    <div id="enrollCheck">
                            <ul>
                                <h3>1. 수집하는 개인정보</h3>
                                <li>
                                    대부분의 쏠쏠마켓 서비스는 회원 가입을 해야 이용할 수 있습니다.
                                    게시물 등록, 댓글, 직접연락 등의 서비스를 이용하기 위해 회원 가입을 하는 경우, 
                                    쏠쏠마켓은 서비스 이용을 위해 반드시 필요한 개인정보만 수집합니다.
                                </li>
                                <li>
                                    서비스 이용 중에 개인정보가 추가로 수집될 수 있습니다. 
                                    이 경우 개인정보를 수집하기 전에 개인정보의 수집과 이용에 대해 미리 알려 드리고 동의를 받습니다.
                                </li>
                                <li>
                                    서비스를 이용할 때 자동으로 만들어지는 정보들이 저장, 수집될 수 있습니다.
                                     그리고 이용한 휴대전화, 컴퓨터와 같은 기기 정보 중 변경이 어려운 고유한 정보를 수집할 때는 원래의 내용을 알 수 없도록 변경하여 수집합니다.
                                </li>
                                <h3>2. 수집한 개인정보의 이용</h3>
                                <li>
                                    이용자가 직접 회원 가입 또는 탈퇴를 신청한 것이 맞는지 확인, 이용자 나이 확인,
                                    이용자 구분 등이 필요한 경우 개인정보를 이용합니다.
                                </li>
                                <li>
                                    이용자가 안심하고 서비스를 이용할 수 있는 안전한 인터넷 이용 환경을 만들기 위해 개인정보를 이용합니다.
                                    개인의 비밀과 사생활을 보호하거나 위험이 생기지 않도록 보호하는데 개인정보를 이용합니다.
                                </li>
                                <h3>3. 개인정보의 파기(삭제)</h3>
                                <li>
                                    이용자의 개인정보는 회원 탈퇴 시 빠르게 삭제합니다.
                                    그러나 아래와 같이 이용자에게 따로 동의를 받는 경우에는 동의 받은 기간 동안 안전하게 보관하였다가 삭제합니다.
                                    그리고 법에서 보관 기간을 정해두고 있는 경우에도 해당 기간 동안 개인정보를 안전하게 보관하였다가 삭제합니다.
                                </li>
                                <li>
                                    탈퇴 회원 관련 정보 (6개월 보관)<br>

                                    서비스를 옳지 않게 이용한 것에 대한 처벌과 책임을 피하기 위해 쏠쏠마켓으로부터 징계를 받기 전에 
                                    회원 가입과 탈퇴를 반복하지 못하도록 탈퇴한 이용자의 휴대전화 번호를 원래의 값을 알 수 없도록 처리하여 보관
                                </li>

                            </ul>
                    </div>
                    <form>
                        <label ><input type="radio" name="agree" value="yes">동의</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label ><input type="radio" name="agree" value="no">비동의</label>
                        <br>
                        <input type="button" value="회원가입" id="insolbtn">
                    </form>
                </div>
        </div>
        
        <jsp:include page="/views/common/footerSk.jsp" />
        
 <script type="text/javascript">
	 $(document).ready(function(){
	     $("#insolbtn").on('click',function(){
	         let a = $('input[name="agree"]:checked').val();
			
	         if(a == "yes"){
	        	 location.replace("${path}/enroll");
	         }else{
	        	 alert("동의를 하셔야 회원가입이 가능합니다.");
	         }
	         
	         
	     })
	 })
 </script>

    
</body>
</html>