<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="./css/Signup.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script type="text/javascript">
   function first() {
	  //document.subform.userid.focus();	
	  document.subform.btn.focus();	
   }//first( )end
</script>
</head>
<body onload="first()">
  
 <% 
   String data = request.getParameter("idx") ;  
 %>
	
  <div align="center" class=box>
	<form name="subform" action="ShopIDSave.jsp"  class=mytitle  >
	  User ID: 
	    <input type=text   name="id"  value="<%=data%>" class=myinput readonly>
	    <input type=submit name="btn"  value="확인" class="btn btn-warning btn-sm"> 
	</form>
  </div>
</body>
</html>






















