<%@page import="com.kitchenstore.utilities.BCrypt"%>
<%@page import="com.kitchenstore.bean.User"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>My Account</title>

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

	<% HttpSession httpSession = request.getSession(false);
	User user = (User) httpSession.getAttribute("loginBean"); 
	String currentPass=(String) request.getAttribute("currentpass"); 
	String updatePInfo=(String)request.getAttribute("updatepinfo");
	String updatePass=(String)request.getAttribute("updatepass");
	String updateEmail=(String)request.getAttribute("updateemail");
	String updateContact=(String)request.getAttribute("updatecontact");
	String passwordForgeted=(String)request.getAttribute("passwordforgeted");
	
	updatePInfo=Encryption.decode(updatePInfo);
	updatePass=Encryption.decode(updatePass);
	updateEmail=Encryption.decode(updateEmail);
	updateContact=Encryption.decode(updateContact);
	
	
	
	%>


	<!--Checked attr for gender--> 
	<%
 		String isMaleChecked = null;
 		String isFemaleChecked = null;
 		if (user.getGender() != null) {
 			if (user.getGender().equalsIgnoreCase("M")) {
 				isMaleChecked = "checked";
 			} else if (user.getGender().equalsIgnoreCase("F")) {
 				isFemaleChecked = "checked";
 			}
 		}
 	%>
	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="http://localhost:8080/KitchenStore/"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item active" aria-current="page">My Account</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-lg-9 order-lg-last dashboard-content">
					<%
						if (updatePInfo != null) {
						if (updatePInfo.equalsIgnoreCase("updated")) {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Account Details Updated!</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						} else {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Account Details not updated! Please try again
									later</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
					<%
						if (updatePass != null) {
						if (updatePass.equalsIgnoreCase("updated")) {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Password Updated!</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						} else {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Password Not updated! Please try again
									later</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
					<%
						if (passwordForgeted != null) {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Password reset successfully!</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						} 
					%>
					
					<%
						if (updateEmail != null) {
						if (updateEmail.equalsIgnoreCase("updated")) {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Email Address Updated!</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						} else {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Email Address Not updated! Please try again later</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
					<%
						if (updateContact != null) {
						if (updateContact.equalsIgnoreCase("updated")) {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Mobile Number Updated!</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						} else {
					%>
					<div class="row">
						<div class="col-md-8">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Mobile Number Not updated! Please try again later</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
					<div class="mb-2">
						<h2 class="d-inline mr-3">Personal Information</h2>
						<span class="text-primary font-weight-bold"
							style="cursor:pointer; font-size: 1.6rem;" id="pInfoEdit">Edit</span>
						<span class="text-primary font-weight-bold"
							style="cursor:pointer; font-size: 1.6rem;" id="pInfoCancel">Cancel</span>	
					</div>

					<form action="EditAccount" id="pInfoForm" method="post">
						
						<div class="row">
							<div class="col-sm-11">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group required-field">
											<label for="fame" class="font-weight-normal" style="font-size:16px;">First Name</label> <input type="text"
												class="form-control rounded pinfo" placeholder="First Name" value="<%=user.getfName() %>"
												name="fName" style="font-size: 16px;" id="fName" />
											<div class="text-danger my-3" id="fNameCheck">Please
												enter First Name</div>
										</div>
										<!-- End .form-group -->
									</div>
									<!-- End .col-md-4 -->

									<div class="col-md-4">
										<div class="form-group required-field">
											<label for="lname" class="font-weight-normal" style="font-size:16px;">Last Name</label> <input
												type="text" class="form-control rounded pinfo"
												placeholder="Last Name" name="lName" value="<%=user.getlName() %>"
												style="font-size: 16px;" id="lName" />
											<div class="text-danger my-3" id="lNameCheck">Please
												enter Last Name</div>
										</div>
										<!-- End .form-group -->
									</div>
									<!-- End .col-md-4 -->
								</div>
								<!-- End .row -->
							</div>
							<!-- End .col-sm-11 -->
						</div>
						<!-- End .row -->
						
						<label for="acc-contact" class="d-block mt-1 font-weight-normal" style="font-size: 16px;">
							Your Gender </label>
						<div class="form-check form-check-inline mr-5">
							<input class="form-check-input gender pinfoRadio" type="radio" name="gender"
								id="inlineRadio1" value="M" <%=isMaleChecked %>> <label
								class="form-check-label" for="inlineRadio1"
								style="font-size: 16px; font-weight: normal;">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input gender pinfoRadio" type="radio" name="gender"
								id="inlineRadio2" value="F" <%=isFemaleChecked %>> <label
								class="form-check-label" for="inlineRadio2"
								style="font-size: 16px; font-weight: normal;">Female</label>
						</div>
						<div class="text-danger my-3" id="genderCheck">Select gender! </div>
						<div class="form-footer">
							<button type="submit" class="btn btn-primary rounded"
								id="pInfoButton">save</button>
						</div>
					</form>

					<div class="mb-2" style="margin-top:-30px !important;">
						<h2 class="d-inline mr-3">Password</h2>
						<span class="text-primary font-weight-bold"
							style="cursor:pointer; font-size: 1.6rem;" id="passEdit">Change</span>
						<span class="text-primary font-weight-bold"
							style="cursor:pointer; font-size: 1.6rem;" id="passCancel">Cancel</span>	
					</div>
					<form action="ResetPassword" method="post" id="ForgetPassForm" style="margin-top:0px;margin-bottom:15px;">
						<input type="hidden" name="forgetpassword" value="forget">
						<a target="self" href="ResetPassword"
							onclick="document.getElementById('ForgetPassForm').submit(); return false;"
							class="forget-pass font-weight-bold"> Forget Current Password ? </a>
					</form>
					<form action="EditAccount" method="POST" id="passwordForm">
						<div id="passInfo">
							<div class="row">
								<div class="col-sm-8">
									<div class="d-flex">
										<input type="password" class="form-control passField rounded"
											placeholder="Current Password" name="" id="crntPassword"
											style="font-size: 16px;" /> <span class="passShow"><i
											class="far fa-eye togglePassword" toggle=".passField"></i></span>
									</div>
									<div class="text-danger my-3" id="crntpasscheck"></div>
									<div id="CheckCrntPassword"></div>

								</div>
							</div>
							<div class="row">
								<div class="col-sm-8">
									<div class="d-flex">
										<input type="password" class="form-control passField"
											id="password" placeholder="New Password" name="password"
											style="font-size: 16px;" /> <span class="passShow"><i
											class="far fa-eye togglePassword" toggle=".passField"></i></span>
									</div>
									<div class="text-danger mt-1 mb-2" id="passwordCheck"></div>
									<div
										class="password_base bg-light p-3 mb-2 border border-secondary border-top-0">
										<label style="font-weight: bold; width: 100%;">Password
											must contain:</label>
										<div class="row">
											<div class="col-md-6">
												<i class="fa fa-check" id="checkpass_min" aria-hidden="true"></i>
												<span class="font-0-8rem pl-2">Min 8 - Max 20
													characters </span>
											</div>
											<div class="col-md-6">
												<i class="fa fa-check" id="checkpass_special"
													aria-hidden="true"></i> <span class="font-0-8rem pl-2">Special
													characters </span>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<i class="fa fa-check" id="checkpass_digit"
													aria-hidden="true"></i> <span class="font-0-8rem pl-2">
													Alpha-Numeric </span>
											</div>
											<div class="col-md-6">
												<i class="fa fa-check" id="checkpass_upperLower"
													aria-hidden="true"></i> <span class="font-0-8rem pl-2">
													Upper-Lower case </span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-8">
									<div class="d-flex">
										<input type="password" class="form-control passField rounded"
											placeholder="New Password again" name="cfmPassword"
											id="ConfirmPassword" style="font-size: 16px;" /> <span
											class="passShow"><i class="far fa-eye togglePassword"
						></i></span>
									</div>
									<div class="text-danger my-3" id="conpasscheck">Please
										enter confirm password</div>
									<div id="CheckPasswordMatch"></div>
								</div>
							</div>
							<div class="form-footer">
								<button type="submit" class="btn btn-primary rounded">save</button>
							</div>
						</div>
					</form>
					
					<div class="mb-2">
						<h2 class="d-inline mr-3">Email Address</h2>
						<span class="text-primary font-weight-bold"
							style="cursor:pointer; font-size: 1.6rem;" id="emailEdit">Edit</span>
						<span class="text-primary font-weight-bold"
							style="cursor:pointer; font-size: 1.6rem;" id="emailCancel">Cancel</span>	
					</div>
					<div class="row">
						<div class="col-sm-8 text-dark">
							<p>
								Updating your email address doesn't
								invalidate your account.Your account remains fully
								functional.You'll continue seeing your Order history, saved
								information and personal details.
							</p>
						</div>
					</div>
					<form action="ChangeEmail" method="post" id="emailForm">
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group required-field">
									<label for="email" class="font-weight-normal" style="font-size: 16px;">Email</label> <input type="email"
										class="form-control rounded emailInfo" placeholder="Email Address"
										name="email" style="font-size: 16px;" id="email" value="<%=user.getEmail() %>" />
									<div class="text-danger my-3" id="emailCheck"></div>
								</div>
								<!-- End .form-group -->
								<div class="form-footer">
									<button type="submit" class="btn btn-primary rounded"
										id="emailButton">save</button>
								</div>
							</div>
						</div>
					</form>
					<div class="mb-2" style="margin-top:-60px !important;">
						<h2 class="d-inline mr-3">Mobile Number</h2>
						<span class="text-primary font-weight-bold"
							style="cursor:pointer; font-size: 1.6rem;" id="contactEdit">Edit</span>
						<span class="text-primary font-weight-bold"
							style="cursor:pointer; font-size: 1.6rem;" id="contactCancel">Cancel</span>	
					</div>
					
					<form action="EditAccount" method="post" id="mobileForm">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group required-field">
									<label for="contact" class="font-weight-normal"
										style="font-size: 16px;">Mobile Number</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text" style="font-size: 16px;">
												+91</div>
										</div>
										<input type="text" class="form-control" id="contact"
											placeholder="e.g. 9173827571" name="contactnumber"
											style="font-size: 16px;"
											<% if(user.getContact()!=null) { %> 
												value="<%=user.getContact()%>" <% } else { %> value="" <% } %> >	
									</div>
									<div class="text-danger my-3" id="contactCheck">Please
										enter valid mobile Number</div>
										
								</div>
							</div>
						</div>
						<!-- End .form-group -->
						<div class="form-footer">
							<button type="submit" class="btn btn-primary rounded"
								id="contactButton">save</button>
						</div>
					</form>
				</div>
				<!-- End .col-lg-9 -->

				<aside class="sidebar col-lg-3">
					<div class="widget widget-dashboard">
						<h3 class="widget-title">My Account</h3>

						<ul class="list">
							<li class="active"><a href="MyAccount"><i
									class="fas fa-user-cog ml-2 mr-1"></i> Account Settings</a></li>
							<li><a href="Address"><i
									class="fas fa-map-marker-alt mx-2"></i>Manage Addresses</a></li>
							<li><a href="Orders"><i
									class="fas fa-box mx-2"></i>Orders</a></li>
							<li><a href="Wishlist"><i
									class="fas fa-heart mx-2"></i>Wishlist </a></li>
							<li><a href="Cart"><i
									class="fas fa-shopping-cart mx-2"></i>Cart</a></li>
							<li><a href="Logout"><i
									class="fas fa-power-off mx-2"></i>Logout</a></li>
						</ul>
					</div>
					<!-- End .widget -->
				</aside>
				<!-- End .col-lg-3 -->


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
													"first name must be between 3 and 20 characters");
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
													"last name must be between 3 and 20 characters");
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

							//validate Contact Numbers 
							$('#contactCheck').hide();
							let contactError = true;
							$('#contact').keyup(function() {
								validateContact();
							});
							
							function validateContact() {
								var contact=$("#contact").val();
								var intRegex = /^[6-9]\d{9}$/;
								if(contact.length == 10){
					            	  
							                if(intRegex.test(contact)){
											  contactError = true;
											  $('#contactCheck').hide();
							            	  $("#contact").removeClass("is-invalid");
											  $("#contact").addClass("is-valid");
							                }
							                else {
							                	 	$('#contactCheck').show();
								            	  	$("#contact").removeClass("is-valid");
												  	$("#contact").addClass("is-invalid");
							                		contactError = false;
							         
							                }
								} else {
					            	  $('#contactCheck').show();
					            	  $("#contact").removeClass("is-valid");
									  $("#contact").addClass("is-invalid");
					                  contactError = false;
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
								if(email=="<%=user.getEmail() %>")
								{
									emailError = false;
									$('#emailCheck').show();
									$('#emailCheck').html("Please provide new email!");
									$("#email").removeClass("is-valid");
									$("#email").addClass("is-invalid");
								}
								else{
									var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
									if (regex.test(email)) {
											 $.ajax({url: "ajax/check-email.jsp", 
												 	type:"POST",
												 	data:{
												 		"email" : email
												 	},
					                                success: function(result) {
					                                				$("#emailCheck").html(result);
					                                				emailError=checked;
					                                				if(emailError==true){
					                                					 $('#emailCheck').hide();
					               					            	  	 $("#email").removeClass("is-invalid");
					               									  	 $("#email").addClass("is-valid");
					                                				}
					                                				else{
					                                					$('#emailCheck').show();
					              					            	  	$("#email").removeClass("is-valid");
					              									  	$("#email").addClass("is-invalid");
					                                				}
					                                			
					                                },
					                				error: function (error) {
					                					$('#emailCheck').show();
	              					            	  	$("#email").removeClass("is-valid");
	              									  	$("#email").addClass("is-invalid");
					                					$("#emailCheck").html("Please change Password after some minutes!");
					                					emailError=false;
					                				}
											 }); 
										 } else {
											emailError = false;
											$('#emailCheck').show();
											$('#emailCheck').html("Please provide valid email!");
											$("#email").removeClass("is-valid");
											$("#email").addClass("is-invalid");
										}	
								}
							}

							
							//validate Current Password
							let crntPasswordError = false;
							$('#crntPassword').blur(function() {
								validateCrntPassword();
							});
							
							function validateCrntPassword() {
								var pass=$("#crntPassword").val();
								if(pass.length == ''){
									$('#crntpasscheck').show();
					            	$("#crntPassword").removeClass("is-valid");
									$("#crntPassword").addClass("is-invalid");
									$("#crntpasscheck").html("Please enter current password!");
        							crntPasswordError=false;
								}
								else {
									 $.ajax({url: "ajax/check-current-password.jsp", 
										 	type:"POST",
										 	data:{
										 		"dbpass" : "<%=currentPass%>",
										 		"currentpass": pass
										 	},
			                                success: function(result) {
			                                				$("#crntpasscheck").html(result);
			                                				crntPasswordError=checked;
			                                				if(crntPasswordError==true){
			                                					 $('#crntpasscheck').hide();
			               					            	  	 $("#crntPassword").removeClass("is-invalid");
			               									  	 $("#crntPassword").addClass("is-valid");
			                                				}
			                                				else{
			                                					$('#crntpasscheck').show();
			              					            	  	$("#crntPassword").removeClass("is-valid");
			              									  	$("#crntPassword").addClass("is-invalid");
			                                				}
			                                			
			                				},
			                				error: function (error) {
			                					$('#crntpasscheck').show();
          					            	  	$("#crntPassword").removeClass("is-valid");
          									  	$("#crntPassword").addClass("is-invalid");
			                					$("#crntpasscheck").html("Please change Password after some minutes!");
			                					crntPasswordError=false;
			                				}
									 }); 
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
								if (password.length < 1) {
									passwordError = false;
									$(".password_base").hide();
									$("#passwordCheck").show();
									$("#passwordCheck").html("Please enter password!");

								} else if(password ==$("#crntPassword").val()){
									$(".password_base").hide();
									$("#passwordCheck").show();
									passwordError = false;
									$("#password").removeClass("is-valid");
									$("#password").addClass("is-invalid");
									$("#passwordCheck").html("Oops! it looks like you entered your current password, Please enter a new password.");
								} else {
									passwordError = true;
									$("#passwordCheck").hide();
									$(".password_base").show();
									if ((password.length < 8) || (password.length > 20)) {
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
							}

							// Validate Confirm Password 
							$('#conpasscheck').hide();
							let confirmPasswordError = true;
							$('#ConfirmPassword').keyup(function() {
								validateConfirmPasswrd();
							});
							function validateConfirmPasswrd() {
								let confirmPasswordValue = $('#ConfirmPassword')
										.val();
								let passwrdValue = $('#password').val();
								if (confirmPasswordValue == "") {
									$('#conpasscheck').show();
									confirmPasswordError = false;
									$("#ConfirmPassword").removeClass(
											"is-valid");
									$("#ConfirmPassword")
											.addClass("is-invalid");
								} else if (passwrdValue != confirmPasswordValue) {
									$('#conpasscheck').show();
									$('#conpasscheck').html(
											"Password did not match!");
									confirmPasswordError = false;
									$("#ConfirmPassword").removeClass(
											"is-valid");
									$("#ConfirmPassword")
											.addClass("is-invalid");
								} else {
									confirmPasswordError = true;
									$('#conpasscheck').hide();
									$("#ConfirmPassword").removeClass(
											"is-invalid");
									$("#ConfirmPassword").addClass("is-valid");

								}
							}
							// Validate Gender
							$('#genderCheck').hide();
							let genderError = true;
							function validateGender() {
								if($('.gender[type=radio]:checked').length == 0)
							      {
									$('#genderCheck').show();
									$(".gender").removeClass("is-valid");
									$(".gender").addClass("is-invalid");
							         genderError=false;
							      }
							      else
							      {
							          genderError=true;
							          $(".gender").removeClass("is-invalid");
									  $(".gender").addClass("is-valid");
							          $('#genderCheck').hide();
							      }      
								
							}

							// Submitt button 
							$("#pInfoForm")
									.submit(
											function(e) {
												validateFname();
												validateLname();
												validateGender();
												if ((fnameError == false)
														|| (lnameError == false) || (genderError == false))  {
													return false;

												} else {
													return true;
												}

							});
							$("#emailForm")
							.submit(
									function(e) {
										validateEmail();
										if (emailError == false)  {
											return false;

										} else {
											return true;
										}

							});
							
							$("#passwordForm").submit(
									function(e) {
										validateCrntPassword();
										validatePassword();
										validateConfirmPasswrd();									
										if ((passwordError == false) || (confirmPasswordError == false) || (crntPasswordError == false)) {
											return false;

										} else {
											return true;
										}

				      		});
							$("#mobileForm")
							.submit(
									function(e) {
										validateContact();
										if (contactError == false)  {
											return false;

										} else {
											return true;
										}

							});
							
							
							//intilize
							$("#pInfoCancel").hide();
							$("#emailCancel").hide();							
							$("#passCancel").hide();							
							$("#contactCancel").hide();							
							$("#passInfo").hide();		
							$("#ForgetPassForm").hide();	
							$(".pinfo").prop("readonly", true);
							$(".emailInfo").prop("readonly", true);
							$("#contact").prop("readonly", true);
							$(".pinfoRadio").prop("disabled", true);
							$("#pInfoButton").hide();
							$("#emailButton").hide();
							$("#contactButton").hide();
							$("#emailCancel").hide();
							
							
							$("#pInfoEdit").click(function(){
								$(".pinfo").prop("readonly", false);
								$(".pinfoRadio").prop("disabled", false);
								$("#pInfoButton").show();
								$("#pInfoEdit").hide();
								$("#pInfoCancel").show();
								
							}); 
							$("#pInfoCancel").click(function(){
								$(".pinfo").prop("readonly", true);
								$(".pinfoRadio").prop("disabled", true);
								$("#pInfoButton").hide();
								$("#pInfoCancel").hide();
								$("#pInfoEdit").show();
								
							}); 
							$("#emailEdit").click(function(){
								$(".emailInfo").prop("readonly", false);
								$("#emailButton").show();
								$("#emailEdit").hide();
								$("#emailCancel").show();
								
							}); 
							$("#emailCancel").click(function(){
								$(".emailInfo").prop("readonly", true);
								$("#emailButton").hide();
								$("#emailCancel").hide();
								$("#emailEdit").show();
								
							}); 
							$("#passEdit").click(function(){	
								$("#passInfo").show();	
								$("#ForgetPassForm").show();	
								$("#passEdit").hide();
								$("#passCancel").show();
								
							}); 
							$("#passCancel").click(function(){
								$("#passInfo").hide();	
								$("#ForgetPassForm").hide();	
								$("#passCancel").hide();
								$("#passEdit").show();
								
							}); 
							$("#contactEdit").click(function(){
								$("#contact").prop("readonly", false);
								$("#contactButton").show();
								$("#contactEdit").hide();
								$("#contactCancel").show();
								
							}); 
							$("#contactCancel").click(function(){
								$("#contact").prop("readonly", true);
								$("#contactButton").hide();
								$("#contactCancel").hide();
								$("#contactEdit").show();
								
							}); 
						});
	</script>
</body>
</html>