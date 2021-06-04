<%@page import="com.kitchenstore.bean.Address"%>
<%@page import="com.kitchenstore.bean.Order"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="java.util.List"%>
<%@page import="com.kitchenstore.utilities.BCrypt"%>
<%@page import="com.kitchenstore.bean.User"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% Order order=(Order)request.getAttribute("orderDetails");
	List<Order> orderedProducts= (List) request.getAttribute("orderedProduct");
	Address address=(Address) request.getAttribute("address");
	String updateMsg= (String) request.getAttribute("updateMsg");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>View Orders</title>
<style>
html {
  scroll-behavior: smooth;
}

</style>


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
<link rel="stylesheet" href="assets/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/css/datatables.bootstrap4.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css">
</head>
<body>

	<!-- Header File -->
	<%@include file="header.jsp"%>

	<% 
		String isDeleted = (String) request.getAttribute("isdeleted");
	%>

	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="http://localhost:8080/KitchenStore/"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item active" aria-current="page">Admin
						Dashboard</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-lg-10 order-lg-last dashboard-content">
					<div class="ml-5">
						<%
						if (updateMsg != null) {
						if (updateMsg.equalsIgnoreCase("true")) {
					%>
						<div class="row">
							<div class="col-12">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									<strong>Delivery Status updated!</strong>
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
									<strong>Delivery Status not updated! Please try again later</strong>
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
						<div class="order-full-details p-5 text-dark"
							style="font-size: 16px; background-color: #F8F8F8 ;">
							<a class="btn btn-link text-capitalize p-3 px-4 pl-0 mr-1 text-primary rounded" style="font-size:18px;" href="OrderDetails"><i
									class="fas fa-arrow-alt-circle-left mr-2"></i>Back</a> 
							<a id="" class="btn btn-link text-capitalize p-3 px-4 pl-0 mr-1 text-primary rounded float-right" style="font-size:16px;" href="#delivery"><i
									class="fas fa-truck mr-2"></i>Delivery Status</a> 
							
							<div class="row mb-3">
								<div class="col-lg-10">
									<span class="h4 my-3 d-block text-center">Ordered items</span>
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Product Image</th>
												<th scope="col">Product Name</th>
												<th scope="col">Quantity</th>
												<th scope="col">Price</th>
											</tr>
										</thead>
										<tbody>
											<%
												int cnt=1;
												for (Order product : orderedProducts) {
											%>
											<tr>
												<td><%=cnt++ %></td>
												<td style="cursor: pointer;"><img src="data:image/png/jpeg/jpg;base64,<%=product.getProductThumbString() %>" onclick="getSrc(this.src);" class="img-thumbnail p-image" alt="<%=product.getProductName()%>" width="100px" height="100px"></td>
												<td><%=product.getProductName() %></td>
												<td><%=product.getQty() %></td>
												<td><i class="fas fa-rupee-sign"></i> <%=product.getPrice() %></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
							<hr class="divider mt-0"/>
							<div class="row mb-2 mt-0" id="delivery">
								<div class="col-lg-2">
									<p class="font-weight-bold">Total Amount</p>
								</div>
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									<span><i class="fas fa-rupee-sign"></i> <%=order.getTotalPrice() %></span>

								</div>
							</div>
							<div class="row mb-2">
								<div class="col-lg-2">
									<p class="font-weight-bold"> Order Date </p>
								</div>
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									<p><%=order.getPlaceOrderDate() %></p>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-lg-2">
									<p class="font-weight-bold">Mode</p>
								</div>
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									<span>
										<% if(order.getPaymentMode().equals("COD")){ %>
											Case On Delivery
										<% } else { %>
											Paytm
										<% } %>
									</span>

								</div>
							</div>
							<% if(order.getPaymentMode().equals("PAYTM")){ %>
							<div class="row mb-2">
								<div class="col-lg-2">
									<p class="font-weight-bold">Transaction Id</p>
								</div>
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									<span><%=order.getTransactionId() %></span>

								</div>
							</div>
							<% } %>
							<div class="row mb-2">
								<div class="col-lg-2">
									<p class="font-weight-bold">User Name</p>
								</div>
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									<p><%=order.getfName() %> <%=order.getlName() %></p>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-lg-2">
									<p class="font-weight-bold">Email Address</p>
								</div>
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									<p><%=order.getEmail() %></p>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-lg-2">
									<p class="font-weight-bold">Address Details</p>
								</div>
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									  <span class="d-block my-2"> <% if (address.getAddressType().equalsIgnoreCase("H")) {%>
										<i class="fas fa-home mr-2"></i>Home <%} else { %> <i
										class="fas fa-briefcase mr-3"></i>Work <% } %>
									</span>
									 <span><%=address.getfName() %> <%=address.getlName() %> </span> <span style="margin-left:7%;"><%=address.getContactNumber() %>  <%=address.getAlternateNumber() %></span>
									<p><%=address.getAddress() %>, <%=address.getAreaName() %>, <%=address.getCityName() %> - <%=address.getPincode() %></p>
									
								</div>
							</div>
							<div class="row">
								<div class="col-lg-2">
									<p class="font-weight-bold">Delivery status</p>
								</div>
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									<%if(order.getDeliverStatus()==1){ %>
												<span  style="font-size:18px;"><i class="fas fa-check-circle mr-2 text-success"></i>  Delivered</span> 
											<% } else { %>
												<span style="font-size:18px;"><i class="fas fa-times-circle mr-2 text-danger"></i> Not delivered yet.</span>
											<% } %>
									<form action="OrderFullDetails" method="POST" class="needs-validation" novalidate>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="customRadioInline1"
													name="deliveryStatus" class="custom-control-input" value="1" required="required">
												<label class="custom-control-label" style="font-size:16px" for="customRadioInline1">Delivered</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="customRadioInline2"
													name="deliveryStatus" class="custom-control-input" value="0" required="required">
												<label class="custom-control-label" style="font-size:16px" for="customRadioInline2">Not Delivered</label>
											</div>
											<div class="text-danger mb-4" id="deliveryFeedback" style="font-size:14px;">Please select field.</div>
											<input type="hidden" value="<%=Encryption.encode(Long.toString(order.getOrderId())) %>" name="oid">
											<div class="form-group row">
											<div class="col-sm-10">
												<button type="submit" class="btn btn-primary">Save</button>
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End .col-lg-9 -->

				<aside class="sidebar col-lg-2">
					<div class="widget widget-dashboard">
						<h3 class="widget-title">Admin Dashboard</h3>

						<ul class="list">
							<li class=""><a href="Customers"><i
									class="fas fa-user-cog ml-2 mr-1"></i> Manage Customers</a></li>
							<li class="active"><a href="OrderDetails"><i
									class="fas fa-clipboard-check ml-2 mr-1"></i> Manage Orders</a></li>
							<li><a href="Category"><i class="fas fa-tag mx-2"></i>Manage
									Category</a></li>
							<li><a href="SubCategory"><i class="fas fa-tags mx-2"></i>Manage
									Subcategory</a></li>
							<li><a href="Products"><i class="fas fa-database mx-2"></i>Manage
									Products</a></li>
							<li class=""><a href="ProductStock"><i
									class="fas fa-layer-group mx-2"></i>Product Stock</a></li>
							<li class=""><a href="ProductGallery"><i
									class="fas fa-images mx-2"></i>Product Images</a></li>
							<li class=""><a href="ManageOffers"><i
									class="fas fa-hourglass-end mx-2"></i>Product Offers</a></li>
							<li><a href="Logout"><i class="fas fa-power-off mx-2"></i>Logout</a></li>
						</ul>
					</div>
					<!-- End .widget -->
				</aside>
				<!-- End .col-lg-3 -->


			</div>
			<!-- End .row -->
		</div>
		<!-- End .container -->

		<!-- Alert Box -->
		<!-- The Modal -->
						<div id="myModal" class="iModal">
							<span class="iClose py-1 px-3">&times;</span>
							<!-- Modal Content (The Image) -->
							<img class="iModal-content" id="img01">
						</div>
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
							<h4 style="color: #454545;">Are you sure to delete customer
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

	<!-- Page level plugin JavaScript-->
	<script src="assets/js/jquery.datatables.min.js"></script>

	<script src="assets/js/datatables.bootstrap4.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTable').DataTable();

		});
	</script>
	 <script>
	 var deliveryFeedback=document.getElementById("deliveryFeedback");
	 deliveryFeedback.classList.add("d-none");
(function() {
  'use strict';
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName('needs-validation');
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
          deliveryFeedback.classList.remove("d-none");
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
	<script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the image and insert it inside the modal - use its "alt" text as a caption
		var modalImg = document.getElementById("img01");
		function getSrc(src) {
			modal.style.display = "block";
			modalImg.src = src;
		}

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("iClose")[0];

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
	</script>
</body>
</html>