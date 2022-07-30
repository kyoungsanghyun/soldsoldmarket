$(document).ready(() => {
	$("#btnDelete").on("click", () => {
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
			location.replace("${ path }/board/delete?no=${ board.no }");
		}
	});
			
	function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행하는 반응
             $("#search").submit();
        }
	}  

});