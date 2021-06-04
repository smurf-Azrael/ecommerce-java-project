<%@page import="com.kitchenstore.bean.Product"%>
<%@page import="com.kitchenstore.bean.Category"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="java.util.List"%>
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

<title>Product Images</title>

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
<link href="assets/css/datatables.bootstrap4.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css">
<style type="text/css">
::placeholder { 
  font-size:16px !important;
}
</style>
</head>
<body>
	<% 
	    List<Product> productList=(List) request.getAttribute("productList");
	   String updateMsg=(String) request.getAttribute("update");
	   String deleteMsg=(String) request.getAttribute("delete");
	   Product productBean=(Product) request.getAttribute("getProduct");
	%>
	<!-- Header File -->
	<%@include file="header.jsp"%>
	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="http://localhost:8080/KitchenStore/"><i
							class="icon-home"></i></a></li>
					<li class="breadcrumb-item active" aria-current="page">Admin Dashboard</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-lg-10 order-lg-last dashboard-content">
					<div class="ml-5 pl-5">
						<div class="d-flex mb-1">
								<a
									class="btn btn-light text-capitalize p-3 px-4 mr-1 text-dark rounded" href="Products"><i
									class="fas fa-arrow-alt-circle-left mr-2"></i>All Products</a> 
							</div>
						<div class="mb-2 mx-auto">
							<h2 class="">Product Images</h2>
						</div>
						<%
						if (updateMsg != null) {
						if (updateMsg.equalsIgnoreCase("true")) {
					%>
						<div class="row">
							<div class="col-8">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									<strong>All images updated!</strong>
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
							<div class="col-8">
								<div class="alert alert-danger alert-dismissible fade show"
									role="alert">
									<strong>Some images not updated! Please try again later</strong>
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
							<div class="col-8">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									<strong>image deleted!</strong>
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
							<div class="col-8">
								<div class="alert alert-danger alert-dismissible fade show"
									role="alert">
									<strong>image not deleted! Please try again later</strong>
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
						<div class="my-2">
							<form id="formSubmit" action="ProductGallery" enctype="multipart/form-data" method="POST">
								<div class="form-group row py-3">
									<label for="inputproduct"
										class="col-sm-2 col-form-label font-weight-bold"
										style="font-size: 14px;">Select Product</label>
									<div class="col-sm-6">
										<input type="text" list="productData"
											class="form-control rounded" placeholder="Search here.."
											name="city" style="font-size: 14px;" id="product"
											autocomplete="off" value="" />
										<div class="text-danger my-3" id="productcheck">invalid product selection, please select valid product!</div>
										<datalist id="productData">
											<%
												for (Product product : productList) { %>
														<option value="<%=product.getProductName()%>" data-id="<%=product.getProductId()%>">	
												<%  } %>
											
										</datalist>
									</div>
								</div>
								<div style="margin: 50px 0px 5px;" id="productImageBlock">
								</div>
								<div class="pt-3">
									<button type="submit" class="btn btn-primary rounded">save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- End .col-lg-9 -->

				<aside class="sidebar col-lg-2">
					<div class="widget widget-dashboard">
						<h3 class="widget-title">Admin Dashboard</h3>

						<ul class="list">
							<li><a href="Customers"><i
									class="fas fa-user-cog ml-2 mr-1"></i> Manage Customers</a></li>
							<li class=""><a href="OrderDetails"><i
									class="fas fa-clipboard-check ml-2 mr-1"></i> Manage Orders</a></li>
							<li class=""><a href="ManageFeedback"><i
									class="fas fa-star ml-2 mr-1"></i> Manage Feedbacks</a></li>	
							<li><a href="Category"><i
									class="fas fa-tag mx-2"></i>Manage Category</a></li>
							<li><a href="SubCategory"><i
									class="fas fa-tags mx-2"></i>Manage Subcategory</a></li>
							<li><a href="Products"><i
									class="fas fa-database mx-2"></i>Manage Products</a></li>
							<li class=""><a href="ProductStock"><i
									class="fas fa-layer-group mx-2"></i>Product Stock</a></li>
							<li class="active"><a href="ProductGallery"><i
									class="fas fa-images mx-2"></i>Product Images</a></li>
							<li class=""><a href="ManageOffers"><i
									class="fas fa-hourglass-end mx-2"></i>Product Offers</a></li>
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
							<h4 style="color: #454545;">Are you sure to delete this
								image ?</h4>
						</div>
						<div class="mb-4 text-center">
							<button type="button" class="btn btn-sm btn-secondary mr-3"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-sm btn-danger">
								<a id="modelId" class="text-white">Delete</a>
							</button>
						</div>
					</div>
				</div>
			</div>
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
	
	 <!-- Page level plugin JavaScript-->
    <script src="assets/js/jquery.datatables.min.js"></script>

    <script src="assets/js/datatables.bootstrap4.min.js"></script>
    <script>
    		function getDelId(id) {
				var strLink = "RemoveProductImage?id=" + id;
				document.getElementById("modelId").setAttribute("href", strLink);
			}	
    </script>
	<script type="text/javascript">
		$(document).ready(function() {	
			$("#productcheck").hide();
			let productError=false;
			let undefinedError=true;
			<% if(productBean!=null){ %>
				$("#product").val("<%=productBean.getProductName()%>");
				productStock();
			<% }%>
			$("#product").keyup(function() {
				productStock();
			});
			function productStock()
			{
				var productId = $("#productData option[value='" + $('#product').val() + "']").attr('data-id');
				if(productId==null)
				{
					$("#productcheck").show();
					productError=false;
				}
				else {
					$("#productcheck").hide();
					productError=true;
					<% for(Product product:productList){%>
					if(productId==<%=product.getProductId()%>)
					{
						$.ajax({url: "GetProductImage", 
						 	type:"POST",
						 	data:{
						 		"productId": productId
						 	},
                            success: function(result) {
                            				$("#productImageBlock").html(result);  	
                            				$("#productImageBlock").removeClass("text-danger");
            				},
            				error: function (error) {
            					$("#productImageBlock").html("Opps ! Internal Server Error has occur. Please try again some time later");
            					$("#productImageBlock").addClass("text-danger");
            					undefinedError=false;
            				}
					 }); 
					}
				<% } %>
				}
			}
			
			// Submitt button 
			$("#formSubmit").submit(
					function(e) {
						
						if (productError == false)
						{
								$("#productcheck").show();
								return false;
						} else {
							if(undefinedError == false)
								return false;
							else
								return true;
						}

					});
		});   
	</script>
	
</body>
</html>