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
    
    
    
    $('.side_img_box_con a').on("click", () =>{
        let srcAdd = $(this).attr("href");
        $("#main_img_box>img").attr("src","/");
        return false;
    });
    
    
    
    let count = 0;
    $('#toolbar_like').on("click", () => {
        if(count == 0) {
        $('#toolbar_like img').attr("src","/soldsoldmarket/resources/images/heartfilled.png");
        count += 1;
        } else if (count == 1) {
        $('#toolbar_like img').attr("src","/soldsoldmarket/resources/images/heartempty.png");
        count -= 1;
        }

    });


    // 댓글창 바로가기 기능
    $('#toolbar_comment').on("click", () =>{
        $('#reply_write_area').focus();
    });


    // 카카오톡 공유 api
        // Kakao.Link.sendDefault({
        //     objectType: "feed",
        //     content: {
        //       title: "", // 공유될 제목
        //       description: "", // 공유될 설명
        //       imageUrl: "", // 공유될 이미지 url
        //       link: {
        //         mobileWebUrl: "", // 공유될 모바일 URL
        //         webUrl: "", // 공유될 웹 URL
        //       },
        //     },
        //   });

});