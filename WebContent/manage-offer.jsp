<%@page import="com.kitchenstore.bean.Offer"%>
<%@page import="com.kitchenstore.bean.Product"%>
<%@page import="com.kitchenstore.bean.Category"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="java.util.List"%>
<%@page import="com.kitchenstore.bean.User"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	Offer editOffer = (Offer) request.getAttribute("editOffer");
List<Product> productList = (List) request.getAttribute("productList");
List<Offer> offerList= (List) request.getAttribute("offerList");
String updateMsg = (String) request.getAttribute("update");
String deleteMsg = (String) request.getAttribute("delete");
String addMsg = (String) request.getAttribute("add");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Manage Offer | Kitchen Store</title>

<meta name="keywords" content="Kitchen Store" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="assets/images/icons/favicon.ico">
<style type="text/css">
.p-image {
	cursor: pointer;
}

.product-table-content {
	vertical-align: middle !important;
}

.form-control {
	font-size: 16px;
}
</style>



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
<style type="text/css">
.form-control {
	font-size: 16px !important;
}

::placeholder {
	font-size: 16px !important;
}
</style>
</head>
<body>
	<!-- Header File -->
	<%@include file="header.jsp"%>
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
					<div class="ml-3">
						<div class=" text-center">
							<h2>Manage Offers</h2>
						</div>
						<div class="d-flex mt-3">
									<a href="Products" class="btn btn-light text-capitalize p-3 px-4 ml-2 text-dark rounded"><i
									class="fas fa-database mr-2"></i> All Products</a>
									<a class="btn btn-light text-capitalize p-3 px-4 mr-1 text-dark rounded" href="ProductStock"><i
									class="fas fa-layer-group mr-3"></i>Product Stocks</a>
									<a class="btn btn-light text-capitalize p-3 px-4 ml-2 text-dark rounded" href="ProductGallery"><i
									class="fas fa-image mr-2"></i>Product images</a>
									
									
							</div>
						<div class="pt-4 pl-5 pr-4 pb-4 mb-3 mt-1" id="categoryCard"
							style="background-color: #F2F3F4";>
							<span class="text-primary font-weight-bold"
								style="cursor: pointer; font-size: 1.6rem;" id="pInfoEdit"><i
								class="fas fa-plus mr-2"></i> <%
 					if (editOffer != null) {%> 
 					Edit Offer <% } else { %> New Offer <% }%> </span> 
 					<span
								class="text-primary font-weight-bold"
								style="cursor: pointer; font-size: 1.6rem;" id="pInfoCancel">Cancel</span>
							<div class="form-content mt-4">
								<%
									if (editOffer != null) {
								%>
								<h4 class="mt-2">Edit Offer</h4>
								<%
									}
								%>
								<form id="formSubmit" action="ManageOffers" method="POST">
									<div class="form-group row py-3">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-bold"
											style="font-size: 14px;">Select Product</label>
										<div class="col-sm-6">
											<input type="text" list="productData"
												class="form-control rounded" placeholder="select or type.."
												name="product" style="font-size: 14px;" id="product"
												autocomplete="off" value="" />
											<div class="text-danger my-3" id="productcheck">invalid
												product selection, please select valid product!</div>
											<%if(editOffer!=null){ %>
												<datalist id="productData">
													<option value="<%=editOffer.getProductName()%>"
													data-id="<%=editOffer.getProductId()%>">
												</datalist>
											<% } else { %>
											<datalist id="productData">
												<%
													for (Product product : productList) {
												%>
												<option value="<%=product.getProductName()%>"
													data-id="<%=product.getProductId()%>">
													<%
														}
													%>
											</datalist>
										<% } %>
										</div>
									</div>
									<div class="form-group row py-3">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-bold"
											style="font-size: 14px;">Discount type</label>
										<div class="col-sm-6">
											<div class="form-check form-check-inline">
												<input class="form-check-input discountType" type="radio"
													name="discountType" id="priceRadio" value="p">
												<label class="form-check-label" for="priceRadio">Price ( &#8377; )</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input discountType" type="radio"
													name="discountType" id="rateRadio" value="d">
												<label class="form-check-label" for="rateRadio">Discount (%)</label>
											</div>
											<div class="text-danger my-3" id="discountTypeCheck">Please select field!</div>

										</div>
									</div>
									<div class="form-group row py-3" id="priceBox">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-bold"
											style="font-size: 14px;"></label>
										<div class="col-sm-6">
											<input type="number" class="form-control" id="priceInput" step="0.1" min="1" name="price">
											<small id="pricehelp" style="font-size: 12px;"
												class="form-text text-muted">Please enter
												the final price after deduct your discount price from
												original product price manually.</small>
											<div class="text-danger my-3" id="priceCheck">Enter the final price of product !</div>
										</div>
									</div>
									<div class="form-group row py-3" id="rateBox">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-bold"
											style="font-size: 14px;"></label>
										<div class="col-sm-6">
											<input type="number" class="form-control" id="rateInput" step="0.1" min="0.1" max="100" name="rate">
											<div class="text-danger my-3" id="rateCheck">Enter the discount rate % !</div>
										</div>
									</div>
									<div class="form-group row py-3">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-bold"
											style="font-size: 14px;">Offer Duration</label>
										<div class="col-sm-6">
											<select class="form-control" id="durationInput" name="duration">
												<option value="">Select</option>
												<option value="a">All time</option>
												<option value="s">Specific time</option>
											</select>
											<div class="text-danger my-3" id="durationCheck">Select duration !</div>
										</div>
									</div>
									<div class="form-group row py-3" id="startingDate">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-bold"
											style="font-size: 14px;">Starting Date</label>
										<div class="col-sm-6">
											<input class="form-control" type="date" id="startDateInput" name="startDate" />
										</div>
									</div>
									<div class="form-group row py-3" id="endDate">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-bold"
											style="font-size: 14px;">Ending Date</label>
										<div class="col-sm-6">
											<input class="form-control" type="date" id="endDateInput" name="endDate" />
										</div>
									</div>
									<% if(editOffer!=null){ %>
										<input type="hidden" value="<%=Encryption.encode(Long.toString(editOffer.getOfferId()))%>" name="oid"> 
									<% } %>
									<div class="pt-3">
										<button type="submit" class="btn btn-primary rounded">save</button>
									</div>
								</form>
								<br />
							</div>
						</div>
						<%
							if (addMsg != null) {
							if (addMsg.equalsIgnoreCase("true")) {
						%>
						<div class="row">
							<div class="col-12">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									<strong>New Offer added!</strong>
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
									<strong>Offer not added! Please try again later</strong>
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
									<strong>Offer updated!</strong>
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
									<strong>Offer not updated! Please try again later</strong>
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
									<strong>Offer deleted!</strong>
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
									<strong>Offer not deleted! Please try again later</strong>
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
						<table class="table table-hover" id="dataTable">
							<thead class="text-white text-center"
								style="background-color: #0088cc;">
								<tr class="">
									<th>Sr No.</th>
									<th>Product Name</th>
									<th>Discount %</th>
									<th>Price &#8377;</th>
									<th>Offer Duration</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<% int cnt=1; 
								for(Offer offer : offerList){ %>
									<tr>
										<td><%=cnt++ %></td>
										<td><%=offer.getProductName() %></td>
										<td class="text-center"><%if(offer.getDiscountRate()>0){%><%=offer.getDiscountRate()%>  % <% } else { %> - <%}%></td>
										<td class="text-center"><%if(offer.getDiscountPrice()>0){%><%=offer.getDiscountPrice()%><% } else { %> - <%}%></td>	
										<td><%if(offer.getStartDate().length()>0 && offer.getStartDate() !=null){%>
											<%=offer.getStartDate()%> <br/><span class="ml-5">to</span><br/> <%=offer.getEndDate()%>
										<% } else { %> 
											all time 
										<% } %>
										</td>
										<td class="text-center product-table-content" ><a href="ManageOffers?edit=<%=Encryption.encode("true") %>&uid=<%=Encryption.encode(Long.toString(offer.getOfferId())) %>"
										 class="text-success"
										style="font-size: 16px; cursor: pointer;"><i
											class="fas fa-edit"></i></a></td>
									<td class="text-center product-table-content"><a class="text-secondary" style="font-size:16px;cursor:pointer;" role="button" data-toggle="modal" data-target="#exampleModal"
													onclick="getDelId(<%=Long.toString(offer.getOfferId()) %>)"><i class="fas fa-trash"></i></a></td>	
									</tr>
								<% } %>
							</tbody>
						</table>
						<div class="exportAs">
							<a class="btn btn-primary btn-sm text-white rounded-pill" id="exportBtn"><i class="fas fa-download mr-3 p-1" style="font-size:18px;"></i> Export As .CSV </a>
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
							<li><a href="ProductGallery"><i
									class="fas fa-images mx-2"></i>Product Images</a></li>
							<li class="active"><a href="ManageOffers"><i
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
							<h4 style="color: #454545;">Are you sure to delete Offer ?</h4>
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
    		function getDelId(id) {
				var strLink = "RemoveOffer?id=" + id;
				document.getElementById("takeid").setAttribute("href", strLink);
			}	
    		var exportBtn = document.getElementById("exportBtn");
			
			exportBtn.addEventListener("click", function(e){
			const rows = [];
			let tableRow="";
			<% int i = 1;
			String discountPrice="";
			String price="";
			String date="";
			for(Offer offer : offerList){ 
				if(offer.getDiscountRate()>0){
					discountPrice= Float.toString(offer.getDiscountRate());  
				} else {
					discountPrice="-";
				}
				if(offer.getDiscountPrice() >0){
					price= Float.toString(offer.getDiscountPrice());  
				} else {
					price="-";
				}
				if(offer.getStartDate().length()>0 && offer.getStartDate() !=null){
					date=offer.getStartDate()+" to " +offer.getEndDate();	
				} else {
					date="-";
				}
			%>
					tableRow=["<%=i++%>","<%=offer.getProductName()%>","<%=discountPrice%>","<%=price%>","<%=date%>"];
					rows.push(tableRow);
					tableRow="";
			<% }%>
			let csvContent = "data:text/csv;charset=utf-8,Sr No,Product Name,Discount %, Discount Price, Offer Duration\r\n";

			rows.forEach(function(rowArray) {
				 let row = rowArray.join(" andSperator ");
				 row=row.replace(/,/g , ' ');
				 row=row.replace(/ andSperator /g , ',');
				 csvContent += row + "\r\n";
			});
			var encodedUri = encodeURI(csvContent);
			exportBtn.setAttribute("href", encodedUri);
			let today=new Date();
			exportBtn.setAttribute("download", "Offers_" + today.getDate() + "-" + today.getMonth() + "-" + today.getFullYear() + ".csv");
			});			
    </script>
	<script>
					$(document).ready(function() {
						$('#dataTable').DataTable();	
						let priceBox =$("#priceBox");
						let rateBox = $("#rateBox");
						let startingDate=$("#startingDate");
						let endDate=$("#endDate");
						<%if (editOffer != null) {%>
							$(".form-content").show();
							$("#pInfoEdit").hide();
							$("#pInfoCancel").show();
							$("#categoryCard").removeClass("pb-4");
							$("#product").val("<%=editOffer.getProductName()%>");
							$("#product").attr("disabled","disabled");
							<%if(editOffer.getDiscountPrice()>0){%>
								$("#priceInput").val("<%=editOffer.getDiscountPrice()%>");
								rateBox.hide();
								$("#priceRadio").attr('checked', 'checked');
							<% } else if(editOffer.getDiscountRate()>0){ %>
								$("#rateInput").val("<%=editOffer.getDiscountRate()%>");
								$("#rateRadio").attr('checked', 'checked');
								priceBox.hide();
							<% } %>
							<% if(editOffer.getStartDate().length()>0 && editOffer.getStartDate()!=null){%>
								startingDate.show();
								endDate.show();
								$("#startDateInput").val("<%=editOffer.getStartDate()%>");
								$("#endDateInput").val("<%=editOffer.getEndDate()%>");
								$('select[name^="duration"] option[value="s"]').attr("selected","selected");
							<%} else {%>
								startingDate.hide();
								endDate.hide();
								$('select[name^="duration"] option[value="a"]').attr("selected","selected");
							<% }%>
						<%} else {%>
							$(".form-content").hide();
							$("#pInfoCancel").hide();
							priceBox.hide();
							rateBox.hide();
							startingDate.hide();
							endDate.hide();
						<%}%>
						let formSubmitted=false;
						$("#productcheck").hide();
						let productError=false;
						$("#product").keyup(function() {
							validateProduct();
						});
						function validateProduct()
						{
							var productId = $("#productData option[value='" + $('#product').val() + "']").attr('data-id');
							if(productId==null)
							{
								$("#productcheck").show();
								$("#product").removeClass("is-valid");
								$("#product").addClass("is-invalid");
								productError=true;
							}
							else {
								$("#productcheck").hide();
								$("#product").removeClass("is-invalid");
								$("#product").addClass("is-valid");
								productError=false;
							}
						}
						
						//Discount type
						
						let discountValue="";
						let discountRadio=$("input[name=discountType]:radio");
						discountRadio.change(function() {
							if(formSubmitted){
								validateDiscountType();
							}
							discountValue=$("input[name=discountType]:checked").val();
							if(discountValue =='p')
							{
								priceBox.show();
								rateBox.hide();
								$("#rateInput").val("");
								if(formSubmitted){
									validateRate();
								}
								
							} else {
								priceBox.hide();
								rateBox.show();
								$("#priceInput").val("");
								if(formSubmitted){
									validatePrice();
								}
							}
						});
						let durationInput=$("#durationInput");
						durationInput.change(function(){
							if(formSubmitted){
								validateDuration();
							}
						    if (durationInput.val() == "s"){
						    	startingDate.show();
								endDate.show();
						    } else {
						    	startingDate.hide();
								endDate.hide();
								$("#startDateInput").val("");
								$("#endDateInput").val("");
						    }
						});
						
						//validation
						let discountTypeError=true;
						let discountTypeCheck=$("#discountTypeCheck");
						discountTypeCheck.hide();
						function validateDiscountType() {
								if($('.discountType[type=radio]:checked').length == 0)
							      {
									discountTypeCheck.show();
									$(".discountType").removeClass("is-valid");
									$(".discountType").addClass("is-invalid");
									discountTypeError=true;
							      }
							      else
							      {
							    	  discountTypeError=false;
							          $(".discountType").removeClass("is-invalid");
									  $(".discountType").addClass("is-valid");
									  discountTypeCheck.hide();
							      }      
								
						}
						let priceError=false;
						let priceCheck=$("#priceCheck");
						priceCheck.hide();
						function validatePrice()
						{
							discountValue=$("input[name=discountType]:checked").val();
							if(discountValue =='p')
							{
								if($("#priceInput").val()==""){
									$("#pricehelp").hide();
									priceCheck.show();
									priceError=true;
									$("#priceInput").addClass("is-invalid");
									$("#priceInput").removeClass("is-valid");
								} else 
								{
									priceCheck.hide();
									$("#pricehelp").show();
									priceError=false;
									$("#priceInput").removeClass("is-invalid");
									$("#priceInput").addClass("is-valid");
								}
								
							} else 
							{
								priceError=false;
							}
						}
						$("#priceInput").blur(function(){
							if(formSubmitted){
								validatePrice();
							}
						});
						let rateError=false;
						let rateCheck=$("#rateCheck");
						rateCheck.hide();
						function validateRate()
						{
							discountValue=$("input[name=discountType]:checked").val();
							if(discountValue =='d')
							{
								if($("#rateInput").val()==""){
									rateCheck.show();
									rateError=true;
									$("#rateInput").addClass("is-invalid");
									$("#rateInput").removeClass("is-valid");
								
								} else {
									rateCheck.hide();
									rateError=false;
									$("#rateInput").removeClass("is-invalid");
									$("#rateInput").addClass("is-valid");
								}
								
							} else 
							{
								rateError=false;
							}
						}
						
						$("#rateInput").blur(function(){
							if(formSubmitted){
								validateRate();
							}
						});
						
						//validation of duration
						
						let durationCheck=$("#durationCheck");
						durationCheck.hide();
						let durationError=true;
						function validateDuration()
						{
							durationInput=$("#durationInput");
							 if (durationInput.val() == ""){
								 durationCheck.show();
								 durationError=true;
								 durationInput.addClass("is-invalid");
								 durationInput.removeClass("is-valid");	 
							 } else {
							    	 durationCheck.hide();
							    	 durationInput.removeClass("is-invalid");
							    	 durationInput.addClass("is-valid");
									 durationError=false;
							 }
						}
						
						
						$("#pInfoEdit").click(function(){
							$(".form-content").show();
							$("#pInfoEdit").hide();
							$("#pInfoCancel").show();
							$("#categoryCard").removeClass("pb-4");
						}); 
						$("#pInfoCancel").click(function(){
							$(".form-content").hide();
							$("#pInfoCancel").hide();
							$("#pInfoEdit").show();
							$("#categoryCard").addClass("pb-4");
						}); 
						// Submitt button 
						$("#formSubmit").submit(function(e) {
									formSubmitted=true;
									validateProduct();
									validateDiscountType();
									validatePrice();
									validateRate();
									validateDuration();
									if(productError == true || discountTypeError == true || priceError == true || rateError == true || durationError == true){
										return false;
									} else 
									{
										var productId=$("#productData option[value='" + $('#product').val() + "']").attr('data-id');
										$("#product").val(productId);
										return true;
									}

								});
					});
				</script>
</body>
</html>