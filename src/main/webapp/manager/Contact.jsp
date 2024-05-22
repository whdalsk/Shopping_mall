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
    <script src="../js\menu_bar.js" defer></script>
    <link rel="stylesheet" href="../css\menu_bar.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap"
        rel="stylesheet" />
<title>1:1 문의 관리</title>

<style type="text/css">
 * {
            font-family: "Noto Serif KR", serif;
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


        div>a {
            font-weight: bold;
            text-transform: uppercase;
        }      

        .mycards {
            width: 95%;
            max-width: 800px;
            margin: auto;
        }

        .mycards>.card {
            margin-top: 10px;
            margin-bottom: 10px;
        }
        
        hr {
            border: none;
            border-top: 3px double #333;
            color: #333;
            overflow: visible;
            text-align: center;
            height: 5px;
        }

        hr::after {
            background: #fff;
            content: '§';
            padding: 0 4px;
            position: relative;
            top: -13px;
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

    <div class="mycards" id="comment-list">
    <%
    msg = "SELECT * FROM contact";
    PST = CN.prepareStatement(msg);
    RS=PST.executeQuery();              
    while(RS.next()!=false){ 
    	%>   
        <div class="card">
            <div class="card-body">
                <blockquote class="blockquote mb-0">
                    <p class="contact-message"><%=RS.getString("subject") %></p>
                    <hr>
                    <p class="contact-message"><%=RS.getString("content")  %></p>
                    <footer class="blockquote-footer"><%=RS.getString("name") %></footer>
                    <footer class="blockquote-footer"><%=RS.getString("email") %></footer>
                    <button onclick="del(<%=RS.getInt("connum") %>)" type="button" class="btn btn-dark">삭제</button>
                </blockquote>
            </div>
        </div>
        <%} %>        
    </div>
</body>
<script type="text/javascript">
	$(document).ready(function () {
	   
	});
	function del(a) {
		// console.log(a);
		window.location.href = 'DeleteContactSave.jsp?num=' + a;
		
	}
	
</script>
</html>