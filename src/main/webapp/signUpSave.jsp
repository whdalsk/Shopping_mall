<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%@ page import="network.shop.common.ShopVO" %>
<%@ page import="network.shop.common.ShopDAO" %>


<%
	ShopDAO dao = new ShopDAO();
	
	String[] list = new String[7];

	//파라미터 받아오기
	request.setCharacterEncoding("utf-8");
	list[0] = request.getParameter("id");
	list[1] = request.getParameter("pw");
	list[2] = request.getParameter("phone");
	list[3] = request.getParameter("email");
	list[4] = request.getParameter("zipcode");
	list[5] = request.getParameter("adress1");
	list[6] = request.getParameter("adress2");
	
	int result = dao.shopSignUp(list);
	
%>   

<%
if(result>0){
	out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
	out.println("<script>location.href='login.jsp'</script>");
}else{
	out.println("<script>alert('회원가입에 실패했습니다.');</script>");
	out.println("<script>location.href='signUp.jsp'</script>");
}
%>

<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>