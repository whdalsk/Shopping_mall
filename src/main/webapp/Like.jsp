<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Like</title>
<style>
/* 선택된 이미지에 대한 스타일 */
.gray{
	filter: grayscale(100%);
}
</style>
</head>
<body>
	<img src="./images/Like.png" id="likeImage" class="gray" width="10%" height="10%">
	
</body>
<script type="text/javascript">
	$(document).ready(function(){
	    // 이미지 클릭 이벤트 핸들러 추가
	    $("#likeImage").click(function(){
	        // 이미지의 클래스를 확인하여 클릭 여부 판단
	        var isClicked = $(this).hasClass("gray"); // true
	        
	        // 클릭 여부에 따라 이미지 변경
	        if (isClicked) {	        	
	        	$(this).attr("src", "./images/Like.png").removeClass("gray");
	            $.ajax({
                    type: "POST",
                    url: "./Like",
                    contentType: "application/json",
                    success: function(data) {
                        // 성공적으로 요청이 처리되면 좋아요 카운트를 갱신합니다.
                    	
                    },
                    error: function() {
                        console.error("서버 오류 발생");
                    }
                });
	        } else {        	
	        	$(this).attr("src", "./images/Like.png").addClass("gray");
	            $.ajax({
                    type: "POST",
                    url: "./unLike",
                    contentType: "application/json",
                    success: function(data) {
                        // 성공적으로 요청이 처리되면 좋아요 카운트를 갱신합니다.
                    	
                    },
                    error: function() {
                        console.error("서버 오류 발생");
                    }
                });
	        }
	    });
	});
</script>
</html>