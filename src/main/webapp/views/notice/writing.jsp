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
    <link rel="stylesheet" href="${path }/resources/css/write.css">
</head>
<body>
<jsp:include page="/views/common/header.jsp" />
<div id="main">

    <section class="notice">
        <div class="page-title">
                <div class="container">
                    <h3>공지사항</h3>
                </div>
            </div>
        
            <!-- board seach area -->
            <div id="board-search">
                <div class="container">
                    <div class="search-window">
                        <form action="">
                            <div class="search-wrap">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        <!-- board list area -->
            <div id="board-list">
                <div class="container">
                    <table class="board-table">
                        <thead>
                        <form action="${path }/notice/write" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name = "writer" value = ${member.id }>

                            <tr>
                                <th>
                                    <input type="text" placeholder="제목을 입력하세요" name="title" id="writingName" >
                                </th>
                                
                            </tr>
                            <tr>
                                <th>
                                    <input type="file" id="writingFile" name="file" accept=".gif, .jpg, .png" onchange="readURL(this);">
                                </th>
                            </tr>
                        </thead>
                    </table>
	                    <div id="cimg">
	                    <img id="preview">
	                    </div>
                    <br>
                    <textarea name="content" id="writing" cols="30" rows="10"></textarea>
                    <br>
                    <div id="btn1">
                        <input type="submit" value="작성완료" id="subBtn">
                        <input type="button" value="목록으로" id="goBack" onclick="location.href='${path}/notice/list?page=1'"">
                    </div>
                </form>
                </div>
            </div>
    <script type="text/javascript">
    	
    	function readURL(input) {
    		  if (input.files && input.files[0]) {
    		    var reader = new FileReader();
    		    
    		    reader.onload = function(e) {
    		    	let img = document.getElementById('preview');
    		      	img.src = e.target.result;
    		      	img.style.width = "400px";
    		      	img.style.height = "200px";
    		    };
    		    reader.readAsDataURL(input.files[0]);
    		  } else {
    		    document.getElementById('preview').src = "";
    		  }
    		}
    
    </script>   
        
        </section>
        <jsp:include page="/views/common/footerSk.jsp" /> 
    
</body>
</html>