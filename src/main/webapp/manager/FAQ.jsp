<%@page import="org.apache.jasper.tagplugins.jstl.core.When"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/7bb20b58e4.js" crossorigin="anonymous"></script>
    <script src="..\js\menu_bar.js" defer></script>
    <link rel="stylesheet" href="..\css\menu_bar.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap"
        rel="stylesheet" />    
<title>FAQ MAKING</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap"
        rel="stylesheet" />
        
<style type="text/css">
	* {
            font-family: "Noto Serif KR", serif;
        }

        .mypic {
            width: 100%;
            height: 300px;

            background-image: linear-gradient(0deg,
                    rgba(0, 0, 0, 0.5),
                    rgba(0, 0, 0, 0.5)),
                url("https://mblogthumb-phinf.pstatic.net/MjAyMTA4MDNfNTkg/MDAxNjI3OTczMDIzNDg4._i6YXj9ap-3C_c0JrciGZSxesNb67DZQxkW0xRXEFiEg.O1gjXgMLIHM-6btALHjDEFkzW8KkxvNABmT5DrsGvb8g.PNG.shine4436/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-08-03_%EC%98%A4%ED%9B%84_3.43.41.png?type=w800");
            background-position: center 30%;
            background-size: cover;

            color: white;

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .mypost {
            width: 95%;
            max-width: 500px;
            margin: 20px auto 20px auto;

            box-shadow: 0px 0px 3px 0px black;
            padding: 20px;
        }

        .mypost>button {
            margin-top: 15px;
        }

        .mycards {
            margin: 20px auto 0px auto;
            width: 95%;
            max-width: 1200px;
        }

        .mycards>.card {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap');

        body {
            background-color: white;
            font-family: 'Open Sans', sans-serif;
        }

        details {
            background-color: wheat;
            color: black;
            font-size: 1.5rem;
        }

        summary {
            padding: .5em 1.3rem;
            list-style: none;
            display: flex;
            justify-content: space-between;
            transition: height 1s ease;
        }

        summary::-webkit-details-marker {
            display: none;
        }

        summary:after {
            content: "\002B";
        }

        details[open] summary {
            border-bottom: 1px solid #aaa;
            margin-bottom: .5em;
        }

        details[open] summary:after {
            content: "\00D7";
        }

        details[open] div {
            padding: .5em 1em;
        }

        div {
            text-align: center;
        }

        div>a {
            font-weight: bold;
            text-transform: uppercase;
        }
</style>
</head>
<body>
<nav class="navbar">
        <div class="navbar_logo">
            <i class="fa-regular fa-credit-card"></i>
            <a href="#">Card</a>
        </div>
        <ul class="navbar_menu">
            <li><a href="Manage.jsp">등록</a></li>
            <li><a href="Check.jsp">조회(삭제)</a></li>
            <li><a href="Update.jsp">변경</a></li>
            <li><a href="FAQ.jsp">FAQ</a></li>
            <li><a href="Contact.jsp">1:1 inquiry</a></li>
        </ul>
        <a href="#" class="navbar_icons">
            <li><i class="fa-brands fa-instagram"></i></li>
        </a>
        <a href="#" class="navbar_toogleBtn">
            <i class="fa-solid fa-bars"></i>
        </a>
</nav>
    <form class="mypost" method="get" id="post-box" action="InsertFaqSave.jsp">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="question" name="question" placeholder="url" />
            <label for="floatingInput">질문</label>
        </div>
        <div class="form-floating mb-3">
            <input type="number" class="form-control" id="faq_num" name="faq_num" placeholder="url" />
            <label for="floatingInput">질문 번호</label>
        </div>
        <div class="form-floating">
            <textarea class="form-control" placeholder="Leave a comment here" id="detail" name="detail"
                style="height: 200px"></textarea>
            <label for="floatingTextarea2">답변</label>
        </div>
        <div class="mybtns">
            <button  type="submit" class="btn btn-dark">등록</button>
            <button onclick="update()" type="button" class="btn btn-dark" >수정</button>
            <button onclick="del()" type="button" class="btn btn-dark" >삭제</button>
            <button type="button" onclick="location.reload();" class="btn btn-dark">새로고침</button>
        </div>
    </form>
    <div id="Faq">
           <%
    PST = CN.prepareStatement("SELECT * FROM faq");
    RS=PST.executeQuery();              
    while(RS.next()!=false){ 
    %>
        <div class="container">
            <details>
                <summary class="title"><%= RS.getString("question") %></summary>
                <p class="detail"><%= RS.getString("detail") %></p>
            	<h1>질문 번호:</h1>
                <p class="faq_num"><%=RS.getInt("faq_num") %></p>
                <button onclick="bring(this)" type="button" class="btn btn-dark">불러오기</button>
            </details>
        </div>
    <%} %> 
    </div>
    <p style="margin-bottom: 100px"></p>
</body>
<script type="text/javascript">
	
	function update() {
		var formData = $("#post-box").serialize();
	    
	    if (formData) {
	        window.location.href = "UpdateFaqSave.jsp?" + formData;
	    } else {
	        console.log("폼 데이터가 존재하지 않습니다.");
	    }	    
	}
	function del() { //삭제하기
		let q_number = $('#faq_num').val();
	    
	    if (q_number) {
	        window.location.href = "DeleteFaqSave.jsp?q_num=" + q_number;
	    } else {
	        console.log("폼 데이터가 존재하지 않습니다.");
	    }	   

       
        // console.log(del);
    }
    function bring(button) { //수정, 삭제 버튼 눌러서 창으로 가져오기
        let title = $(button).siblings('.title').text();
        let detail = $(button).siblings('.detail').text();
        let q_number = $(button).siblings('.faq_num').text();

        $('#question').val(title);
        $('#detail').val(detail);
        $('#faq_num').val(q_number);
        $("#faq_num").prop("readonly", true);
    }
</script>
</html>