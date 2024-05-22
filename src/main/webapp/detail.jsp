<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="network.shop.common.ShopVO" %>
<%@ page import="network.shop.common.ShopDAO" %>
<%@ include file="./ssi.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style type="text/css">
    	#bt_save{

   		}
   		
   		.like_heart_btn{
   			margin-top: 30px;
   		}
   		
   		.like_heart_btn img{
   			margin-right: 20px;
   		}
    </style>
</head>

<body>
	<%
	String name = (String)session.getAttribute("shop");
	int data = Integer.parseInt(request.getParameter("idx"));

	ShopDAO dao = new ShopDAO();
	dao.shopHit(data); //조회수처리
	//dao.shopLikes(data);
	ShopVO vo = dao.shopDetail(data); //한건상세처리 
	C_code = vo.getCode();
	
	String hrt = "";
	if(vo.getLikes()==0){hrt="img/blank_heart.png";}
	else{hrt="img/heart.png";}
	%>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark" href="faq.jsp">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Help</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Support</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="index.jsp" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">C&K</span>Mall</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form action="shop.jsp">
                    <div class="input-group">
                        <input type="text" name="keyword" id="keyword" class="form-control" value="<%=sval%>" placeholder="검색어를 입력해주세요">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <a href="#" onclick="shopSearch()">
                                	<i class="fa fa-search"></i>
                                </a>
                            </span>
                        </div>
                    </div>  
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">
                <a href="jjimList.jsp" class="btn border">
                    <i class="fas fa-heart text-primary"></i>
                    <span class="badge"><%=dao.getLikesCnt()%></span>
                </a>
                <a href="cart.jsp" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge"><%=dao.cartCount(name)%></span>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 205px">
                        <a href="" class="nav-item nav-link">Grocery</a>
                        <a href="" class="nav-item nav-link">Fruit</a>
                        <a href="" class="nav-item nav-link">Toy</a>
                        <a href="" class="nav-item nav-link">Apparel</a>
                        <a href="" class="nav-item nav-link">Cosmetic</a>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">C&K</span>Mall</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link">Home</a>
                            <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                            <a href="cart.jsp" class="nav-item nav-link">Shopping cart</a>
                            <a href="myPage.jsp" class="nav-item nav-link">My page</a>
                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                            <a href="faq.jsp" class="nav-item nav-link">FAQs</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                        	<%
                        	if(name==null){
                        		%>
                        		<a href="login.jsp?from=shop.jsp" class="nav-item nav-link">Login</a>
                        		<a href="signUp.jsp" class="nav-item nav-link">Register</a>
                        		<%	
                        	}else{
                        		%>
                        		<a href="myPage.jsp" class="nav-item nav-link"><%=name%></a>
                        		<a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        		<%
                        	}
                        	%>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->

    <!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="<%=vo.getImage()%>" alt="Image" id="productImage_<%= vo.getCode()%>">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold"><%=vo.getName()%></h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(<%=dao.shopReviewCnt(C_code)%> Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4"><fmt:formatNumber value="<%=vo.getPrice()%>" pattern="#,###"/>원</h3>
                <p class="mb-4"><%=vo.getContent()%></p>
                <div style="margin: 100px;">
                </div>
                <p class="mb-4">배송비 : 3,000원 (50,000원 이상 구매 시 <span style="color: blue; font-weight: bold">무료배송</span>)</p>
                <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-minus" >
                            <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input type="text" id="product_cnt" class="form-control bg-secondary text-center" value="1">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-plus">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <button class="btn btn-primary px-3" onclick="addCart()"><i class="fa fa-shopping-cart mr-1"></i> 장바구니 추가</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-primary px-3" onclick="payment()"><i class="fa-solid fa-credit-card"></i> 결제하기</button>
                </div>
                <div class="d-flex pt-2">
                    <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
                <div class="like_heart_btn">
                	<img alt="" src="img/Like.png" width="40px">
                	<img alt="" src="<%=hrt%>" width="40px">
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (<%=dao.shopReviewCnt(C_code)%>)</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Product Description</h4>
                        <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                        <p>Dolore magna est eirmod sanctus dolor, amet diam et eirmod et ipsum. Amet dolore tempor consetetur sed lorem dolor sit lorem tempor. Gubergren amet amet labore sadipscing clita clita diam clita. Sea amet et sed ipsum lorem elitr et, amet et labore voluptua sit rebum. Ea erat sed et diam takimata sed justo. Magna takimata justo et amet magna et.</p>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">Additional Information</h4>
                        <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                  </ul> 
                            </div>
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                  </ul> 
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                        	<div class="col-md-6">
                                <h4 class="mb-4"><%=dao.shopReviewCnt(C_code)%> review for "<%=vo.getName()%>"</h4>
                        	<%
							String a = "select rownum rn, p.code, r.num, r.writer, r.content, r.likes from c_product p ";
							String b = " inner join c_productreply r ";
							String z = " on p.code = r.code ";
							String c = " and r.code = " + C_code;
							msg = a+b+z+c;
							ST = CN.createStatement();
							RS = ST.executeQuery(msg);
							while(RS.next()==true){
								CR_rn = RS.getInt("rn"); //댓글의 행번호
								CR_num = RS.getInt("num"); //삭제 및 수정을 위한 필드
								CR_writer = RS.getString("writer"); //댓글 저자
								CR_content = RS.getString("content"); //댓글 내용
								CR_likes = RS.getInt("likes"); //댓글 좋아요
							%>
                                <div class="media mb-4">
                                    <!--<img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">-->
                                    <div class="media-body">
                                        <h6><%=CR_writer%><small> - <i>날짜</i></small></h6>
                                        <p><%=CR_content%></p>
                                        <a href="javascript:" onclick="re_edit('<%=CR_num %>','<%=CR_writer %>','<%=CR_content %>','<%=CR_likes %>')">수정</a>
										<a href="ReviewDeleteSave.jsp?ridx=<%=C_code%>&rnum=<%=CR_num%>" onclick="return loginCheck()">삭제</a>
                                    </div>
                                </div>
                            <%
							}//while end
                            %>
                            </div>
                            <div class="col-md-6">
                                <h4 class="mb-4">리뷰 등록</h4>
                                <form name="review_form" action="ReviewInsertSave.jsp">
                                    <div class="form-group">
                                        <label for="message">내용 *</label>
                                        <textarea id="message" cols="30" rows="5" class="form-control" name="content" style="resize: none;"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">이름 *</label>
                                        <input type="text" class="form-control" id="name" name="writer" value="<%if(name==null||name==""){out.print("");}else{out.print(name);}%>" readonly>
                                    </div>
                                    <input type="text" name="likes" value="0" size="30" style="display: none;" readonly>
                                    <div class="form-group mb-0">
                                        <input type="button" id="bt_save" name="bt_save" onclick="re_save()" value="등록" class="btn btn-primary px-3">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->


    <!-- Products Start -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="img/cof.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">맥심 아메리카노</h6>
                            <div class="d-flex justify-content-center">
                                <h6>18,100원</h6><h6 class="text-muted ml-2"><del>23,100원</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="img/chi.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">청정원 허니간장치킨</h6>
                            <div class="d-flex justify-content-center">
                                <h6>14,800원</h6><h6 class="text-muted ml-2"><del>19,800원</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="img/10.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">호박고구마</h6>
                            <div class="d-flex justify-content-center">
                                <h6>12,800원</h6><h6 class="text-muted ml-2"><del>17,800원</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="img/cow.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">농협안심한우 1등급</h6>
                            <div class="d-flex justify-content-center">
                                <h6>11,000원</h6><h6 class="text-muted ml-2"><del>16,000원</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>

                    
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->


    <!-- Footer Start -->
    
    <div class="container-fluid bg-secondary text-dark mt-5 pt-5 " >
        <div class="row px-xl-5 pt-5" >
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="#" class="text-decoration-none">
                    <h1 class="mb-4 display-5 font-weight-semi-bold" >Made By</h1>
                </a>                
                <p class="mb-0"><i class="fas fa-user" style="margin-right: 5px;"></i>김종민</p>
                <p class="mb-0"><i class="fas fa-user" style="margin-right: 5px;"></i>김영우</p>
                <p class="mb-0"><i class="fas fa-user" style="margin-right: 5px;"></i>박성준</p>
                <p class="mb-0"><i class="fas fa-user" style="margin-right: 5px;"></i>양정윤</p>
                <p class="mb-0"><i class="fas fa-user" style="margin-right: 5px;"></i>한다솔</p>
            </div>
            <div class="col-md-4 mb-5">
	                <h5 class="font-weight-bold text-dark mb-4">Browse by Category</h5>
	                <div class="d-flex flex-column justify-content-start">
	                    <a class="text-dark mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
	                    <a class="text-dark mb-2" href="shop.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
	                    <a class="text-dark mb-2" href="detail.jsp"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
	                    <a class="text-dark mb-2" href="cart.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
	                    <a class="text-dark mb-2" href="checkout.jsp"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
	                </div> 
            </div>
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <h5 class="font-weight-bold text-dark mb-4">Information</h5>               
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>570 Songpa-gu, Seoul, Korea</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>C&K@ckmall.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
            </div>            
         </div>

        
        <div class="row border-top border-light mx-xl-5 py-4 ">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-dark">
                    &copy; <a class="text-dark font-weight-semi-bold" href="#">C&K Mall</a>. All Rights Reserved. Designed
                    by
                    <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">C&K</a>
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
   </div>
    
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="https://kit.fontawesome.com/3a115195d8.js" crossorigin="anonymous"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/shop.js"></script>
    
    <script type="text/javascript">
	    var liked = <%= (vo.getLikes() == 1) %>; // 초기 likes 상태를 설정
	
	    //이미지를 더블클릭할 때 실행될 함수
	    document.getElementById('productImage_<%= vo.getCode()%>').addEventListener('dblclick', function() {
	        liked = !liked; //현재 상태를 반전시킵니다.
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "updateLikes.jsp", true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	        xhr.onreadystatechange = function() {
	            if (xhr.readyState === 4 && xhr.status === 200) {
	                //서버로부터 받은 likes 상태 값을 출력하여 확인
	                alert("찜 결과가 업데이트되었습니다.\n새로고침 후 찜 여부를 확인해주세요." + xhr.responseText); // 업데이트 결과 메시지를 표시
	            }
	        };
	        //likes 상태를 서버로 전송
	        var requestData = "idx=<%= vo.getCode()%>&liked=" + liked;
	        xhr.send(requestData);
	    });
	    
	    function heartdb(likes, data) {
			alert("dbclick 실행" + likes);
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "updateLikes.jsp", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					alert(xhr.responseText); // 업데이트 결과 메시지를 표시
					// 좋아요를 업데이트한 후에 UI를 변경하거나 추가 작업을 수행할 수 있음
				}
			};
			xhr.send("idx=" + data);
		}//end
		
		function addCart() {
			var cnt = document.getElementById("product_cnt").value;
			<%
			if(name==null){
				%>
				alert("상품을 담으려면 로그인을 해주세요.");
				location.href="login.jsp?from=detail.jsp?idx=<%=data%>";
				<%
			}else{
	    		%>
	    		location.href="cartInsertSave.jsp?idx=<%=C_code %>&cnt="+cnt;
			<%}%>
		}//end
		
		function payment() {
			<%
			if(name==null){
			%>
			 alert('로그인 후에 결제해주세요.');
			 location.href="login.jsp?from=detail.jsp?idx=<%=data%>";
			 return;
			<%
			}
			%>
			var cnt = document.getElementById("product_cnt").value;
			var price = <%= vo.getPrice()%>;
			if(cnt*price>50000) {
				price = cnt*price;
			}
			else
			{
			    price = cnt*price+3000;	
			}
			// 팝업을 띄울 페이지 URL
		    var popupURL = "payment.jsp?price=" + price;
			// 팝업 창의 속성
			var popupProperties = "width=550,height=750,scrollbars=yes";
			// 팝업 열기
			window.open(popupURL, "Popup", popupProperties);
		}
		
		var gnum; //전역변수
		var gflag = false;
		
		function re_edit(num, writer, content, likes){ //댓글수정
			review_form.bt_save.value = "수정";
			review_form.writer.value = writer;
			review_form.content.value = content;
			review_form.likes.value = likes;
			gnum = num;
		}//end
		
		function re_save(){
			var bt = review_form.bt_save.value;
			var writer = "<%=name%>";
			var content = review_form.content.value;
			var likes = review_form.likes.value;
			
		  	//로그인 여부 확인
			if("<%=name%>"==null){
				alert("로그인 후에 댓글을 달 수 있습니다.");
				location.href="login.jsp?from=detail.jsp?idx=<%=data%>";
		        return;
			}
		  	
			//댓글 비어있는지 확인
		    if(content.trim() === "") {
		        alert("댓글 내용이 비어있습니다.");
		        return;
		    }
			
			if(bt=="등록"){
				var msg="ReviewInsertSave.jsp?writer="+writer+"&content="+content+"&likes"+likes+"&code="+<%=C_code%>;
				document.review_form.action=msg;
				document.review_form.method="post";
				document.review_form.submit();
			}else if(bt=="수정"){
				review_form.bt_save.value="등록"
				var msg="ReviewUpdateSave.jsp?num="+gnum+"&writer="+writer+"&content="+content+"&likes"+likes+"&code="+<%=C_code%>;
				document.review_form.action=msg;
				document.review_form.method="post";
				document.review_form.submit();
			}
		}//end
		
		function loginCheck() {
			if(<%=name%>==null){
				alert("로그인 후에 수정/삭제를 할 수 있습니다.");
				location.href="login.jsp?from=detail.jsp?idx=<%=data%>";
		        return false;
			}else{
				return true;
			}
		}
	</script>
</body>

</html>