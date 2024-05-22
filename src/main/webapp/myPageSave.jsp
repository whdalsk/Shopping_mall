<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> ReviewUpdateSave.jsp </title>
</head>
<body>
  <h2> ReviewUpdateSave.jsp  </h2>
 
<%
    //reviewUpdateSave.jsp 단독실행금지 
	name = request.getParameter("name");
	pass = request.getParameter("pass");
	tel = request.getParameter("tel");
	email = request.getParameter("email");
	zipcode = request.getParameter("zipcode");
	juso1 = request.getParameter("juso1");
	System.out.println(juso1);
	juso2 = request.getParameter("juso2");
	//c_productreply(num,writer,content,likes,code)구조
	msg = "update c_member set phone=?, email=?, zipcode=?, adress1=?, adress2=? where id = ?";
	PST = CN.prepareStatement(msg); 
	 PST.setString(1, tel);
	 PST.setString(2, email);
	 PST.setString(3, zipcode);
	 PST.setString(4, juso1);
	 PST.setString(5, juso2);
	 PST.setString(6, name);
	 
	int OK = PST.executeUpdate() ; //댓글저장처리 
	if(OK>0){System.out.println("PST명령어 c_productreply 댓글테이블 저장 성공\n ") ; }
	else{System.out.println("PST명령어 c_productreply 댓글테이블 저장 실패\n ") ; }
	
	//저장성공후 문서이동은coupangDetail.jsp
	response.sendRedirect("myPage.jsp");
%>   
</body>
</html>