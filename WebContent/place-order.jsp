<%@page import="com.kitchenstore.bean.Address"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% List<Address> addresslist=(List) request.getAttribute("addrList"); %>
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
		<div class="container">
			<ul class="checkout-progress-bar">
				<li class="active"><span>Login or Sign Up</span></li>
				<li class="active"><span>Delivery</span></li>
				<li><span>Payments</span></li>
				<li><span>Complete</span></li>
			</ul>
			<div class="row" style="margin-top:50px;">
				<div class="col-lg-12">
					<ul class="checkout-steps">
						<li>
							<%if(addresslist!=null && addresslist.size()>0)
							{ %>
							<h2 class="step-title">Delivery Address</h2>
							<div class="shipping-step-addresses owl-carousel owl-theme dots-top">
							
							<% boolean flag=false; 
								int cnt=1;
							for(Address address : addresslist){
								if(address.getIsDefault()==1){
									flag=true;
									break;
								}
							}
							for(Address address : addresslist){ %>
								<div id="<%=Encryption.encode(Long.toString(address.getAddressId())) %>"
								<%if(flag){ 
									if(address.getIsDefault()==1) { %>
									  class="address-box active">
									<% } else { %>
									  class="address-box">
								<% } } else { 
									if(cnt==1)
									{ cnt++;%>
										class="address-box active">
								<%  } else { %>
									class="address-box">
								<% } } %>
								
									<address>
										<%if(address.getIsDefault()==1) {%>
												<h5 class="text-primary text-capitalize"><i class="fas fa-check-circle mx-2"></i> Default Address </h5>
										<% } %>
									<div>
										<%
									if (address.getAddressType().equalsIgnoreCase("H")) {%>
										<i class="fas fa-home mr-2"></i>Home
									<%} else { %>
										<i class="fas fa-briefcase mr-3"></i>Work
									<% } %>
									</div>
										<%=address.getfName() %>  <%=address.getlName() %> <span class="d-inline ml-5"><%=address.getContactNumber() %></span>
										<p class="card-text text-dark" style="font-size:16px"><%=address.getAddress() %>
								<br/><%=address.getAreaName() %>, <%=address.getCityName() %> - <strong><%=address.getPincode() %></strong></p>
									
									</address>
									<div class="address-box-action clearfix">
										<a href="AddAddress?editaddress=<%=Encryption.encode("true") %>&id=<%=Encryption.encode(Long.toString(address.getAddressId())) %>" class="btn btn-sm btn-link"> Edit </a>
										<button role="button" onclick="changeAddress(this)"
											class="btn btn-sm btn-outline-secondary float-right">
											Deliver Here </button>
									</div>
									<!-- End .address-box-action -->
								</div>
								<!-- End .shipping-address-box -->
							<% }%> 
							</div>
							<!-- End .shipping-step-addresses -->
							 <div class="float-left ">
								<a href="AddAddress" class="btn btn-outline-secondary">+ New
									Address</a>
							</div>
							<div class="float-right">
								<div class="checkout-steps-action">
									<a onclick="nextProcess(this)"
										class="btn btn-primary float-right text-white">NEXT</a>
								</div>
								<!-- End .checkout-steps-action -->
							</div>
							
							<% } else { %>
								<div class="m-5">
								<p class="h3 my-5 text-secondary">You did not provide any address yet, Please add your delivery address first !</p>
								<div class="" style="padding-left:0%;">
								<a href="AddAddress" class="btn btn-outline-secondary text-capitalize" style="font-size:18px;">+ New
									Address</a>
							</div>
							</div>
							<% } %>
						</li>
					</ul>
				</div>
				<!-- End .col-lg-8 -->
			</div>
			<!-- End .row -->
		</div>
		<!-- End .container -->
		<div class="mb-6"></div>
		<!-- margin -->
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
      function changeAddress(obj) {
        let addressBox = document.getElementsByClassName("address-box");
        Array.from(addressBox).forEach((element) => {
          if (element.classList.contains("active")) {
            element.classList.remove("active");
          }
        });
        let newAddress = obj.parentNode.parentNode;
        newAddress.classList.add("active");
      }
      function nextProcess(obj) {
        let aId = "";
        let addressBox = document.getElementsByClassName("address-box");
        Array.from(addressBox).forEach((element) => {
          if (element.classList.contains("active")) {
            aId = element.getAttribute("id");
          }
        });
        if(aId!=="")
        {
			let url="PaymentOptions?placeorder=" + '<%=Encryption.encode("true")%>' + "&aid="+aId;
			obj.setAttribute("href",url);
        }
      }
    </script>

</body>
</html>