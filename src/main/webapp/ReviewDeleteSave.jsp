<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> ReviewDeleteSave.jsp </title>
</head>
<body>
	<h2> ReviewDeleteSave.jsp </h2>
	
<%
	int ridx = Integer.parseInt(request.getParameter("ridx"));	
	int rnum = Integer.parseInt(request.getParameter("rnum"));	

	System.out.println("댓글삭제 ridx = " + ridx );
	System.out.println("댓글삭제 rnum = " + rnum );
	
	//삭제
	msg = "delete from c_productreply where num = ?";
	PST = CN.prepareStatement(msg);
	 PST.setInt(1, rnum);
	 
	int OK = PST.executeUpdate(); 
	if(OK>0){out.println("PST명령어 review 댓글삭제 성공\n");}
	else{out.println("PST명령어 review 댓글삭제 실패\n");}
	
	response.sendRedirect("detail.jsp?idx="+ridx);
%>		
</body>
</html>