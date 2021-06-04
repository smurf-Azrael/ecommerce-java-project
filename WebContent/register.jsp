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

<title>Create New Account</title>

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
	<!-- Already Registered Email -->
	<%
		String registeredAccount = Encryption.decode(request.getParameter("registered"));
	%>

	<!-- Header File -->
	<%@include file="header.jsp"%>

	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="http://localhost:8080/KitchenStore/"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item active" aria-current="page">Create
						Account</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="heading">
						<h2 class="title">Create An Account</h2>
						<%
							if (registeredAccount != null) {
						%>
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<strong>This email address is already associated with an
								account !</strong><br /> If this account is yours, you can <a
								href="login.jsp" class="alert-link underline"><u>Login.</u></a>
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%
							} else {
						%>
						<p>By creating an account with our store, you will be able to
							move through the checkout process faster, store multiple shipping
							addresses in your account and more.</p>
						<%
							}
						%>
					</div>
					<!-- End .heading  -->

					<form action="ActivateAccount" id="registrationForm" method="POST">
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control rounded"
									placeholder="First Name" name="fName" style="font-size: 14px;"
									id="fName" />
								<div class="text-danger my-3" id="fNameCheck">Please enter
									First Name</div>
							</div>
							<div class="col-6">
								<input type="text" class="form-control rounded"
									placeholder="Last Name" name="lName" style="font-size: 14px;"
									id="lName" />
								<div class="text-danger my-3" id="lNameCheck">Please enter
									Last Name</div>
							</div>
						</div>
						<input type="email" class="form-control rounded"
							placeholder="Email Address" name="email" style="font-size: 14px;"
							id="email" />
						<div class="text-danger my-3" id="emailCheck">Please enter
							valid email address</div>
						<div class="d-flex">
							<input type="password" class="form-control passField"
								id="password" placeholder="Password" name="password"
								style="font-size: 14px;" /> <span class="passShow"><i
								class="far fa-eye togglePassword" toggle=".passField"></i></span>
						</div>
						<div class="text-danger my-3" id="passwordCheck">Please
							enter password</div>
						<div class="password_base bg-light p-3 mb-2 border border-secondary border-top-0">
							<label style="font-weight: bold; width: 100%;">Password
								must contain:</label>
							<div class="row">
								<div class="col-md-6">
									<i class="fa fa-check" id="checkpass_min" aria-hidden="true"></i>
									<span class="font-0-8rem pl-2">Min 8 - Max 20 characters
									</span>
								</div>
								<div class="col-md-6">
									<i class="fa fa-check" id="checkpass_special"
										aria-hidden="true"></i> <span class="font-0-8rem pl-2">Special
										characters </span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<i class="fa fa-check" id="checkpass_digit" aria-hidden="true"></i>
									<span class="font-0-8rem pl-2"> Alpha-Numeric </span>
								</div>
								<div class="col-md-6">
									<i class="fa fa-check" id="checkpass_upperLower"
										aria-hidden="true"></i> <span class="font-0-8rem pl-2">
										Upper-Lower case </span>
								</div>
							</div>
						</div>
						<div class="d-flex">
							<input type="password" class="form-control passField rounded"
								placeholder="Confirm Password" name="cfmPassword"
								id="ConfirmPassword" style="font-size: 14px;" /> <span
								class="passShow"><i class="far fa-eye togglePassword"
								toggle=".passField"></i></span>
						</div>
						<div class="text-danger my-3" id="conpasscheck">Please
							enter confirm password</div>
						<div id="CheckPasswordMatch"></div>
						<div class="form-footer">
							<button type="submit" class="btn btn-primary rounded"
								id="formSubmit">Create Account</button>
							<span class="h6 mt-2">Already have account ? <a
								href="login.jsp" class="forget-pass"> &nbsp;Login</a></span>
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

							// Validate First Name 
							$('#fNameCheck').hide();
							let fnameError = true;
							$('#fName').keyup(function() {
								validateFname();
							});

							// Validate Last Name 
							$('#lNameCheck').hide();
							let lnameError = true;
							$('#lName').keyup(function() {
								validateLname();
							});

							function validateFname() {
								let fnameValue = $('#fName').val();
								if (fnameValue.length == '') {
									$('#fNameCheck').show();
									$("#fName").removeClass("is-valid");
									$("#fName").addClass("is-invalid");
									fnameError = false;
								} else if ((fnameValue.length < 3)
										|| (fnameValue.length > 20)) {
									$('#fNameCheck').show();
									$('#fNameCheck')
											.html(
													"first name must be between 3 and 20");
									$("#fName").removeClass("is-valid");
									$("#fName").addClass("is-invalid");
									fnameError = false;
								} else {
									$('#fNameCheck').hide();
									$("#fName").removeClass("is-invalid");
									$("#fName").addClass("is-valid");
									fnameError = true;
								}
							}

							function validateLname() {
								let lnameValue = $('#lName').val();
								if (lnameValue.length == '') {
									$('#lNameCheck').show();
									$("#lName").removeClass("is-valid");
									$("#lName").addClass("is-invalid");
									lnameError = false;
								} else if ((lnameValue.length < 3)
										|| (lnameValue.length > 20)) {
									$('#lNameCheck').show();
									$('#lNameCheck')
											.html(
													"last name must be between 3 and 20");
									$("#lName").removeClass("is-valid");
									$("#lName").addClass("is-invalid");
									lnameError = false;
								} else {
									$('#lNameCheck').hide();
									$("#lName").removeClass("is-invalid");
									$("#lName").addClass("is-valid");
									lnameError = true;
								}
							}

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
									$(".password_base").hide();
									$("#passwordCheck").show();
									
								}
								else{
									passwordError = true;
									$("#passwordCheck").hide();
									$(".password_base").show();	
								}
						
								if ((password.length < 8 || password.length >20)) {
									$('#checkpass_min').removeClass('fa-check')
											.addClass('fa-times');
								} else {
									$('#checkpass_min').removeClass('fa-times')
											.addClass('fa-check');
								}

								//if password contains both lower and uppercase characters
								if (password.match(/([a-z])|([A-Z])/)) {
									$('#checkpass_upperLower').removeClass(
											'fa-times').addClass('fa-check');
								} else {
									$('#checkpass_upperLower').removeClass(
											'fa-check').addClass('fa-times');
								}

								//if password contain one Digit
								if (password.match(/([0-9])/)) {
									$('#checkpass_digit').removeClass(
											'fa-times').addClass('fa-check');
								} else {
									$('#checkpass_digit').removeClass(
											'fa-check').addClass('fa-times');
								}

								//If Password contain any special character
								if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) {
									$('#checkpass_special').removeClass(
											'fa-times').addClass('fa-check');
								} else {
									$('#checkpass_special').removeClass(
											'fa-check').addClass('fa-times');
								}

								if ((password.length >= 8 && password.length <=20)
										&& password.match(/([a-z])|([A-Z])/)
										&& password.match(/([0-9])/)
										&& password
												.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) {
									passwordError = true;
									$("#password").removeClass("is-invalid");
									$("#password").addClass("is-valid");
								} else {
									passwordError = false;
									$("#password").removeClass("is-valid");
									$("#password").addClass("is-invalid");

								}
							}

							// Validate Confirm Password 
							    $('#conpasscheck').hide(); 
							    let confirmPasswordError = true; 
							    $('#ConfirmPassword').keyup(function () { 
							        validateConfirmPasswrd(); 
							    }); 
							    function validateConfirmPasswrd() { 
							        let confirmPasswordValue =  
							            $('#ConfirmPassword').val(); 
							        let passwrdValue =  
							            $('#password').val();
							        if(confirmPasswordValue==""){
							        	$('#conpasscheck').show();
							            confirmPasswordError = false;
							            $("#ConfirmPassword").removeClass("is-valid");
										$("#ConfirmPassword").addClass("is-invalid");
							        }
							        else if (passwrdValue != confirmPasswordValue) { 
							            $('#conpasscheck').show();
							            $('#conpasscheck').html("Password did not match");
							            confirmPasswordError = false; 
							            $("#ConfirmPassword").removeClass("is-valid");
										$("#ConfirmPassword").addClass("is-invalid");
							        } else { 
							        	confirmPasswordError = true; 
							            $('#conpasscheck').hide(); 
							            $("#ConfirmPassword").removeClass("is-invalid");
										$("#ConfirmPassword").addClass("is-valid");
							            
							        } 
							    }  

							// Submitt button 
							$("#registrationForm").submit(
									function(e) {
										validateFname();
										validateLname();
										validateEmail();
										validatePassword();
										validateConfirmPasswrd();									
										if ((fnameError == false)
												|| (lnameError == false)
												|| (emailError == false) || (passwordError == false) || (confirmPasswordError == false)) {
											return false;

										} else {
											return true;
										}

									});
						});
	</script>
</body>
</html>