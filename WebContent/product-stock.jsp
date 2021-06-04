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

<title>Product Stocks</title>

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
		Product productBean=(Product) request.getAttribute("getProduct");
	    List<Product> productList=(List) request.getAttribute("productList");
	   String updateMsg=(String) request.getAttribute("update");
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
							<h2 class="">Product Stock</h2>
						</div>
						<%
						if (updateMsg != null) {
						if (updateMsg.equalsIgnoreCase("true")) {
					%>
						<div class="row">
							<div class="col-8">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									<strong>Product Stock updated!</strong>
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
									<strong>Stock not updated! Please try again later</strong>
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
							<form id="formSubmit" action="ProductStock" method="POST">
								<div class="form-group row py-3">
									<label for="inputproduct"
										class="col-sm-2 col-form-label font-weight-normal"
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
								<div class="form-group row py-3">
									<label for="currrentStock"
										class="col-sm-2 col-form-label font-weight-normal"
										style="font-size: 14px;">Current Stock</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="currrentStock"
											name="name" style="font-size: 16px;" disabled>
									</div>
								</div>
								<div class="form-group row py-3">
									<label for="inputproduct"
										class="col-sm-2 col-form-label font-weight-normal"
										style="font-size: 14px;">Update Stock</label>
									<div class="col-sm-4">
										<div class="input-group">
											<span class="input-group-prepend">
												<button type="button"
													class="btn btn-sm btn-outline-secondary btn-number"
													disabled="disabled" data-type="minus" data-field="pstock">
													<span class="fa fa-minus"></span>
												</button>
											</span> <input type="text" name="pstock" id="updateStock"
												class="form-control input-number" value="1" min="0"
												max="100000" style="font-size: 16px;" > <span class="input-group-append">
												<button type="button"
													class="btn btn-sm btn-outline-secondary btn-number"
													data-type="plus" data-field="pstock">
													<span class="fa fa-plus"></span>
												</button>
											</span>
										</div>
									</div>
								</div>
								<input type="hidden" value="" name="pid" id="productId"> 
								<div class="pt-3">
									<button type="submit" class="btn btn-primary rounded">save</button>
								</div>
							</form>
							<div class="exportAs">
								<p class="font-weight-bold">Get Stock Details</p>
								<a class="btn btn-primary btn-sm text-white rounded-pill" id="exportBtn"><i class="fas fa-download mr-3 p-1" style="font-size:18px;"></i> Export As .CSV </a>
							</div>
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
							<li class="active"><a href="ProductStock"><i
									class="fas fa-layer-group mx-2"></i>Product Stock</a></li>
							<li class=""><a href="ProductGallery"><i
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
	<script type="text/javascript">
		$(document).ready(function() {
			$('.btn-number').click(function(e){
			    e.preventDefault();
			    
			    fieldName = $(this).attr('data-field');
			    type      = $(this).attr('data-type');
			    var input = $("input[name='"+fieldName+"']");
			    var currentVal = parseInt(input.val());
			    if (!isNaN(currentVal)) {
			        if(type == 'minus') {
			            
			            if(currentVal > input.attr('min')) {
			                input.val(currentVal - 1).change();
			            } 
			            if(parseInt(input.val()) == input.attr('min')) {
			                $(this).attr('disabled', true);
			            }
		
			        } else if(type == 'plus') {
		
			            if(currentVal < input.attr('max')) {
			                input.val(currentVal + 1).change();
			            }
			            if(parseInt(input.val()) == input.attr('max')) {
			                $(this).attr('disabled', true);
			            }
		
			        }
			    } else {
			        input.val(0);
			    }
			});
			$('.input-number').focusin(function(){
			   $(this).data('oldValue', $(this).val());
			});
			$('.input-number').change(function() {
			    
			    minValue =  parseInt($(this).attr('min'));
			    maxValue =  parseInt($(this).attr('max'));
			    valueCurrent = parseInt($(this).val());
			    
			    name = $(this).attr('name');
			    if(valueCurrent >= minValue) {
			        $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
			    } else {
			        $(this).val($(this).data('oldValue'));
			    }
			    if(valueCurrent <= maxValue) {
			        $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
			    } else {
			        $(this).val($(this).data('oldValue'));
			    }
			});
		
			$(".input-number").keydown(function (e) {
			    // Allow: backspace, delete, tab, escape, enter and .
			    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
			         // Allow: Ctrl+A
			        (e.keyCode == 65 && e.ctrlKey === true) || 
			         // Allow: home, end, left, right
			        (e.keyCode >= 35 && e.keyCode <= 39)) {
			             // let it happen, don't do anything
			             return;
			    }
			    // Ensure that it is a number and stop the keypress
			    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
			        e.preventDefault();
			    }
			});
			$("#productcheck").hide();
			let productError=false;
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
					$("#updateStock").attr("disabled","disabled");
					$(".btn-number").attr("disabled","disabled");
					$("#product").addClass("is-invalid");
					$("#productcheck").show();
					productError=false;
				}
				else {
					$("#updateStock").removeAttr("disabled");
					$(".btn-number").removeAttr("disabled");
					$("#productcheck").hide();
					$("#product").removeClass("is-invalid");
					productError=true;
					<% for(Product product:productList){%>
					if(productId==<%=product.getProductId()%>)
					{
						$("#currrentStock").val("<%=product.getProductStock()%>");
						$("#updateStock").val("<%=product.getProductStock()%>");
						$("#productId").val("<%=Encryption.encode(Long.toString(product.getProductId()))%>");
					}
				<% } %>
				}
			}
			// Submitt button 
			$("#formSubmit").submit(
					function(e) {
						
						if (productError == false)
						{
								$("#product").addClass("is-invalid");
								$("#productcheck").show();
								return false;
						} else {
							$("#productcheck").hide();
							$("#product").addClass("is-valid");
							return true;
						}

					});
		});   
var exportBtn = document.getElementById("exportBtn");
		
		exportBtn.addEventListener("click", function(e){
		const rows = [];
		let tableRow="";
		<% int i = 1;
		for (Product product : productList) {
		%>
				tableRow=["<%=i++%>","<%=product.getProductName()%>","<%=product.getProductStock()%>"];
				rows.push(tableRow);
				tableRow="";
		<% }%>
		let csvContent = "data:text/csv;charset=utf-8,Sr No,Product Name,Available Stock\r\n";

		rows.forEach(function(rowArray) {
			 let row = rowArray.join(" andSperator ");
			 row=row.replace(/,/g , ' ');
			 row=row.replace(/ andSperator /g , ',');
			 csvContent += row + "\r\n";
		});
		var encodedUri = encodeURI(csvContent);
		exportBtn.setAttribute("href", encodedUri);
		let today=new Date();
		exportBtn.setAttribute("download", "stocks_" + today.getDate() + "-" + today.getMonth() + "-" + today.getFullYear() + ".csv");
		});
	</script>
</body>
</html>