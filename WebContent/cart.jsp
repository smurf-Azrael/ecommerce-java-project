<%@page import="com.kitchenstore.bean.Cart"%>
<%@page import="com.kitchenstore.bean.Wishlist"%>
<%@page import="com.kitchenstore.bean.Product"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	List<Cart> cartItems = (List) request.getAttribute("cartItems");
	String outofStock=request.getParameter("outofStock");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Cart | Kitchen Store</title>

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
						<li class="breadcrumb-item active" aria-current="page">Cart</li>
					</ol>
				</div>	
			</nav>
				
			<%
						if (outofStock != null) {
						if (outofStock.equalsIgnoreCase(Encryption.encode("true"))) {
					%>
					<div class="row my-5">
						<div class="col-12">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Product out of Stock ! Please check your updated cart. 
								   If you made payment and your not completed yet, <a href="contact-us.jsp">Contact Us</a>
								 </strong>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<%
						} }
					%>
			</div>
				<!-- End .container -->
			<div class="container">
				<div class="row">
					<%
								float totalPrice=0;
								if (cartItems != null && cartItems.size()>0) {
					%>
					<div class="col-lg-8">
						<div class="cart-table-container">
							
							<table class="table table-cart">
								<thead>
									<tr>
										<th class="product-col">Product</th>
										<th class="price-col">Price</th>
										<th class="qty-col">Qty</th>
										<th class="product-col">Remove</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Cart cart : cartItems) {
									%>
									<tr class="product-row">
										<td class="product-col">
											<%if(cart.getProductStock()<cart.getQnty()){ %>
											<div class="my-2 mb-2">
												<%if(cart.getProductStock()>0){ %>
													<h4 class="text-danger">Not enough stock ! </h4>
													<h6>Only <%=cart.getProductStock() %> quantity available. you can buy product by reducing quantity.</h6>
												<% } else { %>
													<img src="images/out-of-stock.jpg" width="150px" height="100px" />
												<% } %>
											</div>
											<% } %>
											<figure class="product-image-container">
												<a
													href="Product?p=<%=cart.getProductName()%>&pid=<%=Encryption.encode(Long.toString(cart.getProductId()))%>"
													class="product-image"><img
													src="data:image/png/jpeg/jpg;base64,<%=cart.getProductThumbString()%>"
													alt="<%=cart.getProductName()%>"
													style="display: block; max-width: 200px; max-height: 200px; width: auto; height: auto;">>
												</a>
											</figure>
											<h5 class="product-title">
												<a
													href="Product?p=<%=cart.getProductName()%>&pid=<%=Encryption.encode(Long.toString(cart.getProductId()))%>"
													class="text-dark"><%=cart.getProductName()%></a>
											</h5>
										</td>
										<td><div class="price-box">
												<%float productPrice=0;
												if(cart.getDiscountPrice()>0){
													if(cart.getProductStock()>=cart.getQnty()){
														productPrice=(cart.getDiscountPrice())*(cart.getQnty());
														totalPrice+=productPrice;
													%>
													<span class="old-price"> <%=cart.getPrice() %></span> 
													<span class="product-price">&#8377;<%=cart.getDiscountPrice()%></span>
													<% } else { %>
														<span class="product-price">&#8377; 0.0</span> 
													<% } %>
												<% } else {
													if(cart.getProductStock()>=cart.getQnty()){
														productPrice=(cart.getPrice())*(cart.getQnty());
														totalPrice+=productPrice;
												%>
													<span class="product-price">&#8377; <%=cart.getPrice()%></span>
													<% } else { %>
													<span class="product-price">&#8377; 0.0</span>
												<% }
												} %>
											</div></td>
										<td>
											<input class="vertical-quantity form-control" type="text" readonly onchange="AddQty(this,'<%=Encryption.encode(Long.toString(cart.getCartId()))%>');" value="<%=cart.getQnty()%>">
										</td>
										<td class="text-center product-table-content"><a
											class="text-danger" style="font-size: 26px; cursor: pointer;"
											role="button" data-toggle="modal" data-target="#deleteModal"
											onclick="getDelId('<%=Encryption.encode(Long.toString(cart.getCartId()))%>')"><i
												class="fas fa-times"></i></a></td>
									</tr>
								<% } %>
								</tbody>

								<tfoot>
									<tr>
										<td colspan="5" class="clearfix">
											<div class="float-left">
												<a href="/KitchenStore/" class="btn btn-outline-secondary">Continue
													Shopping</a>
											</div> <!-- End .float-left -->

											<div class="float-right">
												<a href="RemoveItem?clearcart=true" class="btn btn-outline-secondary btn-clear-cart">Clear
													cart</a>
											</div> <!-- End .float-right -->
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- End .cart-table-container -->
					</div>
					<!-- End .row -->
					<div class="col-lg-4">
							<div class="cart-summary">
								<h3>Price Details</h3>
								<table class="table table-totals">
									<tbody>
										<tr>
											<td>Subtotal</td>
											<td>&#8377; <%=totalPrice %></td>
										</tr>

										<tr>
											<td>Delivery Charges</td>
											<%if(totalPrice>0){%>
												<td><% if(totalPrice>=500){ %> FREE<%} else { totalPrice+=57; %>&#8377; 57 <% } %></td>
											<% } else { %>
												<td>&#8377; 0.0</td>
											<% } %>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td>Order Total</td>
											<td>&#8377;<%=totalPrice %></td>
										</tr>
									</tfoot>
								</table>

						<%if(totalPrice>0){%>
						<div class="checkout-methods">
							<form action="BuyProducts" style="margin:0;" method="POST">
								<input type="hidden" value="<%=Encryption.encode(Float.toString(totalPrice)) %>" name="price" /> <input
									type="submit"
									class="btn btn-block btn-sm btn-primary text-capitalize"
									style="font-size: 16px" value="Place Order">
							</form>
						</div>
						<% } %>
						<!-- End .checkout-methods -->
							</div>
							<!-- End .cart-summary -->
						</div>
						<!-- End .col-lg-4 -->
				<% } else { %>
					<div class="col-lg-12">
						<h2 class="text-center">Oops ! Your Cart is Empty</h2>
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
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
					aria-labelledby="deleteModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="p-4 mr-3">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body text-center">
								<h4 style="color: #454545;">Are you sure to remove item
									from cart ?</h4>
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
			var strLink = "RemoveItem?cartid=" + id;
			document.getElementById("takeid").setAttribute("href", strLink);
		}
		
		function AddQty(obj,id)
		{
			var xhttp = new XMLHttpRequest();
			xhttp.open("POST", "Cart", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.onreadystatechange = function() {
				  if (this.readyState == 4 && this.status == 200) {
					  location.reload();
				  } else {
					  location.reload();
				  }
			};
			xhttp.send("cId="+id+"&qty="+obj.value);

			
		}
	</script>
</body>
</html>