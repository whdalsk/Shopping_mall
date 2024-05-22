<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>
<%@ page import="network.shop.common.ShopVO" %>
<%@ page import="network.shop.common.ShopDAO" %>
<%
String name = (String)session.getAttribute("shop");

ShopDAO dao = new ShopDAO();
ShopVO vo =  dao.shopmemberupdate(name); //한건상세처리 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
        .mypic {
            width: 100%;
            height: 300px;

            background-image: linear-gradient(0deg,
                    rgba(0, 0, 0, 0.5),
                    rgba(0, 0, 0, 0.5)),
                url("https://mblogthumb-phinf.pstatic.net/MjAyMTA4MDNfNTkg/MDAxNjI3OTczMDIzNDg4._i6YXj9ap-3C_c0JrciGZSxesNb67DZQxkW0xRXEFiEg.O1gjXgMLIHM-6btALHjDEFkzW8KkxvNABmT5DrsGvb8g.PNG.shine4436/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-08-03_%EC%98%A4%ED%9B%84_3.43.41.png?type=w800");
            background-position: center 30%;
            background-size: cover;

            color: white;

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .mypost {
            width: 95%;
            max-width: 500px;
            margin: 20px auto 20px auto;

            box-shadow: 0px 0px 3px 0px black;
            padding: 20px;
        }

        .mypost>button {
            margin-top: 15px;
        }

        .mycards {
            margin: 20px auto 0px auto;
            width: 95%;
            max-width: 1200px;
        }

        .mycards>.card {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap');

        body {
            background-color: white;
        }

        details {
            background-color: wheat;
            color: black;
            font-size: 20px;
        }

        summary {
            padding: .5em 1.3rem;
            list-style: none;
            display: flex;
            justify-content: space-between;
            transition: height 1s ease;
        }

        summary::-webkit-details-marker {
            display: none;
        }

        summary:after {
            content: "\002B";
        }

        details[open] summary {
            border-bottom: 1px solid #aaa;
            margin-bottom: .5em;
        }

        details[open] summary:after {
            content: "\00D7";
        }

        details[open] div {
            padding: .5em 1em;
        }

        #Faq {
            text-align: center;
        }
</style>
</head>

<body>
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
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
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
                            <a href="faq.jsp" class="nav-item nav-link active">FAQs</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                           <%
                        	if(name==null){
                        		%>
                        		<a href="login.jsp?from=index.jsp" class="nav-item nav-link">Login</a>
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
            <h1 class="font-weight-semi-bold text-uppercase mb-3">FAQ</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">FAQ</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Likes List Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">FAQ</span></h2>
        </div>
        <div id="Faq">
           <%
		    PST = CN.prepareStatement("SELECT * FROM faq");
		    RS=PST.executeQuery();              
		    while(RS.next()!=false){ 
		    %>
		        <div class="container">
		            <details>
		                <summary class="title"><%= RS.getString("question") %></summary>
		                <p class="detail"><%= RS.getString("detail") %></p>
		            </details>
		        </div>
		    <%} %> 
	    </div>
	    <div style="margin: 300px;"></div>
            
	</div>
    <!-- Likes List End -->


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

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/shop.js"></script>
</body>

</html>