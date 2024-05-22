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
	ShopDAO dao = new ShopDAO();
	
	String name = request.getParameter("name");
	String code = request.getParameter("code");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	if(cnt<2){
		
	}else{
		dao.cartUpdateSub(name, code);
	}

	%>
	<script type="text/javascript">
		location.href="cart.jsp";
	</script>
	
	%>
</body>
</html>