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
<title>관리자 - 등록</title>
<meta property="og:title" content="카드 등록" />
    <meta property="og:description" content="카드 등록 - 개발자" />
    <meta property="og:image"
        content="https://mblogthumb-phinf.pstatic.net/MjAyMTA4MDNfNTkg/MDAxNjI3OTczMDIzNDg4._i6YXj9ap-3C_c0JrciGZSxesNb67DZQxkW0xRXEFiEg.O1gjXgMLIHM-6btALHjDEFkzW8KkxvNABmT5DrsGvb8g.PNG.shine4436/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-08-03_%EC%98%A4%ED%9B%84_3.43.41.png?type=w800" />

<style type="text/css">
	a {
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
    <%
    int faq_num =request.getParameter("faq_num")!=null?Integer.parseInt(request.getParameter("faq_num")):0;    
    // 받아오기
    PST = CN.prepareStatement("SELECT count(*) cnt from FAQ WHERE faq_num = " + faq_num);
    RS=PST.executeQuery();              
    if(RS.next()==true){ 
    	GGtotal=RS.getInt("cnt"); //GGtotal변수 = 317기억  데이터전체갯수
    }
    
    if(GGtotal>0){     	
     	PST = CN.prepareStatement("UPDATE FAQ SET question=?, detail=? WHERE faq_num=?");
     	PST.setString(1, request.getParameter("question"));
	    PST.setString(2, request.getParameter("detail"));
	    PST.setInt(3, faq_num);
	    if(PST.executeUpdate()>0){
	    	System.out.println("수정 성공\n ") ; 
	    	}else{
	  		System.out.println("수정 실패") ; 
	  		} // executeUpdate if loop end
    }
  	else{
  		System.out.println("q_num이 0입니다.") ; 
  		}

    %>
<script>
    setTimeout(function() {
        window.location.href = 'FAQ.jsp';
    }, 2000); // 5000밀리초 = 5초
</script>
</body>

</html>