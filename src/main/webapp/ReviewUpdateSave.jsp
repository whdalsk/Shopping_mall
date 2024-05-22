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
	CR_num = Integer.parseInt(request.getParameter("num"));
	CR_writer = request.getParameter("writer");
	CR_content = request.getParameter("content");
	CR_likes = Integer.parseInt(request.getParameter("likes"));
	CR_code = Integer.parseInt(request.getParameter("code"));
	
	System.out.println("댓글수정 넘어온 num = " + CR_num);
	System.out.println("댓글수정 넘어온 저자 = " + CR_writer);
	System.out.println("댓글수정 넘어온 내용 = " + CR_content);
	System.out.println("댓글수정 넘어온 likes = " + CR_likes);
	System.out.println("댓글수정 넘어온 코드 = " + CR_code);
	
	//c_productreply(num,writer,content,likes,code)구조
	msg = "update c_productreply set writer=?, content=?, likes=0 where num = ?";
	PST = CN.prepareStatement(msg); 
	 PST.setString(1, CR_writer);
	 PST.setString(2, CR_content);
	 PST.setInt(3, CR_num);
	 
	int OK = PST.executeUpdate() ; //댓글저장처리 
	if(OK>0){System.out.println("PST명령어 c_productreply 댓글테이블 저장 성공\n ") ; }
	else{System.out.println("PST명령어 c_productreply 댓글테이블 저장 실패\n ") ; }
	
	//저장성공후 문서이동은coupangDetail.jsp
	response.sendRedirect("detail.jsp?idx="+CR_code);
%>   
</body>
</html>