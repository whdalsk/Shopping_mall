<%@page import="org.apache.jasper.tagplugins.jstl.core.When"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        
<meta charset="utf-8">
<title>관리자</title>
<meta property="og:title" content="카드 등록" />
    <meta property="og:description" content="카드 등록 - 개발자" />
    <meta property="og:image"
        content="https://mblogthumb-phinf.pstatic.net/MjAyMTA4MDNfNTkg/MDAxNjI3OTczMDIzNDg4._i6YXj9ap-3C_c0JrciGZSxesNb67DZQxkW0xRXEFiEg.O1gjXgMLIHM-6btALHjDEFkzW8KkxvNABmT5DrsGvb8g.PNG.shine4436/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-08-03_%EC%98%A4%ED%9B%84_3.43.41.png?type=w800" />

    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap"
        rel="stylesheet" />
        <script src="https://kit.fontawesome.com/7bb20b58e4.js" crossorigin="anonymous"></script>
    <script src="..\js\menu_bar.js" defer></script>
    <link rel="stylesheet" href="..\css\menu_bar.css">
 
<style>
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

        .card img {
            max-width: 200px;
            max-height: 200px;
            height: auto;
            width: auto;
            margin: auto;
            display: block;
        }

        .mycards>.card {
            margin-top: 10px;
            margin-bottom: 10px;
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
	<form class="mypost" id="mypost" method="post" enctype="multipart/form-data" action="UpdateSave.jsp">
	    <div class="form-floating mb-3">
	        <input type="number" class="form-control" name="code" id="code" placeholder="code" />
	        <label for="code">Code</label>
	    </div>
	    <div class="form-floating mb-3">
	        <input type="text" class="form-control" name="name" id="name" placeholder="Product name" />
	        <label for="name">상품 이름</label>
	    </div>
	    <div class="form-floating">
	        <textarea class="form-control" name="content" id="content" placeholder="상품 한 줄 평" style="height: 70px"></textarea>
	        <label for="review">상품 한 줄 설명</label>
	    </div>
	    <div class="form-floating mb-3">
	        <input type="number" class="form-control" name="price" id="price" placeholder="price" />
	        <label for="price">가격</label>
	    </div>
	    <div class="form-floating mb-3">
	        <input type="file" class="form-control" name="imageUpload" id="imageUpload" placeholder="Pic_URL" onchange="validateImageType(this)" />
	        <label for="imageUpload">Pic_URL</label>
	    </div>
	    <div class="form-floating mb-3">
	        <input type="date" class="form-control" name="date" id="date" placeholder="date" />
	        <label for="date">등록 날짜</label>
	    </div>
	    <div class="form-floating mb-3">
	        <input type="number" class="form-control" name="hit" id="hit" placeholder="view" />
	        <label for="view">조회수</label>
	    </div>
	    <div class="form-floating mb-3">
	        <input type="number" class="form-control" name="like" id="like" placeholder="like" />
	        <label for="like">좋아요</label>
	    </div>
	    <button type="submit" class="btn btn-dark" id="submitButton">
	        수정
	    </button>
	    <button type="button" class="btn btn-dark" onclick="location.reload();">
	        초기화
	    </button>
	</form>

    <div class="mycards">
        <div class="row row-cols-1 row-cols-md-4 g-4" id="cards-box">
            <%
            msg = "SELECT * FROM c_product";
            PST = CN.prepareStatement(msg);
            RS=PST.executeQuery();
            	while(RS.next() != false){            		
           %>
           	<div class="col">
                <div class="card h-100">
                    <img src="../<%=RS.getString("image") %>"
                        id="im" class="card-img-top"> <!-- img -->
                    <div class="card-body">
                        <h5 id="name"><%=RS.getString("name") %></h5> <!-- name -->
                        <p class="code"><%=RS.getInt("code") %></p> <!-- code -->
                        <strong id="price"><%=RS.getInt("price") %></strong> <!--  가격 -->
                        <p id="content"><%=RS.getString("content") %></p> <!-- 한줄 설명 -->
                        <p id="wdate"><%= RS.getDate("wdate") %></p> <!-- 등록날짜 -->
                        <span>&#128077;</span>
                        <strong id="like"><%=RS.getInt("likes") %></strong> <!-- likes -->
                        <span>&#128064;</span>
                        <strong id="hit"><%=RS.getInt("hit") %></strong> <!-- 조회수 --> 
                        <br>
                        <button onclick="bring_this(this)" type="button" class="btn btn-dark"
                            value="<%=RS.getInt("code") %>">불러오기</button>
                    </div>
                </div>
            </div>
            <%}%>                        
        </div>
    </div>
</body>
<script src="..\js\type.js"></script>
<script type="text/javascript">
	function bring_this(button) {
        // let innate_number = $(button).parents('#id or .class'). - 부모의 값 가져요기
        // let innate_number = $(button).siblings('.IN').text(); # 자기 형제
        // let innate_number = $(button).attr('value') # 속성 값 # 자기 자신 속성값
        // let innate_number = $(button).text() # 자시 자신 text
        // let val = $(button).$('.btn')
		$("#code").prop("readonly", true);
        // console.log($(button).siblings('#wdate').text())
		$('#code').val($(button).attr('value')); // code
		$('#name').val($(button).siblings('#name').text()); // 이름
		$('#content').val($(button).siblings('#content').text()); // 상품 한 줄 설명
		$('#price').val($(button).siblings('#price').text()); // 가격
		// $('#imageUpload').val($(button).parents.siblings('.card-img-top')); // 파일 선택
		// 버튼을 클릭한 해당 요소의 부모 요소를 찾아서 그 안의 이미지 요소를 선택합니다.
		$('#date').val($(button).siblings('#wdate').text()); // 등록 날짜
		$('#hit').val($(button).siblings('#hit').text()); // 조회수
		$('#like').val($(button).siblings('#like').text()); // 좋아요
		
		// let productName = $(button).closest('.card-body').find('#productname').text();
	    // $('#productname').val(productName);
    }
</script>
</html>