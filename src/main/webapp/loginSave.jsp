<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<% String recentURI = request.getParameter("from");// login에서 보낸 from으로 로그인 요청한 URI 받기 %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html> <head> 
<title> [loginList.jsp]</title>
   <style type="text/css">
	  *{font-size:14pt; font-weight:bold;  font-family: Comic Sans MS ; margin-left: 10px; }
	  a{font-size:14pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
	  a:hover{font-size:16pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
</head>
<body>
<%
   String a = request.getParameter("id");
   String b = request.getParameter("pass");
  try{
   msg="select count(*) as cnt from c_member where ID = ? and PW = ? ";
   PST=CN.prepareStatement(msg);
   		PST.setString(1, a);
   		PST.setString(2, b);
   RS=PST.executeQuery();
  }catch(Exception ex){ }
 if(RS.next()==true){ Gtotal=RS.getInt("cnt");
 }
 if(Gtotal>0){	 
	 session.setAttribute("shop", a);
 %>
 <script language=javascript>
  alert('로그인이 성공했습니다');
  location.href = '<%=recentURI%>';
 </script>
 <%
  }else{
 %>
  <script language=javascript>
   alert('로그인이 실패했습니다.');
  </script>
 <% 	
  	session.setAttribute("", a);
  	session.removeAttribute("shop");
  }
  %>
  <script>
   history.back();
  </script>
</body>
</html>







