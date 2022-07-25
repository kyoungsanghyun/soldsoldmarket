<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        
<link rel="stylesheet" href="${ path }/resources/css/product.css?after">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

</head>

<body>
    <div class="container">
        <div class="side_img">
            <ul>
                <li><div id="side_img_box"></div>사이드 이미지</li>
            </ul>
        </div>
        <div class="main_img">

            <div id="main_img_box">
                이미지박스
                <img src="${ path }/resources/images/testimg.jpg">
            </div>
        </div>
        <div class="product_title"> 
            <div id="product_name">
                <h2>게시글 제목</h2>
                <h3>제품 가격</h3>
                <hr>
            </div>
        </div>
        <div class="product_info">

            <div id="product_info_fixval">
                <ul>
                    <li>작성자</li>
                    <li>작성일</li>
                    <li>지역</li>
                    <li>제품상태</li>
                    <li>교환여부</li>
                    <li>수량</li>
                    <li>판매진행상태</li>
                </ul>
            </div>
            <div id="product_info_varival">
                <ul>
                    <li>작성자 ID</li>
                    <li>0000/00/00</li>
                    <li>지역명</li>
                    <li>상태여부</li>
                    <li>교환여부</li>
                    <li>00</li>
                    <li>진행여부</li>
                </ul>
            </div>
        
        </div>
        <div class="toolbar">
            <span id="toolbar_like">찜하기<img src="${ path }/resources/images/heartempty.png"></span>
            <span id="toolbar_view">조회수<img src="${ path }/resources/images/view.png">0</span>
            <span id="toolbar_share">공유하기<img src="${ path }/resources/images/share.png"></span>
            <hr>
            <span id="toolbar_buy"><img src="${ path }/resources/images/buybtn.png"></span>
            <span id="toolbar_comment">댓글달기</span>
        </div>
        <div class="product_detail">
            이상민 행정안전부 장관이 25일 서울 종로구 정부서울청사 별관에서 경찰국 신설 관련 총경회의에 대한 행안부 입장을 밝히고 있다. 뉴스1
            경찰 일선에서는 총 7번이나 이루어진 평검사 회의는 정당하고 총경 회의는 부당하냐는 반발이 나오지만, 행안부나 경찰 지휘부는 검찰과 경찰이 다르다는 점을 강조한다. 경찰은 수사기관이기도 하지만 기본적으로 치안 조직이자 전시에는 무기를 지닌 준군사조직으로 동원될 수 있다는 점에서 상명하복이 엄격하게 적용될 수밖에 없고, 검찰은 그 출발이 경찰을 통제하기 위한 인권 기구라는 시각이다. 또 경찰은 군과 마찬가지로 계급조직이지만, 검찰은 계급조직이 아니다.
            <br>
            경찰 지휘부 역시 당일 회의를 주도한 류삼영 총경이 ‘정복’을 입고 참석한 데다 화상회의로 참석한 총경도 많아, 단순한 의견 수렴 수준이 아닌 집단행동으로 비칠 우려가 있다고 보는 것으로 알려졌다. 한 경찰 관계자는 “공무원 집단행동 시 처벌이 될 수 있기에 참석자들에게 예고한 것이고 중간에 해산명령도 했다”며 “류 총경은 해산명령을 다른 참석자들에게 전달하지도 않았다. 류 총경은 다른 참석자의 행동과 경중이 달라 대기발령 조처한 것”이라고 설명했다.
            <br>
            법학자들 사이에서도 의견은 엇갈린다.
            <br>
            장영수 고려대 법학전문대학원 교수는 “경찰은 군대에 버금가는 무력 조직이고 숫자도 많은데 조직적으로 움직이는 건 국민을 불안하게 할 수 있다. 근무 시간이 아닐 때 모였다지만 다른 방식의 의견 수렴도 가능한데 굳이 그렇게 한 건 시위성 행사”라고 말했다. 이어 “검찰과의 비교는 경찰이 무력 조직이라는 특성을 고려하지 못한 것”이라고 덧붙였다. 공무원법 위반 소지와 관련해서는 “직무와 관련된 내용인지부터 단순한 의사 표현인지 또는 의사 관철을 요구하는 집단행동이었는지, 근무시간 외라고 해도 어디에서 모였는지까지 세 가지 관점을 적용해 판단해볼 수 있다”고 설명했다.
            <br>
            이종수 연세대 법학전문대학원 교수는 “국가공무원법 66조에 공무원 집단행위 금지 조항이 있지만 정부 정책이 잘못된 경우 공무원들이 정치적 의사를 표현하는 건 표현의 자유로 보장돼야 한다”며 “공무원은 국민의 봉사자이지 정부의 봉사자가 아닌 점을 고려해야 한다”고 말했다.
        </div>
        <div class="reply_contents">
            댓글 영역
            <br>댓글 영역
            <br>댓글 영역
            <br>댓글 영역

        </div>
        <div class="reply_write">
            댓글 작성 영역
        </div>

    </div>
    
</body>
</html>