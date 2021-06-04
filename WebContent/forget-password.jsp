<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Forget Password</title>

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

<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css">
</head>
<body>
	<!-- Header File -->
	<%@include file="header.jsp"%>
	<%String registered = request.getParameter("registered");%>
	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="http://localhost:8080/KitchenStore/"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item" aria-current="page"><a href="http://localhost:8080/KitchenStore/login.jsp">Login &nbsp; > &nbsp;<a></li>
					<li class="breadcrumb-item active" aria-current="page">Forget Password</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div >
						<h2 class="title">Forget Password</h2>
						<% if(registered!=null){ %>
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<strong>It looks like, this email address is not associated with an account</strong><br />You can create <a
								href="register.jsp" class="alert-link underline"><u>new account.</u></a>
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<% } %>
						<p>Please enter your email address below to receive a verification code for reset password.</p>		
					</div>
					<!-- End .heading -->

					<form action="ResetPassword" method="post" id="resetPassword">
						<input type="email" class="form-control rounded"
							placeholder="Email Address" name="email" style="font-size: 14px;"
							id="email" /> 
						<div class="text-danger my-3" id="emailCheck">Please
							enter valid email address</div>
						<div class="form-footer">
							<button type="submit" class="btn btn-primary rounded"
								id="formSubmit">Forget &nbsp; <i class="fas fa-unlock-alt"></i></button>
						</div>
				
						<!-- End .form-footer -->
					</form>
				</div>
				<!-- End .col-md-6 -->


			</div>
			<!-- End .row -->
		</div>
		<!-- End .container -->

		<div class="mb-5"></div>
		<!-- margin -->
	</main>
	<!-- End .main -->

	<!-- Footer File -->
	<%@include file="footer.jsp"%>

	<!-- Plugins JS File -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/optional/isotope.pkgd.min.js"></script>
	<script src="assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {

							// Validate email
							$('#emailCheck').hide();
							let emailError = true;
							$('#email').keyup(function() {
								validateEmail();
							});

							function validateEmail() {
								var email = $("#email").val();
								var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
								if (regex.test(email)) {
									emailError = true;
									$('#emailCheck').hide();
									$("#email").removeClass("is-invalid");
									$("#email").addClass("is-valid");
								} else {
									emailError = false;
									$('#emailCheck').show();
									$("#email").removeClass("is-valid");
									$("#email").addClass("is-invalid");
								}
							}

							

							// Submitt button 
							$("#resetPassword").submit(
									function(e) {
										validateEmail();							
										if ((emailError == false)) {
											return false;

										} else {
											return true;
										}

									});
						});
	</script>
</body>
</html>