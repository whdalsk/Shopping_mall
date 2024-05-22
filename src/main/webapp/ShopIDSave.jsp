<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="network.shop.common.ShopDAO" %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> ShopIDSave.jsp </title>
</head>
<body>

<%
	String id = request.getParameter("id");

 	ShopDAO dao = new ShopDAO();
	Gtotal = dao.shopIdCheck(id);

 if(Gtotal>0){
%>	
  <script type="text/javascript">
    alert("아이디가 중복입니다");
    window.close();
  </script>	
  
<% }else{ %>
   <script type="text/javascript">
  	  alert("아이디가 사용가능합니다");
      window.close();
   </script>	 
<% } %>   


</body>


</html>




