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

<title>Verify Email Address</title>

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
		//Forword Attribute
		
		String resendMessage=(String)request.getAttribute("resendmessage");
	
		// Seasion
		HttpSession httpSession = request.getSession(false);
		String email=(String)httpSession.getAttribute("changeEmail");
		String otp = (String) httpSession.getAttribute("otp");
	%>

	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="http://localhost:8080/KitchenStore/"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item active" aria-current="page">
					Change Email Address</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="container mx-auto">
			<div class="row">
				<div class="col-md-6">
					<div class="heading">
						<h2 class="title">
							Change Email Address
						</h2>
						<div class="row">
							<div class="col-8">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									<% if(resendMessage!=null){ %>
									<strong> Verification code has been resent! <br/> You have got an email at <%=email%></strong>
									<% } else { %>
									<strong>Verification code has been sent at <%=email%></strong>
									<% } %>
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							</div>
						</div>
					</div>

					<!-- End .heading -->
					<p style="margin-top: -5%;">
						<strong>Enter verification code which you got in the
							email</strong>
					</p>
					<div class="otp-form">
						<form method="post" action="ChangeEmailAddress" id="verifyForm" class="digit-group" data-group-name="digits"
							data-autosubmit="false" autocomplete="off">
							<input type="text" id="digit-1" name="digit-1"
								data-next="digit-2" /> <input type="text" id="digit-2"
								name="digit-2" data-next="digit-3" data-previous="digit-1" /> <input
								type="text" id="digit-3" name="digit-3" data-next="digit-4"
								data-previous="digit-2" /> <input type="text" id="digit-4"
								name="digit-4" data-next="digit-5" data-previous="digit-3" /> <input
								type="text" id="digit-5" name="digit-5" data-next="digit-6"
								data-previous="digit-4" /> <input type="text" id="digit-6"
								name="digit-6" data-previous="digit-5" />
							<div class="text-danger my-3" id="verifyCheck">Please
								Provide correct verification code</div>
							<div class="form-footer">
								<button type="submit" class="btn btn-primary">Verify</button>
							</div>
						</form>
					</div>
					<div class="row">	
						<div class="col-md-6 col-sm-6 col-xl-8">
							<div class="row border-bottom pb-4">
								<div class="col-6">
									<form action="ChangeEmail" method="post" id="resendForm" class="d-inline">
										 <input type="hidden" name="resend" value="resend"> 
										<a id="recendCode" target="self"><i class="fa fa-paper-plane"></i>
											&nbsp; Resend Code</a>
									</form>
								</div>
								<div class="col-6">
									<span class="d-inline" style="margin-left: 50px;" id="timer"></span>
								</div>
							</div>
						</div>
					</div>

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
	<script type="text/javascript">
	$(document).ready(function () {
		  // Validate OTP
		  $("#verifyCheck").hide();
		  let otpError = true;

		  $(".digit-group")
		    .find("input")
		    .each(function () {
		      $(this).attr("maxlength", 1);
		      $(this).on("keyup", function (e) {
		        var parent = $($(this).parent());

		        if (e.keyCode === 8 || e.keyCode === 37) {
		          var prev = parent.find("input#" + $(this).data("previous"));

		          if (prev.length) {
		            $(prev).select();
		          }
		        } else if (
		          (e.keyCode >= 48 && e.keyCode <= 57) ||
		          (e.keyCode >= 65 && e.keyCode <= 90) ||
		          (e.keyCode >= 96 && e.keyCode <= 105) ||
		          e.keyCode === 39
		        ) {
		          var next = parent.find("input#" + $(this).data("next"));

		          if (next.length) {
		            $(next).select();
		          } else {
		            if (parent.data("autosubmit")) {
		              parent.submit();
		            }
		          }
		        }
		      });
		    });
		  function validateOTP() {
			  if (
			    $("#digit-1").val() == "" ||
			    $("#digit-2").val() == "" ||
			    $("#digit-3").val() == "" ||
			    $("#digit-4").val() == "" ||
			    $("#digit-5").val() == "" ||
			    $("#digit-6").val() == ""
			  ) {
				  $("#verifyCheck").show();
			      $("#verifyCheck").html("Please Enter valid verification code");
			      otpError = false;
			  } else {
			    var OTP = $("#digit-1").val();
			    OTP += $("#digit-2").val() + $("#digit-3").val() + $("#digit-4").val() + $("#digit-5").val() + $("#digit-6").val();
			    if (OTP == <%=otp%>) {
			      otpError = true;
			      $("#verifyCheck").hide();
			    } else if (OTP == "") {
			      $("#verifyCheck").show();
			      $("#verifyCheck").html("Please Enter valid verification code");
			      otpError = false;
			    } else {
			      $("#verifyCheck").show();
			      otpError = false;
			    }
			  }
			}
		  
		  $("#digit-6").keyup(function() {
			  validateOTP();
			});
		  // Submitt button
		  $("#verifyForm").submit(function (e) {
		    validateOTP();
		    if (otpError == false) {
		      return false;
		    } else {
		      return true;
		    }
		  });
		  //Resend Code

		  let timerOn = true;

		  function timer(remaining) {
		    var m = Math.floor(remaining / 60);
		    var s = remaining % 60;

		    m = m < 10 ? "0" + m : m;
		    s = s < 10 ? "0" + s : s;
		    document.getElementById("timer").innerHTML = m + ":" + s;
		    remaining -= 1;

		    if (remaining >= 0 && timerOn) {
		      setTimeout(function () {
		        timer(remaining);
		      }, 1000);
		      return;
		    }

		    if (timerOn) {
		      // Do timeout stuff here
		      $("#recendCode").attr("onclick", "document.getElementById('resendForm').submit(); return false;");
		      $("#recendCode").attr("href", "ChanageEmail");
		    }
		  }

		  timer(120);
		});
	</script>
</body>
</html>