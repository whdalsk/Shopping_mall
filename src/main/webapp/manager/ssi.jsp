<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.StandardCopyOption" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.io.*, java.nio.file.*, javax.servlet.annotation.*, javax.servlet.http.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <%!
    //ssi.jsp = server side include
    Connection CN; //CN필드 DB서버정보, 명령어생성할때 참조
    Statement ST; //ST=CN.createStateme()명령어생성
    PreparedStatement PST; //PST=CN.prePareStatement("쿼리문")    
    ResultSet RS; //RS=ST.executeQuery("select~"); 조회한결과를 RS기억
    
    int Grn; //행번호
    int Gcode, Gpay ; 
    String Gname, Gtitle ;
    java.util.Date Gwdate ; 
    int Ghit ;
    String Gemail ;
    int Gtotal=0, Stotal; //전체데이터갯수, 조회데이터갯수
    int GGtotal = 0;
	
	//로그인 변수
	String C_id, C_pw;
	
	//상품목록 변수
	int C_code;
	String C_name;
	String C_content;
	String C_image;
	Date C_wdate;
	int C_hit, C_likes;
	int C_price; //상품 가격
	
	//db 명령어 입력
	String msg;
	
	//페이징 변수
	String pnum="1";
	int pageNUM, pagecount; //선택한 페이지 숫자, 전체 페이지 수
	int start, end; //현재 페이지 데이터 시작 번호, 끝 번호
	int startpage, endpage; //페이지 번호 시작, 끝
	int temp;
	
	String sqry; //검색 필드, 검색 입력값 조건쿼리절 입력
	String skey="name", sval=""; //검색 필드, 검색 입력값
	String returnpage; //검색 필드, 검색 입력값 전달 명령어 입력
	
	//상품 리뷰 변수
	int CR_code; //리뷰 코드
	String CR_data;
	String CR_writer; //리뷰 저자
	String CR_content; //리뷰 내용
	int CR_num, CR_rn; //시퀀스 번호, 행 번호
	int CR_cnt; //리뷰 개수
	int CR_likes; //리뷰 추천 수
	String reviewNum; //리뷰 개수 출력
	
	//장바구니 변수
	int CCtotal; //장바구니 총 개수
	int Ctotal; //선택한 장바구니 상품 개수
	int totalPrice=0; //장바구니 상품 총 가격
	int shipping=3000; //배송비
	int StotalPrice=0; //배송비 포함 가격
	
	String name;
	String pass;
	String tel;
	String email;
	String zipcode;
	String juso1;
	String juso2;
	%>
	
	<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		CN = DriverManager.getConnection(url,"system","1234");
	}catch(Exception e) {
		System.out.println("db 연결실패 이유 : "+e);
	}
	%>
	
</body>
</html>