<%@page import="com.kitchenstore.bean.Category"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="com.kitchenstore.bean.Address"%>
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
	
<style>
.tooltip-inner {
    color: #fff;
    text-align: center;
    background-color: #17202A  ;
    border-radius: 0.7rem !important;
}
.tooltip.bs-tooltip-auto[x-placement^=top] .arrow::before, .tooltip.bs-tooltip-top .arrow::before {
    border-top-color: #17222E;
}
</style>
</head>
<body>

	<!-- Header File -->
	<%@include file="header.jsp"%>
	<% List<Address> addreList=(List) request.getAttribute("addrList");
	   String addMsg=(String) request.getAttribute("add");
	   String updateMsg=(String) request.getAttribute("update");
	   String deleteMsg=(String) request.getAttribute("delete");
	   
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
				<div class="col-lg-9 order-lg-last dashboard-content" style="margin-left:5% !important;">
					<div class="mt-n4">
						<h2>Manage Addresses</h2>
					</div>
						<%
						if (addMsg != null) {
						if (addMsg.equalsIgnoreCase("true")) {
					%>
					<div class="row">
						<div class="col-12">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>New Address added!</strong>
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
						<div class="col-12">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>New Address not added! Please try again later</strong>
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
						if (updateMsg != null) {
						if (updateMsg.equalsIgnoreCase("true")) {
					%>
					<div class="row">
						<div class="col-12">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Address updated!</strong>
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
						<div class="col-12">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Address not updated! Please try again later</strong>
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
						if (deleteMsg != null) {
						if (deleteMsg.equalsIgnoreCase("true")) {
					%>
					<div class="row">
						<div class="col-12">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Address deleted!</strong>
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
						<div class="col-12">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Address not deleted! Please try again later</strong>
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
					
					
					<div class="card">
						<div class="card-body font-weight-bold"
							style="margin-bottom: -8% !important;">
							<a href="AddAddress" style="text-decoration: none;"><i
								class="fas fa-plus pr-3"></i>ADD A NEW ADDRESS</a>
						</div>
					</div>
					<div class="Address">
						<% for(Address address : addreList){ %>
						<div class="card">
							<div class="card-header d-flex align-items-center" style="color:#5D6D7E;font-size:14px;">
								<%
									if (address.getAddressType().equalsIgnoreCase("H")) {
								%>
								<i class="fas fa-home mr-2"></i>Home
								<%
									} else {
								%>
								<i class="fas fa-briefcase mr-3"></i>Work
								<%
									}
								%>
								<div class="ml-auto d-flex" style="font-size: 16px;">
									<div class="mr-3">
										<a href="AddAddress?editaddress=<%=Encryption.encode("true") %>&id=<%=Encryption.encode(Long.toString(address.getAddressId())) %>" data-toggle="tooltip" data-placement="top" title="Edit Address" class="text-dark"><i class="fas fa-edit pr-2 "></i></a>
									</div>
									<div class="ml-4">
									
										<a class="text-dark" style="font-size:16px;cursor:pointer;" role="button" data-toggle="modal" data-target="#exampleModal"
													onclick="getDelId(<%=Long.toString(address.getAddressId())%>)"><i class="fas fa-trash"></i></a>
								
									</div>
								</div>
							</div>
							<div class="card-body" style="font-family: Roboto,Arial,sans-serif;">
								<h5 class="card-title">
									<%=address.getfName() %>  <%=address.getlName() %> <span class="d-inline ml-5"><%=address.getContactNumber() %></span>
								</h5>
								<p class="card-text text-dark" style="font-size:16px"><%=address.getAddress() %>
								,<%=address.getAreaName() %>, <%=address.getCityName() %> - <strong><%=address.getPincode() %></strong></p>
								<%if(address.getIsDefault()==1) {%>
									<h5 class="text-primary text-capitalize"><i class="fas fa-check-circle mx-2"></i> Default Address </h5>
								<% } else { %>
								<button class="btn btn-sm btn-light text-primary text-capitalize" onClick="makeDefault('<%=Encryption.encode(Long.toString(address.getAddressId()))%>')"><i class="fas fa-map-marker-alt mx-2"></i> Make as Default</button>
							<% } %>
							</div>
						</div>
					<% } %>
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
		<!-- Alert Box -->
		<!-- Modal -->
		<div>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="p-4 mr-3">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body text-center">
							<h4 style="color: #454545;">Are you sure to delete address
								?</h4>
						</div>
						<div class="mb-4 text-center">
							<button type="button" class="btn btn-sm btn-secondary mr-3"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-sm btn-danger">
								<a id="takeid" class="text-white">Delete</a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="modal fade" id="exampleModalCart" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div id="modalContentCart"></div>
				</div>
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
	<script type="text/javascript">
		function getDelId(id) {
			var strLink = "RemoveAddress?id="+ id;
			document.getElementById("takeid").setAttribute("href", strLink);
		}
		function makeDefault(id){
			$(document).ready(function() {
					$.ajax({url: "Address", 
					 	type:"POST",
					 	data:{
					 		"defaultId": id
					 	},
		                success: function(result) {
		                	$("#modalContentCart").html(result);
		                	$('#exampleModalCart').modal('show');
		                	setTimeout(function(){ 
		                		location.reload();
		                	}, 2000);
						},
						error: function (error) {
							$("#modalContentCart").html("<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Due to Some Problem Address not Set as Default. Please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-success float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
						}
				 	});
			});	
		}
	</script>
</body>
</html>