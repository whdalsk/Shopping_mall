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
	<title>관리자 - 조회</title>
<style>

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
	<form class="mypost" id="mypost">
	    <div class="form-floating mb-3">
	        <input type="number" class="form-control" name="code" id="code" placeholder="code" />
	        <label for="code">Code</label>
	    </div>
	    <div class="form-floating mb-3">
	        <input type="text" class="form-control" name="name" id="name" placeholder="Product name" />
	        <label for="name">상품 이름</label>
	    </div>	   
	    <div class="form-floating mb-3">
	        <input type="date" class="form-control" name="date" id="date" placeholder="date" />
	        <label for="date">등록 날짜</label>
	    </div>	    
	    <button type="button" class="btn btn-dark"  onclick="check()">조회</button>	 
	    <button type="button" class="btn btn-dark" onclick="deleteProduct()">삭제</button>  
	    <button type="reset" class="btn btn-dark">초기화</button>
	</form>

    <div class="mycards">
        <div class="row row-cols-1 row-cols-md-4 g-4" id="cards-box">
            <%
            int code = request.getParameter("code")!=null ? Integer.parseInt(request.getParameter("code")) : 0;
            
			String name = request.getParameter("name") != null ? request.getParameter("code"):null;
	        String date = request.getParameter("date") != null ? request.getParameter("date"):null;	
	        
	        System.out.println("code=" + code);
	        System.out.println("name=" +name);
	        System.out.println("date=" +date);
			if (code != 0 && name != null && !name.isEmpty()) {
			    // 코드와 이름이 모두 존재하는 경우
			    msg = "SELECT * FROM c_product WHERE CODE=" + code + " AND NAME='%" + name + "%'";
			} else if (code != 0 && date != null && !date.isEmpty()) {
			    // 코드와 날짜가 모두 존재하는 경우
			    msg = "SELECT * FROM c_product WHERE CODE=" + code + " AND DATE='" + date + "'";
			} else if (name != null && !name.isEmpty() && date != null && !date.isEmpty()) {
			    // 이름과 날짜가 모두 존재하는 경우
			    msg = "SELECT * FROM c_product WHERE NAME='%" + name + "%' AND DATE='" + date + "'";
			} else if (code != 0 && name != null && !name.isEmpty() && date != null && !date.isEmpty()) {
			    // 코드, 이름, 날짜가 모두 존재하는 경우
			    msg = "SELECT * FROM c_product WHERE CODE=" + code + " AND NAME='%" + name + "%' AND DATE='" + date + "'";
			} else if (code != 0) {
			    // 코드만 존재하는 경우
			    msg = "SELECT * FROM c_product WHERE CODE=" + code;
			} else if (name != null && !name.isEmpty()) {
			    // 이름만 존재하는 경우
			    msg = "SELECT * FROM c_product WHERE NAME='" + name + "'";
			} else if (date != null && !date.isEmpty()) {
			    // 날짜만 존재하는 경우
			    msg = "SELECT * FROM c_product WHERE DATE='%" + date + "%'";
			} else {
				msg = "SELECT * FROM c_product";
			}
            PST = CN.prepareStatement(msg);
            RS=PST.executeQuery();
            	while(RS.next() != false){
            		
           %>
           	<div class="col">
                <div class="card h-100">
                    <img src="../<%=RS.getString("image") %>"
                        class="card-img-top"> <!-- 사진url -->
                    <div class="card-body"> <!-- 사진url -->
                        <h5 id="name"><%=RS.getString("name") %></h5>                      
                        <strong id="price"><%=RS.getInt("price") %></strong>
                        <p id="explanation"><%=RS.getString("content") %></p>
                        <span>&#128077;</span>
                        <strong id="like"><%=RS.getInt("thumps_up") %></strong>
                        <span>&#128064;</span>
                        <strong id="review"><%=RS.getInt("hit") %></strong>
                        <button onclick="bring_this(this)" type="button" class="btn btn-dark"
                            value="<%=RS.getInt("code") %>">불러오기</button>
                    </div>
                </div>
            </div>
            <%}%>                        
        </div>
    </div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
	    alert(`안녕하세요`);
	    // show_cards();
	});
	
	function check() {
		let code = $('#code').val()
		if (code === 0 || code == null || code == "") {
			location.reload();
	}else{
		window.location.href = "Check.jsp?code=" + code;
	}
		
	}
	
	function bring_this(button) {
        // let innate_number = $(button).parents('#id or .class'). - 부모의 값 가져요기
        // let innate_number = $(button).siblings('.IN').text(); # 자기 형제
        // let innate_number = $(button).attr('value') # 속성 값 # 자기 자신 속성값
        // let innate_number = $(button).text() # 자시 자신 text

        // let val = $(button).$('.btn')

        // console.log(a)
		$('#code').val($(button).attr('value')); // code
		$('#name').val($(button).siblings('#name').text()); // 이름
		// $('#code').val($(button).attr('value')); // 파일 선택
		// $('#code').val($(button).attr('value')); // 등록 날짜
		window.scrollTo(0, 0);
		
		// let productName = $(button).closest('.card-body').find('#productname').text();
	    // $('#productname').val(productName);
    }

	function deleteProduct() {
	    // 현재 페이지의 URL을 변경하여 delete.jsp로 이동
	    let code = $('#code').val()
	    if (code === 0 || code == null || code == "") {
			location.reload();
	}else{
		window.location.href = "DeleteSave.jsp?code=" + code;
	}
	    
	}
	
	
</script>
</html>