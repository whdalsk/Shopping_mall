<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="network.shop.common.CartVO" %>
<%@ page import="network.shop.common.ShopDAO" %>
<%@page import="java.util.ArrayList"%>
<%@ include file="./ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	session.removeAttribute("shop");
	Thread.sleep(1000);
	%>
	<script type="text/javascript">
		location.href="index.jsp";
	</script>
	%>
</body>
</html>