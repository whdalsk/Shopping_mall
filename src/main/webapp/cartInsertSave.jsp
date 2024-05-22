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
	
	String code = request.getParameter("idx");
	String product_cnt = request.getParameter("cnt");
	int cnt = 1;
	if(product_cnt==null || product_cnt==""){
		cnt = 1;
	}else{
		cnt = Integer.parseInt(product_cnt);
	}
	
	ArrayList<CartVO> list = new ArrayList<CartVO>();
	String name = (String)session.getAttribute("shop");
	
	msg = "select * from c_product where code=?";
	PST = CN.prepareStatement(msg);
	PST.setString(1, code);
	RS = PST.executeQuery();
	while(RS.next()==true){
		CartVO vo = new CartVO();
		vo.setProduct_num(RS.getInt("code"));
		vo.setMember_id(name);
		vo.setName(RS.getString("name"));
		vo.setPrice(RS.getInt("price"));
		vo.setImage(RS.getString("image"));
		vo.setCnt(cnt);
		list.add(vo);
	}
	
	msg="select count(*) cnt from c_cart where member_id=? and product_num=?";
	PST = CN.prepareStatement(msg);
	PST.setString(1, name);
	PST.setString(2, code);
	RS = PST.executeQuery();
	RS.next();
	Ctotal = RS.getInt("cnt");	

	if(Ctotal==0){
		dao.cartInsert(list);
		%>
		<script type="text/javascript">
			alert("장바구니에 상품이 담겼습니다.");
			location.href="shop.jsp";
		</script>
		<%
	}else{
		//dao.cartUpdate(name,code);
		%>
		<script type="text/javascript">
			alert("장바구니에 상품이 이미 담겨있습니다.");
			location.href="shop.jsp";
		</script>
		<%
	}
	%>
</body>
</html>