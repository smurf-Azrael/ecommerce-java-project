<%@page import="com.kitchenstore.bean.Wishlist"%>
<%@page import="com.kitchenstore.bean.Product"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	List<Wishlist> wishlistItems = (List) request.getAttribute("wishlishItem");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Wishlist | Kitchen Store</title>

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
						<li class="breadcrumb-item active" aria-current="page">Wishlist</li>
					</ol>
				</div>
				<!-- End .container -->
			</nav>
			<div class="container">
				<div class="row">
					<%
							if (wishlistItems != null && wishlistItems.size()>0) {
					%>
					<div class="col-lg-12">
						<h2 class="text-center">Your Favorite Items</h2>
						<div class="cart-table-container">
							
							<table class="table table-cart">
								<thead>
									<tr>
										<th class="product-col">Product</th>
										<th class="price-col">Price</th>
										<th class="">Move into Cart</th>
										<th class="product-col">Remove</th>
									</tr>
								</thead>
								<tbody>
									<%for (Wishlist wishlist : wishlistItems) {%>
									<tr class="product-row">
										<td class="product-col">
											<figure class="product-image-container">
												<a
													href="Product?p=<%=wishlist.getProductName()%>&pid=<%=Encryption.encode(Long.toString(wishlist.getProductId()))%>"
													class="product-image"><img
													src="data:image/png/jpeg/jpg;base64,<%=wishlist.getProductThumbString()%>"
													alt="<%=wishlist.getProductName()%>"
													style="display: block; max-width: 200px; max-height: 200px; width: auto; height: auto;">>
												</a>
											</figure>
											<h4 class="product-title">
												<a
													href="Product?p=<%=wishlist.getProductName()%>&pid=<%=Encryption.encode(Long.toString(wishlist.getProductId()))%>"
													class="text-dark"><%=wishlist.getProductName()%></a>
											</h4>
										</td>
										<td>
											<div class="price-box">
												<% if(wishlist.getDiscountPrice()>0){ %>
													<span class="old-price"> <%=wishlist.getPrice() %></span>
													<span class="product-price">&#8377;<%=wishlist.getDiscountPrice()%></span>
												
												<% } else { %>
														<span class="product-price">&#8377;<%=wishlist.getPrice()%></span>
												<% } %>
											</div>
										</td>
										<td><a 
											class="btn btn-primary add-cart icon-shopping-cart text-white"
											onClick="getCartId('<%=Encryption.encode(Long.toString(wishlist.getProductId()))%>','<%=Encryption.encode(Long.toString(wishlist.getWishlistId()))%>')">Move into cart</a></td>
										<td class="text-center product-table-content"><a
											class="text-danger" style="font-size: 26px; cursor: pointer;"
											role="button" data-toggle="modal" data-target="#deleteModal"
											onclick="getDelId('<%=Encryption.encode(Long.toString(wishlist.getWishlistId()))%>')"><i
												class="fas fa-times"></i></a></td>
									</tr>
									<%
										}
									%>
								</tbody>

								<tfoot>
									<tr>
										<td colspan="5" class="clearfix">
											<div class="float-left">
												<a href="/KitchenStore/" class="btn btn-outline-secondary">Continue
													Shopping</a>
											</div> <!-- End .float-left -->

											<div class="float-right">
												<a href="RemoveItem?clearwishlist=true" class="btn btn-outline-secondary btn-clear-cart">Clear
													WhishList</a>
											</div> <!-- End .float-right -->
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- End .cart-table-container -->

					</div>
					<!-- End .row -->
					<% } else { %>
					<div class="col-lg-12">
						<h2 class="text-center">Oops ! Your Wishlist is Empty</h2>
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
			<!-- End .container -->
			<!-- Modal -->
			<div>
				<div class="modal fade" id="deleteModal" tabindex="-1"
					role="dialog" aria-labelledby="deleteModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="p-4 mr-3">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body text-center">
								<h4 style="color: #454545;">Are you sure to remove item from this list
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
    		function getDelId(id) {
				var strLink = "RemoveItem?id=" + id;
				document.getElementById("takeid").setAttribute("href", strLink);
			}	
    		function getCartId(cId,wId){
    			$(document).ready(function() {
    					$.ajax({url: "MoveToCart", 
    					 	type:"POST",
    					 	data:{
    					 		"productId": cId,
    					 		"wishlistId": wId
    					 	},
    		                success: function(result) {
    		                	$("#modalContentCart").html(result);
    		                	$('#exampleModalCart').modal('show');
    		                	setTimeout(function(){ 
    		                		location.reload();
    		                	}, 1500);
    						},
    						error: function (error) {
    							$("#modalContentCart").html("<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Some problem has occur please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-danger float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
    						}
    				 }); 
    				 
    			});	
    		}
    </script>
    <script type="text/javascript">
	
	</script>
</body>
</html>