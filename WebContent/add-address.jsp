<%@page import="com.kitchenstore.bean.Address"%>
<%@page import="com.kitchenstore.bean.City"%>
<%@page import="com.kitchenstore.bean.Area"%>
<%@page import="java.util.List"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Manage Addresses</title>

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
<link rel="stylesheet" href="assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css">
<style type="text/css">
::placeholder { 
  color: #17202A !important;
  opacity: 0.7 !important; 
  font-size:14px !important;
}
</style>


</head>
<body>

	<!-- Header File -->
	<%@include file="header.jsp"%>
	<% 	List<City> cityList= (List) request.getAttribute("cityList"); 
		List<Area> areaList= (List) request.getAttribute("areaList");
		Address address=(Address) request.getAttribute("address");
		String addedError=(String) request.getAttribute("added");	
		String addressId= (String) request.getAttribute("id");
		String fNameValue="";
		String lNameValue="";
		String contactValue="";
		String alternateValue="";
		String cityValue="";
		String areaValue="";
		String addressValue="";
		String addressTypeValue="";
		if(address!=null)
		{
			fNameValue=address.getfName();
			lNameValue=address.getlName();
			contactValue=address.getContactNumber();
			addressValue=addressTypeValue=address.getAddress();
			areaValue=address.getAreaName()+"  - "+address.getPincode();
			cityValue=address.getCityName();
			addressTypeValue=address.getAddressType();
			if(address.getAlternateNumber()!=null)
			{
				alternateValue=address.getAlternateNumber();
			}
		}
	%>
	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="http://localhost:8080/KitchenStore/"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item active" aria-current="page">My account</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-lg-8 order-lg-last dashboard-content" style="margin-left:5% !important;">
					<div class="">
						<a href="Address" class="text-primary font-weight-bold d-block mb-2"><i class="fas fa-arrow-left pr-2"></i>Back</a>
						<%
							if (address != null) { %>
								<h2>Edit Address</h2>
						<%
							} else {
						%>
							<h2>Add New Address</h2>
						<%
							}
						%>
						<% if(addedError!=null){ %>
						<div class="row">
							<div class="col-md-8">
								<div class="alert alert-danger alert-dismissible fade show"
									role="alert">
									<strong>Oops! Address not added.Please try again later</strong>
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							</div>
						</div>
					<% } %>
					</div>
					<div class="">
						<form action="StoreAddress" id="formSubmit" method="POST" autocomplete="off">
						<div class="row">
							<div class="col-6">
									<div class="form-group required-field">
										<label for="fName" class="font-weight-normal"
											style="font-size: 14px;">First Name</label> <input
											type="text" class="form-control rounded"
											placeholder="First Name" name="fName"
											style="font-size: 14px;" id="fName" value="<%=fNameValue %>"
											 />
										<div class="text-danger my-3" id="fNameCheck">Please
											enter First Name</div>
									</div>
								</div>
							<div class="col-6">
									<div class="form-group required-field">
										<label for="lName" class="font-weight-normal"
											style="font-size: 14px;">Last Name</label> <input type="text"
											class="form-control rounded" placeholder="Last Name"
											name="lName" id="lName" style="font-size: 14px;" value="<%=lNameValue %>" / >
										<div class="text-danger my-3" id="lNameCheck">Please
											enter Last Name</div>
									</div>
								</div>
						</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group required-field">
										<label for="contact" class="font-weight-normal"
											style="font-size: 14px;">Contact Number</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text" style="font-size: 14px;" autocomplete="off">
													+91</div>
											</div>
											<input type="text" class="form-control rounded" id="contact"
												placeholder="e.g. 9173827571" name="contactnumber"
												style="font-size: 14px;" value="<%=contactValue %>"/>
										</div>
										<div class="text-danger my-3" id="contactCheck">Please
											enter valid mobile Number</div>

									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="alternate" class="font-weight-normal"
											style="font-size: 14px;">Alternate Number (Optional)</label>
											<span class="text-primary font-weight-bold"
											style="cursor: pointer; font-size:1.4rem; margin-left:25%;" id="clearField">Clear field</span>
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text" style="font-size: 14px;">
													+91</div>
											</div>
											<input type="text" class="form-control rounded" id="alternate"
												placeholder="e.g. 9173827571" name="alternatenumber"
												style="font-size: 14px;" autocomplete="off" value="<%=alternateValue %>"/>
										</div>
										<div class="text-danger my-3" id="alternateCheck">Please
											enter valid mobile Number <br/> (if you don't want to provide alternate phone please click on Clear field)</div>

									</div>
								</div>
								<!-- End .row -->
							</div>
							<div class="form-group required-field">
								<label for="address" class="font-weight-normal"
											style="font-size: 14px;">Address</label>
								<textarea class="form-control rounded" id="address"
									rows="1" placeholder="e.g. A-31 Radhe Avenue, opp. shiv complex" style="font-size: 16px;" name="address"><%=addressValue %></textarea>
							<div class="text-danger my-3" id="addresscheck">Please enter address!</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group required-field">
										<label for="exampleFormControlSelect1"
											class="font-weight-normal" style="font-size: 14px;"> Select City</label>
										<input type="text" list="cityData" class="form-control rounded"
											placeholder="Search here.." name="city"
											style="font-size: 14px;" id="city" autocomplete="off" value="<%=cityValue %>" />
										<div class="text-danger my-3" id="citycheck">Select valid City </div>
										<datalist id="cityData">
											<%
												for (City city : cityList) {
											%>
											<option value="<%=city.getCityName() %>" data-id="<%=city.getCityId()%>">
												<%
													}
												%>
											
										</datalist>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group required-field">
										<label for="area" class="font-weight-normal"
											style="font-size: 14px;">Select Locality / Pincode </label> <input
											type="text" list="areaData" id="area" class="form-control rounded"
											placeholder="Search here.." name="area" style="font-size: 14px;"autocomplete="off" value="<%=areaValue %>"/>
										<div class="text-danger my-3" id="areacheck">Select valid Locality / pincode </div>
										<datalist id="areaData">
											<%
												for (Area area : areaList) {
											%>
											<option value="<%=area.getAreaName()%>  - <%=area.getPincode()%>" data-id="<%=area.getAreaId()%>">
												<%
													}
												%>
										</datalist>
									</div>
								</div>
							</div>
							<div class="form-group required-field">
								<label for="acc-contact" class="d-block mt-1 font-weight-normal"
									style="font-size: 14px;"> Address Type </label>
								<div class="form-check form-check-inline mr-5">
									<input class="form-check-input gender" type="radio"
										name="addtype" id="inlineRadio1" value="H" 
										<%if(addressTypeValue.equalsIgnoreCase("H"))
										{ %>
											checked
										<% } %>
										/> <label
										class="form-check-label" for="inlineRadio1"
										style="font-size: 16px; font-weight: normal;"
										>Home</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input gender" type="radio"
										name="addtype" id="inlineRadio2" value="W" 
										<%if(addressTypeValue.equalsIgnoreCase("W"))
										{ %>
											checked
										<% } %>
										/> <label
										class="form-check-label" for="inlineRadio2"
										style="font-size: 16px; font-weight: normal;">Work</label>
								</div>
								<div class="text-danger my-3" id="genderCheck">Select
									Address type</div>
							</div>

							<%
								if(address != null) {
							%>
							<input type="hidden" name="id" value="<%=addressId%>" />
							<%
								}
							%>
							<div class="form-footer">
							<button type="submit" class="btn btn-primary rounded">Save</button>
						</div>
						<!-- End .form-footer -->
					</form>
					</div>
					
				</div>
				<!-- End .col-lg-9 -->

				<aside class="sidebar col-lg-2">
					<div class="widget widget-dashboard">
						<h3 class="widget-title">My Account</h3>

						<ul class="list">
							<li><a href="MyAccount"><i
									class="fas fa-user-cog ml-2 mr-1"></i> Manage Customers</a></li>
							<li class="active"><a href="Address"><i
									class="fas fa-map-marker-alt mx-2"></i>Manage Addresses</a></li>
							<li><a href="Orders"><i class="fas fa-box mx-2"></i>Orders</a></li>
							<li><a href="Wishlist"><i class="fas fa-heart mx-2"></i>Wishlist
							</a></li>
							<li><a href="Cart"><i class="fas fa-shopping-cart mx-2"></i>Cart</a></li>
							<li><a href="Logout"><i class="fas fa-power-off mx-2"></i>Logout</a></li>
						</ul>
					</div>
					<!-- End .widget -->
				</aside>
				<!-- End .col-lg-3 -->
			</div>
		</div>
		<!-- End .row -->
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
							
							//validate Alternate Numbers 
							$('#alternateCheck').hide();
							$("#clearField").hide();
							let alternateError = true;
							$('#alternate').keyup(function() {
								validateAlternate();
							});
							$("#clearField").click(function() {
								$("#alternate").val("");
								$('#alternateCheck').hide();
				            	$("#alternate").removeClass("is-invalid");
								$("#alternate").removeClass("is-valid");
								alternateError=true;
								$(this).hide();
							});								
							
							function validateAlternate() {
								var alternate=$("#alternate").val();
								var intRegex = /^[6-9]\d{9}$/;
								if(alternate.length >0)
								{
									 $("#clearField").show();
									if(alternate.length == 10){
								                if(intRegex.test(alternate)){
								                	alternateError = true;
												  $('#alternateCheck').hide();
								            	  $("#alternate").removeClass("is-invalid");
												  $("#alternate").addClass("is-valid");
								                }
								                else {
								                	 	$('#alternateCheck').show();
									            	  	$("#alternate").removeClass("is-valid");
													  	$("#alternate").addClass("is-invalid");
													  	alternateError = false;
								         
								                }
									} else {
						            	  $('#alternateCheck').show();
						            	  $("#alternate").removeClass("is-valid");
										  $("#alternate").addClass("is-invalid");
										  alternateError = false;
						            }
								}
							}
							
							// Validate Address Type
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
							
							// Validate Address
							$('#addresscheck').hide();
							let addressError = true;
							$("#address").blur(function(){
								validateAddress();
							});
							
							function validateAddress() {
								let addressValue = $('#address').val();
								if (addressValue.length == '') {	
									addressError = false;
									$('#addresscheck').show();
									$("#address").removeClass("is-valid");
									$("#address").addClass("is-invalid");
								} else {
									$('#addresscheck').hide();
									$("#address").removeClass("is-invalid");
									$("#address").addClass("is-valid");
									addressError = true;
								}
							}
							
							//validate City
							let cityError=true;
							$('#citycheck').hide();
							$("#city").blur(function(){
								validateCity();
							});
							function validateCity()
							{
								var val = $("#city").val();

								var obj = $("#cityData").find("option[value='" + val + "']");

								if(obj != null && obj.length > 0){
									cityError=true;
									$('#citycheck').hide();
									$("#city").removeClass("is-invalid");
									$("#city").addClass("is-valid");
								} else {
									cityError=false;
									$('#citycheck').show();
									$("#city").removeClass("is-valid");
									$("#city").addClass("is-invalid");
								}
							}
							
							//validate Area
							let areaError=true;
							$('#areacheck').hide();
							$("#area").blur(function(){
								validateArea();
							});
							function validateArea()
							{
								var val = $("#area").val();

								var obj = $("#areaData").find("option[value='" + val + "']");

								if(obj != null && obj.length > 0){
									areaError=true;
									$('#areacheck').hide();
									$("#area").removeClass("is-invalid");
									$("#area").addClass("is-valid");
								} else {
									areaError=false;
									$('#areacheck').show();
									$("#area").removeClass("is-valid");
									$("#area").addClass("is-invalid");
								}
							}
							// Submitt button 
							$("#formSubmit").submit(
									function(e) {
										validateFname();
										validateLname();
										validateAlternate();
										validateContact();
										validateGender();	
										validateAddress();
										validateCity();
										validateArea();
										if ((fnameError == false)
												|| (lnameError == false)
												|| (alternateError == false) || (contactError == false) || (genderError == false) || (addressError == false) || (cityError=false) || (areaError==false)) {
											return false;

										} else {
											var cityId = $("#cityData option[value='" + $('#city').val() + "']").attr('data-id');
											$("#city").val(cityId);
											var areaId=$("#areaData option[value='" + $('#area').val() + "']").attr('data-id');
											$("#area").val(areaId);
											return true;
										}

									});
							
						});
	</script>
	
</body>
</html>