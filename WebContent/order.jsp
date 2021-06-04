<%@page import="com.kitchenstore.bean.Order"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	List<Order> orderItems = (List) request.getAttribute("orderedItem");
	String review= (String) request.getAttribute("review");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Order | Kitchen Store</title>

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
						<li class="breadcrumb-item active" aria-current="page">Order History</li>
					</ol>
				</div>
				<!-- End .container -->
			</nav>
			<div class="container">
				<div class="row">
					<%
							if (orderItems != null && orderItems.size()>0) {
					%>
					<div class="col-lg-12">
						<h2 class="text-center">Order History</h2>
						<%
						if (review != null) {
						if (review.equalsIgnoreCase("true")) {
					%>
					<div class="row">
						<div class="col-12">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Your Review submitted!</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						} else if(review.equalsIgnoreCase("alredy submitted")){
					%>
					<div class="row">
						<div class="col-12">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Rate & review already submitted before.<br/>You can't give rate & review more than one time for particular item.  </strong>
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
								<strong>Oops! Review not submitted. Please try again later</strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						}
					}%>
						<div class="cart-table-container">
							
							<table class="table table-cart">
								<thead>
									<tr>
										<th class="product-col">Product</th>
										<th class="price-col">Price</th>
										<th class="">Ordered Date</th>
										<th class="">Mode</th>
										<th class="">Delivery Status</th>	
										<th class="">Rate & Review Product</th>	
									</tr>
								</thead>
								<tbody>
									<%for (Order order : orderItems) {%>
									<tr class="product-row">
										<td class="product-col">
											<figure class="product-image-container">
												<a
													href="Product?p=<%=order.getProductName()%>&pid=<%=Encryption.encode(Long.toString(order.getProductId()))%>"
													class="product-image"><img
													src="data:image/png/jpeg/jpg;base64,<%=order.getProductThumbString()%>"
													alt="<%=order.getProductName()%>"
													style="display: block; max-width: 200px; max-height: 200px; width: auto; height: auto;">>
												</a>
											</figure>
											<h6 class="product-title">
												<a
													href="Product?p=<%=order.getProductName()%>&pid=<%=Encryption.encode(Long.toString(order.getProductId()))%>"
													class="text-dark"><%=order.getProductName()%></a>
											</h6>
										</td>
										<td>
											<div class="price-box">
												<% if(order.getDiscountPrice()>0){ %>
													<span class="old-price"> <%=order.getPrice() %></span>
													<span class="product-price">&#8377;<%=order.getDiscountPrice()%></span>
												
												<% } else { %>
														<span class="product-price">&#8377;<%=order.getPrice()%></span>
												<% } %>
											</div>
										</td>
											<td><span class="font-weight-bold" style="font-size:14px"><%=order.getPlaceOrderDate() %></span></td>
											<td><span class="font-weight-bold" style="font-size:14px"><%=order.getPaymentMode() %></span></td>
											<td>
											<%if(order.getDeliverStatus()==1){ %>
												<span class="text-success" style="font-size:20px;"><i class="fas fa-check-circle mr-2"></i></span> Delivered
											<% } else { %>
												<span class="text-danger" style="font-size:20px;"><i class="fas fa-times-circle mr-2"></i></span> Delivered
											<% } %>
											</td>
											<%if(order.getDeliverStatus()==1){ %>
											<td><a href=""
											class="btn btn-link add-cart mr-1" role="button" data-toggle="modal" onclick="setProductId('<%=Encryption.encode(Long.toString(order.getUserId())) %>','<%=Encryption.encode(Long.toString(order.getProductId())) %>')" data-target="#reviewModal" title="Give Feedback about this product"><i
												class="fas fa-star mr-3"></i>Rate & Review</a></td>
											<% } else { %>
												<td><a href=""
											class="btn btn-link add-cart mr-1" role="button" data-toggle="modal" data-target="#notReviewModal" title="Give Feedback about this product"><i
												class="fas fa-star mr-3"></i>Rate & Review</a></td>
											<% } %>
										</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
						<!-- End .cart-table-container -->

					</div>
					<!-- End .row -->
					<% } else { %>
					<div class="col-lg-12">
						<h2 class="text-center">Oops ! You didn't purchase any product yet</h2>
						<div class="text-center">
							<a href="/KitchenStore/" class="btn btn-outline-secondary">Continue
									Shopping</a>
						</div> <!-- End .float-left -->
					</div>
					<div style="margin-bottom:25%;"></div>
				<% } %>
				</div>
				<!-- End .container -->
			</div>
		</div>
		<!-- Modal -->
			<div>
				<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog"
					aria-labelledby="deleteModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="p-4 mr-3">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="add-product-review">
											<form action="Feedback" method="POST" class="comment-form m-0 needs-validation" novalidate>
												<h3 class="review-title">Rate & Review Product </h3>

												<div class="rating-form">
													<label for="rating">Rating</label>
													<span class="rating-stars">
														<a class="star-1" href="#">1</a>
														<a class="star-2" href="#">2</a>
														<a class="star-3" href="#">3</a>
														<a class="star-4" href="#">4</a>
														<a class="star-5" href="#">5</a>
													</span>
														
														<select name="rating" id="rating" required style="display:none;">
															<option value="">Rate</option>
															<option value="5">Perfect</option>
															<option value="4">Good</option>
															<option value="3">Average</option>
															<option value="2">Not that bad</option>
															<option value="1">Very poor</option>
														</select>
												</div>
												<div class="text-danger" style="margin-top:-2%;margin-bottom:3%;" id="invalid-feedback-rate">Please give rate of product.</div>

												<div class="form-group">
													<label>Description</label>
													<textarea cols="5" rows="6" required class="form-control form-control-sm" name="des" maxlength="300"></textarea>
													<div class="invalid-feedback" style="ont-size:16px;">Please fill out this field. </div>
												</div><!-- End .form-group -->
												<input type="hidden" value="" name="uid" id="uid">
												<input type="hidden" value="" name="pid" id="pid">
												<input type="submit" class="btn btn-dark ls-n-15" value="Submit">
											</form>
										</div><!-- End .add-product-review -->
							</div>
							<div class="mb-4 text-center">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
		<div>
			<div class="modal fade" id="notReviewModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="p-4 mr-3">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body text-center"><h4 style="color:#454545;">You can't give review because your item not delivered yet.<br/> Once your item was delivered then after  you can give review.</h4></div>
						<div class="mb-4 text-center">
							<button type="button" class="btn btn-sm btn-secondary mr-3 text-capitalize"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-sm btn-danger"
								data-dismiss="modal">Ok</button>
						</div>
					</div>
				</div>
			</div>
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
	<script>
    		function setProductId(uid,pid) {
    			document.getElementById("uid").value=uid;
    			document.getElementById("pid").value=pid;
			}	
    </script>
    <script>
    var rateCheck=false;
   	var rate=document.getElementById('rating');
   	var rateFeedback=document.getElementById("invalid-feedback-rate");
    rateFeedback.classList.add("d-none");
(function() {
  'use strict';
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName('needs-validation');
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
    		if(rate.value==="")
    	   	{
    	   		rateCheck==false;
    	   		rateFeedback.classList.remove("d-none");
    	   	} else {
    	   		rateCheck==true;
    	   		rateFeedback.classList.add("d-none");
    	   	}
        if (form.checkValidity() === false && rateCheck==false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
</body>
</html>