<%@page import="com.kitchenstore.bean.Address"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% Address address=(Address) request.getAttribute("DeliveryAddress");
   float totalPrice=(Float) request.getAttribute("totalPrice");
   int totoalProducts=(Integer) request.getAttribute("totoalProducts");
   
   if(totalPrice<557)
   {
	   totalPrice-=57;
   }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Checkout</title>

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
						<li class="breadcrumb-item active" aria-current="page">Place Order</li>
					</ol>
				</div>
				<!-- End .container -->
			</nav>
		</div>
		<div class="container mt-4">
			<ul class="checkout-progress-bar">
				<li class="active"><span>Login or Sign Up</span></li>
				<li class="active"><span>Delivery</span></li>
				<li class="active"><span>Payments</span></li>
				<li><span>Complete</span></li>
			</ul>
			<div class="row">
				<div class="col-lg-4">
					<div class="order-summary">
						<h3>Summary</h3>

						<p><%=totoalProducts %>
							Products
						</p>
						<h4>
							<a data-toggle="collapse" href="#order-cart-section"
								class="collapsed" role="button" aria-expanded="false"
								aria-controls="order-cart-section">Price Details</a>
						</h4>

						<div class="collapse" id="order-cart-section">
							<table class="table table-totals">
								<tbody>
									<tr>
										<td>Subtotal</td>
										<td>&#8377;<%=totalPrice %></td>
									</tr>

									<tr>
										<td>Delivery Charges</td>
										<td>
											<% if(totalPrice>=500){ %> FREE<%} else { totalPrice+=57; %>&#8377;
											57 <% } %>
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td>Order Total</td>
										<td>&#8377;<%=totalPrice %></td>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- End #order-cart-section -->
					</div>
					<!-- End .order-summary -->

					<div class="checkout-info-box">
						<h3 class="step-title">
							Deliver To: <a href="PlaceOrder" title="Edit"
								class="step-title-edit"><span class="sr-only">Edit</span><i
								class="icon-pencil"></i></a>
						</h3>

						<address>
							<%=address.getfName() %>
							<%=address.getlName() %>
							<span class="d-inline ml-5"><%=address.getContactNumber() %></span>
							<p class="card-text text-dark" style="font-size: 16px"><%=address.getAddress() %>
								<br /><%=address.getAreaName() %>,
								<%=address.getCityName() %>
								- <strong><%=address.getPincode() %></strong>
							</p>
						</address>
					</div>
					<!-- End .checkout-info-box -->
				</div>
				<!-- End .col-lg-4 -->

				<div class="col-lg-8 order-lg-first">
					<div class="checkout-payment">
						<h2 class="step-title">Payment Options</h2>
						<div class="ml-5">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="customRadioInline1"
								name="paymentType" class="custom-control-input" value="p"> 
							<label class="custom-control-label" for="customRadioInline1"><img style="display:inline-block !important; margin-top:-21px;" src="images/paytm.png" width="60"/></label>
						</div>
						<br/>
						<div class="custom-control custom-radio custom-control-inline" style="margin-top:-70px">
							<input type="radio" id="customRadioInline2"
								name="paymentType" class="custom-control-input" value="c">
							<label class="custom-control-label" style="font-size:16px" for="customRadioInline2">Cash On Delivery</label>
						</div>
						<div class="clearfix">
							<a  id="paymentBtn" class="btn btn-primary text-white">Continue</a>
						</div>
						<!-- End .clearfix -->
					</div>
					<!-- End .checkout-payment -->
					</div>

				</div>
				<!-- End .col-lg-8 -->
			</div>
			<!-- End .row -->
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
     $(document).ready(function(){
    	 $('#paymentBtn').click(function(e){
    		 var val=$("input[name=paymentType]:checked").val();
    		 if(val!==undefined)
    	 	 {
    	 		 if(val==="p")
    	 		 {
    	 			$("#paymentBtn").attr("target","_blank");
    	 			 $("#paymentBtn").attr("href","PayOnline");
    	 			
    	 		 } else if(val==="c")
    	 		 {
    	 			$("#paymentBtn").attr("href","OrderProcess");
    	 			
    	 		 }
    	 	 }
    	 });
    	 
     });
    </script>

</body>
</html>