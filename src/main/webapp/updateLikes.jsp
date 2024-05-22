<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="network.shop.common.ShopDAO" %>

<%
    // AJAX 요청으로부터 이미지 코드(idx)와 좋아요 상태(liked)를 받아옵니다.
    int idx = Integer.parseInt(request.getParameter("idx"));
    boolean liked = Boolean.parseBoolean(request.getParameter("liked"));
    
    // ShopDAO 객체를 생성합니다.
    ShopDAO dao = new ShopDAO();
    // 좋아요 수를 업데이트합니다.
    dao.shopLikes(idx, liked);
%>
