<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Log In</title>

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
	<%
		String registered = Encryption.decode(request.getParameter("registered"));
		String invalid = Encryption.decode(request.getParameter("invalid"));
		String forgetPass = Encryption.decode(request.getParameter("forgetpass"));
		String email=null;
		if(forgetPass!=null){
			HttpSession httpSession = request.getSession(false);
			email=(String)httpSession.getAttribute("email");
		}
	%>

	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="http://localhost:8080/KitchenStore/"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item active" aria-current="page">Login</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div>
						<h2 class="title">Login</h2>
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
						<% } else if (invalid!=null){ %>
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<strong>invalid Email address or Password ! </strong>
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<% } else if (forgetPass!=null){ %>
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							<strong>Reset password successfully <br/>Now you can log in with new password </strong>
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<% } %>
					</div>
					<!-- End .heading -->

					<form action="Login" method="post" id="loginForm">
						<input type="email" class="form-control rounded"
							placeholder="Email Address" name="email" style="font-size: 14px;"
							id="email" 
							<%if(email!=null){ %>
								value="<%=email %>" 
							<% } else{ %>
								value=""
							<% } %>
							/> 
						<div class="text-danger my-3" id="emailCheck">Please
							enter valid email address</div>
						<div class="d-flex">
							<input type="password" class="form-control passField"
								id="password" placeholder="Password" name="password"
								style="font-size: 14px;" /> <span class="passShow"><i
								class="far fa-eye togglePassword" toggle=".passField"></i></span>
						</div>
						<div class="text-danger my-3" id="passwordCheck">Please
							enter valid password</div>
						<div class="form-footer">
							<button type="submit" class="btn btn-primary rounded"
								id="formSubmit">Log in</button>
							<span class="h6 mt-2"><a href="forget-password.jsp"
								class="forget-pass"> &nbsp;Forget Password ?</a></span>
						</div>
						<span class="h5 d-inline">New to Kitchen Store ?</span>
						<span class="h5	d-block mt-4">
						<a
								href="register.jsp" class="btn btn-primary"> Create Account</a>
						</span>
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

							$('#password').keyup(function() {
								validatePassword();
							});
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

							// Validate Password
							$(".password_base").hide();
							$("#passwordCheck").hide();
							let passwordError = true;
							$("#password").keyup(function() {
								validatePassword();
							});
							function validatePassword() {
								var password = $("#password").val();
								if(password.length < 1){
									passwordError = false;
									$("#passwordCheck").show();
									$("#password").removeClass("is-valid");
									$("#password").addClass("is-invalid");
								}
								else{
									passwordError = true;
									$("#password").removeClass("is-invalid");
									$("#password").addClass("is-valid")
									$("#passwordCheck").hide();
									
								}
							}

							// Submitt button 
							$("#loginForm").submit(
									function(e) {
										validateEmail();
										validatePassword();								
										if ((emailError == false) || (passwordError == false)) {
											return false;

										} else {
											return true;
										}

									});
						});
	</script>
</body>
</html>