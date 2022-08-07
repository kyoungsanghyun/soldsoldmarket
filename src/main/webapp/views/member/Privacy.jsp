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
            <h2>개인정보처리방침</h2>
                <div id="forlog">

                    <div id="enrollCheck">
                            <ul>
                                <h3>1. 개인정보처리방침의 의의</h3>
                                <li>
                                    쏠쏠마켓은 어떤 정보를 수집하고, 수집한 정보를 어떻게 사용하며,
                                    필요에 따라 누구와 이를 공유(‘위탁 또는 제공’)하며, 이용목적을 달성한 정보를 언제·어떻게 파기하는지 등
                                    ‘개인정보의 한살이’와 관련한 정보를 투명하게 제공합니다.
                                </li>
                                <li>
                                    개인정보 침해사고가 발생하는 경우, 추가적인 피해를 예방하고 
                                    이미 발생한 피해를 복구하기 위해 누구에게 연락하여 어떤 도움을 받을 수 있는지 알려드립니다.
                                </li>
                                <h3>2. 수집하는 개인정보</h3>
                                <li>
                                    회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다.
                                </li>
                                <li>
                                    회원은 자신의 계정을 통해 좀더 다양한 쏠쏠마켓 서비스를 보다 편리하게 이용할 수 있습니다. 
                                </li>
                                <h3>3. 수집한 개인정보의 이용</h3>
                                <li>
                                    콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석,
                                    개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등
                                    신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
                                </li>
                                <li>
                                    보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해
                                    개인정보를 이용합니다.
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