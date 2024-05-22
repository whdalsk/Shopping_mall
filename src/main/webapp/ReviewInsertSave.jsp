<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> ReviewInsertSave.jsp </title>
</head>
<body>
  <h2> ReviewInsertSave.jsp  </h2>
 
<%
	//ReviewInsertSave.jsp 단독실행금지 
 	CR_writer = request.getParameter("writer");
	CR_content = request.getParameter("content");
	CR_likes = Integer.parseInt(request.getParameter("likes"));
	CR_code = Integer.parseInt(request.getParameter("code"));
	
	System.out.println("댓글넘어온 저자 = " + CR_writer);
	System.out.println("댓글넘어온 내용 = " + CR_content);
	System.out.println("댓글넘어온 좋아요 = " + CR_likes);
	System.out.println("댓글넘어온 코드 = " + CR_code);
	
	//c_productreply(num,writer,content,likes,code)구조
	msg = "insert into c_productreply values(c_product_seq.nextval, ?, ?, 0, ?)";
	PST = CN.prepareStatement(msg); 
	 PST.setString(1, CR_writer);
	 PST.setString(2, CR_content);
	 PST.setInt(3, CR_code);
	 
	int OK = PST.executeUpdate() ; //댓글저장처리 
	if(OK>0){System.out.println("PST명령어 c_productreply 댓글테이블 저장 성공\n ") ; }
	else{System.out.println("PST명령어 c_productreply 댓글테이블 저장 실패\n ") ; }
	
	//저장성공후 문서이동은Detail.jsp
	response.sendRedirect("detail.jsp?idx="+CR_code);
%>   

<p style="margin-bottom:70px"></p>

</body>
</html>