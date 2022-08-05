<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<c:set var = "path" value = "${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${path }/resources/css/popup.css">
</head>
<body>

    <div class="layerPopup" id="layer_popup" style="visibility: visible;">
        <div class="layerBox">
            <h4 class="title">WELLCOME TO SOLDSOLD MARKET</h4>
            <div class="cont">
                <p>
    	<img src="${path}/resources/images/로고.png" width=400 height=150 usemap="#popup" alt="event page">
                </p>
            </div>
              <form name="pop_form">
            <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
            <label for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label></div>
            <div id="close" ><a href="javascript:closePop();">닫기</a></div>    
            </form>
        </div>
    </div>

    
</body>
</html>