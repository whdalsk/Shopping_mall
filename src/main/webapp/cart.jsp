<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="network.shop.common.CartVO" %>
<%@ page import="network.shop.common.ShopDAO" %>
<%@page import="java.util.ArrayList"%>
<%@ include file="./ssi.jsp" %>
<%
 int i=0;
 String product_name="";
%>
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
</head>

<body>
	<%
	String name = (String)session.getAttribute("shop"); //로그인 세션 받아옴
	ShopDAO dao = new ShopDAO();
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
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">C&K</span>Mall</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link">Home</a>
                            <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                            <a href="cart.jsp" class="nav-item nav-link active">Shopping cart</a>
                            <a href="myPage.jsp" class="nav-item nav-link">My page</a>
                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                            <a href="faq.jsp" class="nav-item nav-link">FAQs</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                            <%
                        	if(name==null){
                        		%>
                        		<a href="login.jsp?from=cart.jsp" class="nav-item nav-link">Login</a>
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
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    
                    <!-- 장바구니 상품 목록 -->
                    <tbody class="align-middle">
                    <%
                    try{
                    	ArrayList<CartVO> slist = dao.cartSelect(name);
                    	totalPrice = 0;
                    	for(i=0; i<slist.size(); i++){
                    		CartVO vo = slist.get(i);
                    		totalPrice += vo.getPrice()*vo.getCnt();
                    		%>
                    		<tr>
	                            <td class="align-middle"><a href="detail.jsp?idx=<%=vo.getProduct_num()%>">
	                            	<img src="<%=vo.getImage()%>" alt="" style="width: 50px;"></a><a href="detail.jsp?idx=<%=vo.getProduct_num()%>"><%=vo.getName()%></a>
	                            </td>
	                            <%
	                             product_name = vo.getName();
	                            %>
	                            <td class="align-middle"><%=vo.getPrice()%>원</td>
	                            <td class="align-middle">
	                                <div class="input-group quantity mx-auto" style="width: 100px;">
	                                    <div class="input-group-btn">
	                                        <button class="btn btn-sm btn-primary btn-minus" 
	                                        onclick="location.href='cartUpdateSubSave.jsp?name=<%=name%>&code=<%=vo.getProduct_num()%>&cnt=<%=vo.getCnt()%>'">
	                                        	<i class="fa fa-minus"></i>
	                                        </button>
	                                    </div>
	                                    <input type="text" class="form-control form-control-sm bg-secondary text-center" value="<%=vo.getCnt()%>" readonly>
	                                    <div class="input-group-btn">
	                                        <button class="btn btn-sm btn-primary btn-plus" 
	                                        onclick="location.href='cartUpdateAddSave.jsp?name=<%=name%>&code=<%=vo.getProduct_num()%>'">
	                                            <i class="fa fa-plus"></i>
	                                        </button>
	                                    </div>
	                                </div>
	                            </td>
	                            <td class="align-middle"><%=vo.getPrice()*vo.getCnt()%>원</td>
	                            <td class="align-middle"><button class="btn btn-sm btn-primary"
	                            onclick="location.href='cartDeleteSave.jsp?name=<%=name%>&code=<%=vo.getProduct_num()%>'"><i class="fa fa-times"></i></button></td>
                        	</tr>
                    		<%
                    	}
                    	if(totalPrice<50000){
                    		shipping=3000;
                    	}else{
                    		shipping=0;
                    	}//if-else end
                    	StotalPrice = totalPrice+shipping;
                    }catch(Exception e){
                    	out.print("에러 이유 : "+e);
                    }//try-catch end
                    %>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <form class="mb-5" action="">
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                </form>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">총 상품 금액</h6>
                            <h6 class="font-weight-medium"><%=totalPrice%>원</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">배송비</h6>
                            <h6 class="font-weight-medium"><%=shipping%>원</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">총 결제 금액</h5>
                            <h5 class="font-weight-bold"><%=StotalPrice%>원</h5>
                        </div>
                        <button class="btn btn-block btn-primary my-3 py-3" onclick="payment()">결제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->


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

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/shop.js"></script>
    <script language="javascript">
	function payment() {
		<%
		if(name==null){
		%>
		 alert('로그인 후에 결제해주세요.');
		 location.href="login.jsp";
		<%
		}
		%>
		// 팝업을 띄울 페이지 URL
	    var popupURL = "payment.jsp?price=<%=StotalPrice%>";
		// 팝업 창의 속성
		var popupProperties = "width=550,height=750,scrollbars=yes";
		// 팝업 열기
		window.open(popupURL, "Popup", popupProperties);
	}
    </script>
</body>

</html>