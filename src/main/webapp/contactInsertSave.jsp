<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="network.shop.common.ShopVO" %>
<%@ page import="network.shop.common.ShopDAO" %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html> <head> 
<title></title>
</head>
<body>
	<%
	ShopDAO dao = new ShopDAO();
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");
	
	int OK = dao.contactInsert(name, email, subject, message);
	
	if(OK>0){
		%>
		<script type="text/javascript">
			alert("메세지가 보내졌습니다.");
			location.href="contact.jsp?";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("메세지 보내기가 실패했습니다.");
			location.href="contact.jsp";
		</script>
		<%
	}
	%>
   
</body>
</html>







