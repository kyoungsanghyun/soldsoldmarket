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
            <img src="${path }/resources/images/로고.png" id="img01">
            <h2>이용약관</h2>
                <div id="forlog">

                    <div id="enrollCheck">
                            <ul>
                                <h3>여러분을 환영합니다.</h3>
                                <li>
                                    쏠쏠마켓을 이용하시거나 쏠쏠마켓 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 
                                    잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다
                                </li>
                                <h3>다양한 쏠쏠마켓 서비스를 즐겨보세요.</h3>
                                <li>
                                    여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며,
                                    쏠쏠마켓은 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 쏠쏠마켓 서비스 이용 계정(이하 ‘계정’)을 부여합니다.
                                    계정이란 회원이 쏠쏠마켓 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.
                                </li>
                                <li>
                                    회원은 자신의 계정을 통해 좀더 다양한 쏠쏠마켓 서비스를 보다 편리하게 이용할 수 있습니다. 
                                </li>
                                <h3>여러분의 개인정보를 소중히 보호합니다.</h3>
                                <li>
                                    쏠쏠마켓은 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집.이용하며,
                                    개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 쏠쏠마켓이 이용자 및 회원에 대해 관련 개인정보를 
                                    안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.
                                </li>
                                <li>
                                    쏠쏠마켓은 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우,
                                    전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후
                                    여러분의 정보를 파기하거나 분리 보관할 수 있으며,
                                    만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.
                                </li>

                            </ul>
                    </div>
                    <form>
                        <input type="button" value="뒤로가기" onclick="history.back()">
                    </form>

                </div>
        </div>
            <jsp:include page="/views/common/footerSk.jsp" />
    </div>


    
</body>
</html>

