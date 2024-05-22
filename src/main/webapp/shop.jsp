<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@page import="network.shop.common.ShopVO"%>
<%@page import="network.shop.common.ShopDAO"%>
<%@page import="java.util.ArrayList"%>
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
    .col-lg-4 col-md-6 col-sm-12 pb-1{
		position: relative;
		z-index: 1;
	}

	.like_btn{
		position: absolute;
		bottom: 100px;
		left: 12px;
		z-index: 2;
	}
	.love_btn{
		position: absolute;
		bottom: 100px;
		right: 12px;
		z-index: 2;
	}
	.gray{
		filter: opacity(25%);
	}
    </style>
</head>

<body>
	<%
	ShopDAO dao = new ShopDAO();
	GGtotal = dao.shopCount();

	pnum = request.getParameter("idx"); //누른 페이지 번호
	if(pnum==null || pnum==""){
		pnum="1";
	}//if end
	pageNUM = Integer.parseInt(pnum);
	
	skey = request.getParameter("keyfield"); //검색 필드값
	sval = request.getParameter("keyword"); //검색 입력값
	
	if(sval==null || sval==""){
		skey="name";
		sval="";
		sqry = " where name like '%%'";
	}else{
		sqry = " where name like '%"+sval+"%' or content like '%"+sval+"%'";
	}//if-else end
	
	Gtotal = dao.shopSearchCount(sqry);
	
	if(Gtotal%10==0){
		pagecount = Gtotal/9; //전체 페이지 수
	}else{
		pagecount = (Gtotal/9)+1;
	}//if-else end
	
	start = (pageNUM-1)*9+1; //현재 페이지 데이터 시작 행 번호 
	end = pageNUM*9; //현재 페이지 데이터 끝 행 번호
	
	temp = (pageNUM-1)%10;
	startpage = pageNUM-temp; //현재 페이지 수 시작 번호
	endpage = startpage+9; //현재 페이지 수 끝 번호

	if(endpage>pagecount){
		endpage=pagecount;
	}//if end

	String name = (String)session.getAttribute("shop");
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
                <form action="">
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
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link">Home</a>
                            <a href="shop.jsp" class="nav-item nav-link active">Shop</a>
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


    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shop</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                    <form>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="price-all">
                            <label class="custom-control-label" for="price-all">All Price</label>
                            <span class="badge border font-weight-normal"></span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-1">
                            <label class="custom-control-label" for="price-1">0 ~ 5000원</label>
                            <span class="badge border font-weight-normal">15</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-2">
                            <label class="custom-control-label" for="price-2">5000 ~ 10000원</label>
                            <span class="badge border font-weight-normal">20</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-3">
                            <label class="custom-control-label" for="price-3">10000 ~ 30000원</label>
                            <span class="badge border font-weight-normal">25</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-4">
                            <label class="custom-control-label" for="price-4">30000 ~ 60000원</label>
                            <span class="badge border font-weight-normal">30</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <input type="checkbox" class="custom-control-input" id="price-5">
                            <label class="custom-control-label" for="price-5">60000 ~ 100000원</label>
                            <span class="badge border font-weight-normal">23</span>
                        </div>
                    </form>
                </div>
                <!-- Price End -->
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <form action="">
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
                            <div class="dropdown ml-4">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                            Sort by
                                        </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <a class="dropdown-item" href="#">Latest</a>
                                    <a class="dropdown-item" href="#">Popularity</a>
                                    <a class="dropdown-item" href="#">Best Rating</a>
                                </div>
                            </div>
                        </div>
                    </div>
                     
                    <!-- 상품 목록 시작 -->
                    <%
                    try{
                    	ArrayList<ShopVO> slist = dao.shopSelect(sqry,start,end);
                    	ArrayList<Integer> confirm = dao.liked(name);
                    	for(int i=0; i<slist.size(); i++){
                    		ShopVO vo = slist.get(i);
                    		C_code = vo.getCode();
                    		boolean liked = confirm.contains(C_code);
                    		String gray = !liked ? " gray": "";
                    		%>
                    		
                    		<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
	                            <div class="card product-item border-0 mb-4">
	                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
	                                    <a href="detail.jsp?idx=<%=C_code %>"><img class="img-fluid w-100" src='<%=vo.getImage()%>' alt=""></a>
	                                </div>
	                                <div class="like_btn">
	                             		<img src="./img/Like.png" data-image-id="<%=C_code %>" class="likeImage <%=gray%>" width="10%" height="10%">
	                             	</div>
	                             	<div class="love_btn">
	                             		<%
										int likes = vo.getLikes();
										String ImageHrt = (likes == 1) ? "heart.png" : "blank_heart.png";
										%>
	                             		<img src="./img/<%= ImageHrt %>"  id="likeImage_<%= vo.getCode()%>" width="30px" height="30px">
	                             	</div>
	                                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
	                                    <h6 class="text-truncate mb-3"><%=vo.getName() %></h6>
	                                    <div class="d-flex justify-content-center">
	                                        <h6><fmt:formatNumber value="<%=vo.getPrice()%>" pattern="#,###"/>원</h6><h6 class="text-muted ml-2"><del><fmt:formatNumber value="<%=vo.getPrice()+5000%>" pattern="#,###"/>원</del></h6>
	                                    </div>
	                                </div>
	                                <div class="card-footer d-flex justify-content-between bg-light border">
	                                    <a href="detail.jsp?idx=<%=C_code %>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
	                                    <a href="cartInsertSave.jsp?idx=<%=C_code %>" onclick="return addCart()" id="cart" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
	                                </div>
	                            </div>
                        	</div>
                    	<%
                    	}
                    }catch(Exception e){
                    	out.print("에러 이유 : "+e);
                    }//try-catch end
                    %>
                    
                    <!-- 페이지 번호 -->
                    <%
                    returnpage = "&keyfield="+skey+"&keyword="+sval;
                    String previous = (startpage-1)+returnpage;
                    String next = (startpage+10)+returnpage;
                    %>
                    
                    <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center mb-3">
                          	<% 
                          	if(startpage>1){
                          		%>
                          		<li class="page-item">
	                              	<a class="page-link" href="shop.jsp?idx=<%=previous%>" aria-label="Previous">
	                                	<span aria-hidden="true">&laquo;</span>
	                                	<span class="sr-only">이전</span>
                              		</a>
                            	</li>
                          		<%
                          	}
                          	%>
                            <%
                            for(int i=startpage; i<=endpage; i++){
                            	if(i==pageNUM){
                            		%>
                            		<li class="page-item active"><a class="page-link" href="#"><%=i%></a></li>
                            		<%
                            	}else{
                            		%>
                            		<li class="page-item"><a class="page-link" href="shop.jsp?idx=<%=i%><%=returnpage%>"><%=i%></a></li>
                            		<%
                            		}
                            }
                            %>
                            <%
                            if(endpage<pagecount){
                            	%>
                            	<li class="page-item">
                              		<a class="page-link" href="shop.jsp?idx=<%=next%>" aria-label="Next">
		                                <span aria-hidden="true">&raquo;</span>
		                                <span class="sr-only">다음</span>
	                              	</a>
	                            </li>
                            	<%
                            }
                            %>
                          </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->


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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/shop.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function(){
        // 이미지 클릭 이벤트 핸들러 추가
    	$(".likeImage").click(imageClicked);
    });

    function imageClicked() {
        // 이미지의 클래스를 확인하여 클릭 여부 판단
        var isClicked = $(this).hasClass("gray"); // true
        var imageId = $(this).data("image-id");
      	
        // 클릭 여부에 따라 이미지 변경
        if (isClicked) {	        	
        	$(this).attr("src", "./img/Like.png").removeClass("gray");
            $.ajax({
                type: "POST",
                url: "./Like",
                data: { 
                	imageId: imageId,
                	Name : "<%=name%>"
                	},
                success: function(data) {
                    // 성공적으로 요청이 처리되면 좋아요 카운트를 갱신합니다.
                	
                },
                error: function() {
                    console.error("서버 오류 발생");
                }
            });
        } else {        	
        	$(this).attr("src", "./img/Like.png").addClass("gray");
            $.ajax({
                type: "POST",
                url: "./unLike",
                data: { 
                	imageId: imageId,
                	Name : "<%=name%>"
                	},
                success: function(data) {
                    // 성공적으로 요청이 처리되면 좋아요 카운트를 갱신합니다.
                	
                },
                error: function() {
                    console.error("서버 오류 발생");
                }
            });
        }
    }

    	//장바구니 추가
    	function addCart() {
    		<%
    		if(session.getAttribute("shop")==null){
				%> 
				alert("상품을 담으려면 로그인을 해주세요.");
				location.href="login.jsp?from=shop.jsp";
				return false;
				<%
    		}else{
	    		%>
				return true;
			<%}%>
		}
    	
    	
    </script>
</body>

</html>