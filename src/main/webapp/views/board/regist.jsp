<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<link rel="stylesheet" href="${ path }/resources/css/productregist.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<style>


</style>

<script>
$(function () {
    //드래그 앤 드롭
    $(".sortable").sortable();

    //이미지 등록
    $("#AddImgs").change(function (e) {
        //div 내용 비워주기
        $('#Preview').empty();

        var files = e.target.files;
        var arr = Array.prototype.slice.call(files);

        //업로드 가능 파일인지 체크
        for (var i = 0; i < files.length; i++) {
            if (!checkExtension(files[i].name, files[i].size)) {
                return false;
            }
        }
        preview(arr);

        function checkExtension(fileName, fileSize) {
            var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            var maxSize = 10485760;  //10MB

            if (fileSize >= maxSize) {
                alert('이미지 크기가 초과되었습니다.');
                $("#AddImgs").val("");  //파일 초기화
                return false;
            }

            if (regex.test(fileName)) {
                alert('확장자명을 확인해주세요.');
                $("#AddImgs").val("");  //파일 초기화
                return false;
            }
            return true;
        }
        
        function preview(arr) {
            arr.forEach(function (f) {
                //파일명이 길면 파일명...으로 처리
                /*
                var fileName = f.name;
                if(fileName.length > 10){
                    fileName = fileName.substring(0,7)+"...";
                }
                */

                //div에 이미지 추가
                var str = '<li class="ui-state-default">';
                //str += '<span>'+fileName+'</span><br>';

                //이미지 파일 미리보기
                if (f.type.match('image.*')) {
                    //파일을 읽기 위한 FileReader객체 생성
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                        str += '<img src="' + e.target.result + '" title="' + f.name + '" width=80 height=80>';
                        str += '<span class="delBtn" onclick="delImg(this)">x</span>';
                        str += '</li>';
                        $(str).appendTo('#Preview');
                    }
                    reader.readAsDataURL(f);
                } else {
                    //이미지 파일 아닐 경우 대체 이미지
                    /*
                    str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=60 height=60 />';
                    $(str).appendTo('#Preview');
                    */
                }
            })
        }
    })
})


//이미지 삭제
    function delImg(_this) {
        $(_this).parent('li').remove()
    }
    
   

</script>

<section id="content">
	<%
	String PNo = (request.getParameter("PNo") != null) ? request.getParameter("PNo") : "0";
	%>
	<div class="write">
		<form name = "productRegist" action="${ path }/board/regist" method="POST" enctype="multipart/form-data">
			<div class="information">
				<button>상품등록</button>
				<br>
				<h2>기본정보</h2>
				<hr>
				<input type="hidden" name="PNo" value="<%=PNo%>"> <!-- 숨겨진 값 -->
				<input type="hidden" name="writer" value="${ loginMember.id }" readonly>
				<!-- PNo, writer는 숨겨진 값 -->
				<select class="category" name="category" required>
					<option value="의류">의류</option>
					<option value="악세서리">악세서리</option>
					<option value="디지털/가전">디지털/가전</option>
					<option value="스포츠/레저">스포츠/레저</option>
					<option value="도서/음반">도서/음반</option>
					<option value="반려동물">반려동물</option>
					<option value="기타">기타</option>
				</select>		
				<input type="text" name="title" id="write_title"
					placeholder="상품명을 입력하세요." required>
			</div>
			<div class="board-write-box">
				<br>
				<span><b>판매 가격 *</b></span>
				<br><br>
				<input type="text" name="price" id="price"
					placeholder="가격을 입력해주세요." required> 원
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>상품 상태</b></span>
				<br><br>
				<input type="radio" name="condition" value="open"/> 개봉
				<input type="radio" name="condition" value="new"/>거의 새것
				<input type="radio" name="condition" value="used"/>사용감 있음
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>거래지역 *</b></span>
				<br><br>
				<input type="text" name="location" id="location"
					placeholder="거래지역을 입력해주세요." required>
				<hr style="width:90%; margin: 20px 0 0 5%;">     
				<br>    
				<span><b>교환 *</b></span>
				<br><br>
				<input type="radio" name="exchange" value="no"/> 불가
				<input type="radio" name="exchange" value="yes"/> 가능
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>수량</b></span>
				<br><br>
				<input type="text" name="count" id="count"
					placeholder="수량을 입력해주세요." required> 개
				<hr style="width:90%; margin: 20px 0 0 5%;">
				<br>
				<span><b>설명 *</b></span>
				<br><br>
				<textarea name="content" cols="128" rows="15" 
					placeholder="구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 필수로 입력해 주세요. (10자 이상 입력)"></textarea>
				<br><br>
				<span><b>이미지 추가(ctrl키를 이용하여 올릴 사진을 모두 선택하세요.)</b></span>
		        <br>
          		<br>
	            <div class="filebox">
              		<div class="inputFile">
		                  <label for="AddImgs" class="addImgBtn">+</label>
		                  <input type="file" id="AddImgs" class="upload-hidden" name="upimg" accept=".jpg, .png, .gif" multiple> 
		            </div>
		              <ul id="Preview" class="sortable"></ul>
		        </div>   
	          	<div class="bottom">
	            	<button type="submit">등록하기</button>
	         	</div>
	         	
         	
	      </div>
       </form>
     </div>
  </section>
						    
				

<jsp:include page="/views/common/footer.jsp" />
