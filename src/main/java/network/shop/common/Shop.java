package network.shop.common;

import java.util.Date;

public class Shop {
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
	int C_num;
	
	//db 명령어 입력
	String msg;
	
	//페이징 변수
	String pnum="1";
	int pageNUM, pagecount; //선택한 페이지 숫자, 전체 페이지 수
	int start, end; //현재 페이지 데이터 시작 번호, 끝 번호
	int startpage, endpage; //페이지 번호 시작, 끝
	int temp;
	
	String sqry; //검색 필드, 검색 입력값 조건쿼리절 입력
	String skey="", sval=""; //검색 필드, 검색 입력값
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
	
	int like; //좋아요

}//class Coupang END
