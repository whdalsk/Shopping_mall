<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
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
    <script src="js\menu_bar.js" defer></script>
    <link rel="stylesheet" href="css\menu_bar.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap"
        rel="stylesheet" />
<title>Insert FAQ</title>
<style type="text/css">
	 a{
            text-decoration: none;
            color: wheat;
            /* color:inherit; 해도 됩니다. */
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
            <li><a href="Manage.jsp">카드 등록</a></li>
            <li><a href="Check.jsp">카드 조회</a></li>
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
<script type="text/javascript">
<% 		
		String q = request.getParameter("question");
		String d = request.getParameter("detail");
		System.out.println(q);
		System.out.println(d);
		
		PST = CN.prepareStatement("INSERT INTO faq (faq_num, question, detail) VALUES (faq_seq.NEXTVAL, ?, ?)");
		PST.setString(1, q);
	    PST.setString(2, d);
	    
	    if(PST.executeUpdate()>0){
	    	System.out.println("수정 성공\n ") ;
	    }else{
	  		System.out.println("수정 실패") ; 
	  	} // if end  	
%>
	setTimeout(function() {
	    window.location.href = 'FAQ.jsp';
	}, 3000); // 3초 후 이동
</script>
	<h2>등록 여부</h2>
</body>
</html>