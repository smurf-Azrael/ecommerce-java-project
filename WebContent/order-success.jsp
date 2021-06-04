<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Order Completed !</title>

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
		<div class="container">
			<nav aria-label="breadcrumb" class="breadcrumb-nav">
				<div class="container">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="http://localhost:8080/KitchenStore/"><i
								class="icon-home"></i></a></li>
						<li class="breadcrumb-item active" aria-current="page">Order Completed</li>
					</ol>
				</div>
				<!-- End .container -->
			</nav>
		</div>
		<div class="container mb-5 pb-5" style="margin-top:-3%;">
			
			<div class="">
				<div class="text-center d-flex align-items-center justify-content-center">
					<img class="img-flud" src="images/order-success.jpg" width="300" height="200" />
				</div>
				<div class="text-center">
					<h1><i class="fas fa-check-circle text-success"></i> Your Order is completed ! </h1>
					<p class="h2">Thanks for order</p><a href="Orders" class="btn btn-sm btn-outline-dark text-capitalize" style="font-size:1.5rem;">My Orders</a>
					
				</div>
			</div>
			<!-- End .row -->
		</div>
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