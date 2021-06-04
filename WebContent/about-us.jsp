<%@page import="com.kitchenstore.bean.Address"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>About Us</title>

<meta name="keywords" content="Kitchen Store" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="assets/images/icons/favicon.ico">


<script type="text/javascript">
	WebFontConfig = {
		google : {
			families : [ 'Open+Sans:300,400,600,700,800',
					'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ]
		}
	};
	(function(d) {
		var wf = d.createElement('script'), s = d.scripts[0];
		wf.src = 'assets/js/webfont.js';
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link href="assets/css/datatables.bootstrap4.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css">
</head>
<body>
	<!-- Header File -->
	<%@include file="header.jsp"%>
	<main class="main">
		
		<div
			class="home-slider owl-carousel owl-theme owl-carousel-lazy show-nav-hover nav-big mb-2 text-uppercase"
			data-owl-options="{
				'loop': false
			}">
			<div class="home-slide home-slide1 banner">
				<img class="owl-lazy slide-bg" src="assets/images/lazy.png"
					data-src="images/home-slide-1.jpg" alt="slider image" />
				<div class="container" style="margin-left:1%;">
					<div class="banner-layer banner-layer-middle">
						<h2 class="text-transform-none mb-0">About Us</h2>
						<p class="text-transform-none h4 my-5">Welcome to Kitchen Store!  <br/>
				   		   A kitchen reflects your personality and style. Kitchen Store is a store to make your kitchen more beautiful with all latest appliances that minimizes your time and space. <br/>
						   We have Cookware, Crockery, Gas Stoves, Storage Containers ,Kitchen Appliances and much more that will add something extraordinary charm to your kitchen. </p>
		
						<!-- <h3 class="m-b-3">70% Off</h3>
						<h5 class="d-inline-block mb-0">
							Starting At <b
								class="coupon-sale-text ml-4 mr-1 text-white bg-secondary align-middle"><em
								class="align-text-top">199</em>99
							</b>
						</h5> -->
					</div>
					<!-- End .banner-layer -->
				</div>
			</div>
			<!-- End .home-slide -->
		</div>
		<!-- End .home-slider -->
	</main>
	<!-- End .main -->
	<div class="mb-3"></div>
	<!-- margin -->

	<!-- Footer File -->
	<%@include file="footer.jsp"%>

	<!-- Plugins JS File -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/optional/isotope.pkgd.min.js"></script>
		<script src="assets/js/plugins.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="assets/js/jquery.datatables.min.js"></script>
	<script src="assets/js/datatables.bootstrap4.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.min.js"></script>
</body>
</html>