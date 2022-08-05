<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

        
<link rel="stylesheet" href="${ path }/resources/css/productDetail.css?after">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<body>

    <!-- 전체 컨테이너 -->
    <div class="container">
        
        <!-- 사이드 이미지 -->
        <div class="side_img">
            <ul>
                <li class="side_img_box"><img src="${path}/resources/upload/product/${ padd.PAimg1 }" onerror="this.parentNode.remove(parentNode)" class="side_img_box_con"></li>
                <li class="side_img_box"><img src="${path}/resources/upload/product/${ padd.PAimg2 }" onerror="this.parentNode.remove(parentNode)" class="side_img_box_con"></li>
                <li class="side_img_box"><img src="${path}/resources/upload/product/${ padd.PAimg3 }" onerror="this.parentNode.remove(parentNode)" class="side_img_box_con"></li>
                <li class="side_img_box"><img src="${path}/resources/upload/product/${ padd.PAimg4 }" onerror="this.parentNode.remove(parentNode)" class="side_img_box_con"></li>
                <li class="side_img_box"><img src="${path}/resources/upload/product/${ padd.PAimg5 }" onerror="this.parentNode.remove(parentNode)" class="side_img_box_con"></li> 
            </ul>
        </div>
        
        <!-- 메인이미지 -->
        <div class="main_img">
            <div id="main_img_box">
                <img src="${path}/resources/upload/product/${ padd.PAimg1 }" onerror="this.parentNode.remove(parentNode)" id="main_img_box_con">
            </div>
        </div>

        <!-- 게시글 제목 및 가격 -->
        <div class="product_title"> 
            <div id="product_name">
            	<input type="hidden" name="no" value="${product.PNo}">
                <h2>${product.PName}</h2>
                <h3><fmt:formatNumber type="number" value="${product.PPrice}" groupingUsed="true"/>원</h3>
                <hr>
            </div>
        </div>

        <!-- 게시글 정보 -->
        <div class="product_info">
            
            <!-- 고정값 -->
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
            
            <!-- 변화값 -->
            <div id="product_info_varival">
                <ul>
                    <li>${product.MId}
	                	<!-- 작성자는 삭제버튼 / 일반회원은 신고버튼이 나오는 로직 -->
	                	
		            	<!-- 삭제 버튼 (작성자)-->
		            	<c:if test="${not empty member && member.id == product.MId}">
		                	 <span id="product_info_varival_delete"><img src="${ path }/resources/images/icon/delete.png">삭제하기</span></li>
		                </c:if>
		            	<!-- 신고 버튼 (일반회원) -->
		                <c:if test="${empty member || member.id != product.MId}">
		                	<span id="product_info_varival_report"><img src="${ path }/resources/images/icon/report.png">신고하기</span></li>
		                </c:if>	
                    <li><fmt:formatDate type="both"  pattern="yyyy년 MM월 dd일" value="${product.PDate}"/></li>
                    <li>${product.PLocation}</li>
	                    <li>
	                    <!-- 상태 NE-->
		                    <c:choose>
		                    	<c:when test="${product.PQlt eq 'new'}">거의 새것</c:when>
		                    	<c:when test="${product.PQlt eq 'open'}">개봉됨</c:when>
		                    	<c:when test="${product.PQlt eq 'used'}">사용감 있음</c:when>
		                    </c:choose>
	                    </li>
                    	<li>
	                    <!-- 교환 가능(Y/N) -->
	                    	<c:choose> 
	                    		<c:when test="${product.PExchange == 'Y'}">가능</c:when>
	                    		<c:when test="${product.PExchange == 'N'}">불가</c:when>
	                    	</c:choose>
                    	</li>
                    <li>${product.PQtt}</li>
                    <li>${product.PTrading}</li>
                </ul>
            </div>
        </div>
        
        <!-- 게시글 툴바 영역 -->
        <div class="toolbar">
          
            <!-- 회원 찜하기(좋아요로직) -->
            <c:if test="${not empty member}">
            	<input type="hidden" name="hid" value="${member.id}">
            	<input type="hidden" name="hno" value="${product.PNo}">
            	<!-- 좋아요 안누른 회원 -->
            	<c:if test="${empty like}">      	
            		<span id="toolbar_like">찜하기<span id="toolbar_like_member_likeyet"><img src="${ path }/resources/images/icon/heartempty.png">${product.PLike} </span></span>
            	</c:if>
            	<!-- 좋아요를 이미 누른 회원 -->
            	<c:if test="${not empty like}">            	
            		<span id="toolbar_like">찜하기<span id="toolbar_like_member_liked"><img src="${ path }/resources/images/icon/heartfilled.png">${product.PLike} </span></span>
            	</c:if>
            </c:if>
            
            <!-- 비회원 찜하기(로그인알림) -->
            <c:if test="${empty member}">
				<span id="toolbar_like">찜하기<span  id="toolbar_like_guest"><img src="${ path }/resources/images/icon/heartempty.png">${product.PLike} </span> </span>
            </c:if>
      
            <span id="toolbar_view">조회수<img src="${ path }/resources/images/icon/view.png">${product.PView}</span>
            <span id="toolbar_share" class="toolbar_share_pop">공유하기<img src="${ path }/resources/images/icon/share.png"></span>
			<!-- 공유하기 팝업창 -->
			<div class="toolbar_share_modal hidden">
				<div class="toolbar_share_modal_bg"></div>
				<div class="toolbar_share_modalBox">
					<ul>
						<li id="toolbar_share_modalBox_ks"><img src="${ path }/resources/images/icon/kakaostory.png">&nbsp; 카카오 스토리</li>
						<li id="toolbar_share_modalBox_kt"><img src="${ path }/resources/images/icon/kakaotalk.png">&nbsp; 카카오 톡</li>
						<li id="toolbar_share_modalBox_tw"><img src="${ path }/resources/images/icon/twitter.png">&nbsp; 트위터</li>
						<li id="toolbar_share_modalBox_fb"><img src="${ path }/resources/images/icon/facebook.png">&nbsp; 페이스북</li>
						<li id="toolbar_share_modalBox_url"><img src="${ path }/resources/images/icon/url.png">&nbsp; URL 주소 복사</li>
					</ul>
					<span><img class="toolbar_share_modalclose" src="${ path }/resources/images/button/closebtn.png"></span>
				</div>
			</div>

			<hr>
            <!--  작성자는 수정 버튼 / 일반회원은 구매버튼이 나오는 로직 -->
            	<!-- 수정 버튼 (작성자)-->
            	<c:if test="${not empty member && member.id == product.MId}">
                	<span id="toolbar_buy"><img src="${ path }/resources/images/button/modbtn.png" onclick="location.href='${ path }/product/update?no=${ product.PNo }'"></span>
                </c:if>	
            	<!-- 구매 버튼 (일반회원) -->
                <c:if test="${empty member || member.id != product.MId}">
                	<span id="toolbar_buy"><img src="${ path }/resources/images/button/buybtn.png"></span>
                </c:if>	
            <!-- 댓글 바로가기 -->    
            <span id="toolbar_comment"><img src="${ path }/resources/images/button/cmtbtn.png"></span>
        </div>
        
        <!-- 게시글 내용 -->
        <div class="product_detail">
            ${product.PContents}
        </div>
        
        <!-- 댓글 불러오기 -->
        <div class="reply_contents">
        <input type="hidden" name="pcnum" value="${Pconmment.PCm_no}">
            <ul>						
				<c:forEach var="Pconmment" items="${ product.pcomments }">
               		<li>
	               		<img src="${ path }/resources/images/icon/user.png" class="reply_contents_userIcon">
	               		<span id="reply_contents_writer"><c:out value="${Pconmment.PCm_id}"></c:out></span>
	               		<span><c:out value="${Pconmment.PCm_content}"></c:out></span>
	               		<span id="reply_contents_date"><fmt:formatDate type="date" value="${ Pconmment.PCm_date }"/>
	                	<!--  댓글 작성자와 게시작 장성자만댓글 옆에 X 버튼 나오는 로직 -->
            				<c:if test="${not empty member}">
            				<c:if test="${member.id == product.MId || member.id == Pconmment.PCm_id }">
	                			<span><input type="hidden" class="pcno" value="${Pconmment.PCm_no}"><img class="reply_contents_delete" src="${ path }/resources/images/icon/xmark.png"></span>
	                		</c:if>	
	                		</c:if>
	                	</span>
                	</li>     	
                </c:forEach>
             </ul>
        </div>

        <div class="reply_write">
            <!-- 댓글 로그인회원 -->
           	<c:if test="${not empty member}">
				<span><img src="${ path }/resources/images/icon/user.png" id="reply_write_id_icon"></span><span id="reply_write_id">${member.id}</span>
					<form action="${path}/product/comment" method="GET">
				      		<input type="hidden" name="productNo" value="${ product.PNo }">
           			  		<textarea name="content" placeholder="댓글을 입력해주세요." style="resize: none;" id="reply_write_area"></textarea>
               	   			 <span><input type="submit" id="reply_write_upbtn" value=""></span>
           			</form>	
            </c:if>	
            <!-- 댓글 GUSET  -->
            <c:if test="${empty member}">
				<span><img src="${ path }/resources/images/icon/user.png" id="reply_write_id_icon"></span><span id="reply_write_id">GUEST</span>
			          <form  action="${path}/product/comment" method="POST">
             				<textarea placeholder="로그인 후 이용해주세요." style="resize: none;" id="reply_write_area" readonly="readonly"></textarea>
   					  </form>
                </c:if>	
    	
	</div>
	
    <script src="${ path }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    
	<script>
		$(document).ready(() => {
		    // 사이드 이미지 
		    $('.side_img_box_con').on({
		        mouseenter : (event) => {
		            $(event.target).fadeTo(100 , .5)
		        } , 
		        mouseleave : (event) => {
		            $(event.target).fadeTo(100 , 1);
		        }
		    });
		    
		    
		    
		    $('.side_img_box>img').on("click", () =>{
		        let srcAdd = $(event.target).attr("src");
		        console.log(srcAdd);
		        $("#main_img_box>img").attr("src",srcAdd);
		    });
		    
		
			// 게시글 삭제
					$("#product_info_varival_delete").on("click", () => {
					if(confirm("정말로 삭제 하시겠습니까?")) {
						location.replace("${ path }/product/delete?no=${ product.PNo }");
					}
				});
			// 신고 하기
					$("#product_info_varival_report").on("click", () => {
					if(confirm("신고하시겠습니까?")) {
						location.replace("${ path }/product/delete?no=${ board.no }");
					}
				});

		
		
		
		    // 댓글창 바로가기 기능
		    $('#toolbar_comment').on("click", () =>{
		        $('#reply_write_area').focus();
		    });
		
			// 공유하기 팝업창
			const open = () =>{
				document.querySelector(".toolbar_share_modal").classList.remove("hidden")
			}
			const close = () => {
				document.querySelector(".toolbar_share_modal").classList.add("hidden");
			}

			document.querySelector(".toolbar_share_pop").addEventListener("click", open);
			document.querySelector(".toolbar_share_modalclose").addEventListener("click", close);
			document.querySelector(".toolbar_share_modal_bg").addEventListener("click", close);
			
			// url 주소 선언
			let urladd = 'http://localhost:8090${path}/product/view?no=${product.PNo}';

			// 카카오스토리 
				Kakao.init('ce784bf4ee0394bb4ce429ce2ec5d38e');
				
				const btnShareKs = document.querySelector('#toolbar_share_modalBox_ks');
				
				btnShareKs.addEventListener('click', () => {
				  Kakao.Story.share({
					url: 'urladd',
					text: '내용을 입력하세요.'
				  });
				})
				
				
		    // 카카오톡 공유
			const btnShareKt = document.querySelector('#toolbar_share_modalBox_kt');
				
				btnShareKt.addEventListener('click',() => {
				
				Kakao.Link.sendDefault({
				objectType: 'feed',
				content: {
					title: '${product.PName}',
					description: '${product.PPrice}',
					imageUrl:
					'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbmRWSv%2FbtrIOwo5CJJ%2FeKaDPTSyQpgrUHdlflNayk%2Fimg.png',
					link: {
					mobileWebUrl: 'https://naver.com',
					webUrl: 'https://naver.com',
					},
				},
				buttons: [
					{
					title: '웹으로 보기',  
					link: {
						mobileWebUrl: 'https://naver.com',  
						webUrl: 'https://naver.com',
					},
					},
				],
				})
			}
		);

			// 트위터 공유 
			const btnShareTw = document.querySelector('#toolbar_share_modalBox_tw');

			btnShareTw.addEventListener('click', () => {
			const sendText = '${product.PName}';
			const pageUrl = urladd;
			window.open('https://twitter.com/intent/tweet?text=${sendText}&url=${pageUrl}');
			})

			// 페이스북 공유 
			const btnShareFb = document.querySelector('#toolbar_share_modalBox_fb');

			btnShareFb.addEventListener('click', () => {
			const pageUrl = urladd;
			window.open('http://www.facebook.com/sharer/sharer.php?u=${pageUrl}');
			})
			
			// URL 주소 복사
			
			const btnShareUrl = document.querySelector('#toolbar_share_modalBox_url');
			btnShareUrl.addEventListener('click', () => {
				var url = '';
				var textarea = document.createElement("textarea");
				document.body.appendChild(textarea);
				url = window.document.location.href;
				textarea.value = url;
				textarea.select();
				document.execCommand("copy");
				document.body.removeChild(textarea)
				
			alert("Url 주소 복사 완료.")
			})
			
			

		    
		    // 댓글 삭제 기능
		    $('.reply_contents_delete').on("click", function(event){
			
		    	let no = $(event.target).prev().val();
		    	
		    	console.log(no);
		    	
 		    	if(confirm("댓글을 삭제하겠습니까?")) {
		
		        $.ajax({
		            type : "GET",
		            url : "${path}/CommentDeleteAjax.do",
		            data : {no},
		            success : function()  {
		            	location.reload();
		                },
		            error : function(error){
		                console.log(error);
		            	},
		            complete : function(){
		            	},
		        	});
		    	}
			});

		
		
			// 비회원 좋아요시 로그인팝업
		    $('#toolbar_like_guest').on("click", () =>{
		        alert("로그인 후 이용해주세요.")
				location.replace("${path}/login");
		    });

			 // 좋아요 로직 
			 $('#toolbar_like').on("click", function(event){
			      let no = ${product.PNo};

					$.ajax({
			            type : "POST",
			            url : "${path}/like.do",
			            data : {no},
			            dataType : "json",
			            success : function(obj) {
			    			console.log(obj)
			    			if (obj !== null) {
			    				$('#toolbar_like img').attr("src","${path}/resources/images/icon/heartfilled.png");
			    				location.reload();
			    			} else {
					            $('#toolbar_like img').attr("src","${path}/resources/images/icon/heartempty.png");
					            location.reload();
			    			}
			    		} ,
			            error : function(error){
			                console.log(error);
			            },
			            complete : function(){
			            }
			        });
			 })
		});
	</script>

</body>
</html>


<jsp:include page="/views/common/footer.jsp" />