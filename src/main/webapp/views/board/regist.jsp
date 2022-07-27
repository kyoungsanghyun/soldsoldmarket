<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/productregist.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<section id="content">
	<div class="write">
		<div class="information">
			<button>상품등록</button>
			<br>
			<h2>기본정보</h2>
			<hr>
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
			<input type="checkbox" name="condition" value="open"/> 개봉
			<input type="checkbox" name="condition" value="new"/>거의 새것
			<input type="checkbox" name="condition" value="used"/>사용감 있음
			<hr style="width:90%; margin: 20px 0 0 5%;">
			<br>
			<span><b>거래지역 *</b></span>
			<br><br>
			<input type="text" name="place" id="place"
				placeholder="거래지역을 입력해주세요." required>
			<hr style="width:90%; margin: 20px 0 0 5%;">     
			<br>    
			<span><b>교환 *</b></span>
			<br><br>
			<input type="checkbox" name="condition" value="no"/> 불가
			<input type="checkbox" name="condition" value="yes"/> 가능
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
			<span><b>사진 추가</b></span>
			<br>
			 <form method="post" enctype="multipart/form-data">
                <div class="button">
                    <label for="chooseFile">
                        💙 사진 추가는 이 곳을 누르세요 💙</label>
                </div>
                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
            </form>

            <div class="fileContainer">
                <div class="fileInput">
                    <p>FILE NAME: </p>
                    <p id="fileName"></p>
                </div>
                <div class="buttonContainer">
                    <div class="submitButton" id="submitButton">SUBMIT</div>
                </div>
            </div>
        </div>
        
        <div class="image-show" id="image-show"></div>
    </div>
</section>

<div class="bottom">
	<button>등록하기</button>
</div>

<script>
// + 버튼 누르면 첨부파일 버튼 추가되게 만들기 
/* function fileFields() {
	 var x = document.getElementById('imageUpload');
	 x.onclick = function() {
  		var i = parseFloat(this.lastChild.id)+1;
  		input = document.createElement("input");
  		input.setAttribute("type", "file");
  		input.setAttribute("name", 'imageName_' + i);
  		input.setAttribute("id", i);
  		this.appendChild(input);
	 }
}

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

addLoadEvent(function() {
  fileFields();
});
*/


var submit = document.getElementById('submitButton');
submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

function showImage() {
    var newImage = document.getElementById('image-show').lastElementChild;
    newImage.style.visibility = "visible";
    
    document.getElementById('image-upload').style.visibility = 'hidden';

    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
}


function loadFile(input) {
    var file = input.files[0];

    var name = document.getElementById('fileName');
    name.textContent = file.name;

    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');

    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
    newImage.style.objectFit = "contain";

    var container = document.getElementById('image-show');
    container.appendChild(newImage);
};
</script>

<jsp:include page="/views/common/footer.jsp" />