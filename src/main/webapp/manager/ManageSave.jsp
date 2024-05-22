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
    String path=application.getRealPath("./img");
    File uploadDir = new File(path);
    if (!uploadDir.exists()) {
        uploadDir.mkdir();
    }
    
    MultipartRequest mr = new MultipartRequest(request,path,1024*1024*7,"utf-8");
    
    int code = mr.getParameter("code")!=null ? Integer.parseInt(mr.getParameter("code")):0;   
    if(code == 0){ // 1
    	%>
  		<script type="text/javascript">
  			alert(`code 값이 0 입니다.`);
  		</script>
  		<%
  		response.sendRedirect("Manage.jsp");
    }
    msg="select count(*) cnt from c_product where code = " + code;
    
    PST = CN.prepareStatement(msg);
    RS=PST.executeQuery();            
    
    if(RS.next()!=false){ 
    	if(RS.getInt("cnt")>0){ // code 중복 검사
    		%>
    		<script type="text/javascript">
    			alert(`이미 등록되어있습니다 돌아갑니다`);
    		</script>
    		<%
    		response.sendRedirect("Manage.jsp");
    	}
    }
    // 받아오기
    String name = mr.getParameter("name");//2
    String content = mr.getParameter("content"); // 3
    int price = mr.getParameter("price")!=null ?Integer.parseInt(mr.getParameter("price")):0;//4
    // 4
    
  
/////////////////////////////////////////////////////////////////////
	
	String file = mr.getFilesystemName("imageUpload");
/////////////////////////////////////////////////////////////////////
    
    
    //sql데이트로 변경하기
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String dateParam  = mr.getParameter("date")!=null ? mr.getParameter("date"):null;
    java.sql.Date sqlDate = null;
    Date date = null;
    if(dateParam  != null && dateFormat !=null){
    	date = dateFormat.parse(dateParam);	
    	sqlDate = new java.sql.Date(date.getTime());
    }
    
    // sql 쿼리문 준비-실행
    msg = "INSERT INTO c_product (code, name, content, price, image, wdate, hit, likes, thumps_up) VALUES (?, ?, ?, ?, ?, ?, 0, 0, 0)";
    PST = CN.prepareStatement(msg); //쿼리명령어 미리 해석하고 데이터매칭 
    PST.setInt(1, code);
    PST.setString(2, name);
    PST.setString(3, content);
    PST.setInt(4, price);
    PST.setString(5, "img/"+file);
    PST.setDate(6, sqlDate);

	if(PST.executeUpdate()>0){System.out.println("저장 성공\n ") ; }
	else{System.out.println("PST명령어  guest테이블 저장 실패실패\n ") ; }
    %>
<script>
    setTimeout(function() {
        window.location.href = 'Manage.jsp';
    }, 3000); // 5000밀리초 = 5초
</script>
</body>

</html>