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

	dao.cartDelete(name, code);
	
	%>
	<script type="text/javascript">
		alert("상품이 삭제되었습니다.");
		location.href="cart.jsp";
	</script>
	
	%>
</body>
</html>