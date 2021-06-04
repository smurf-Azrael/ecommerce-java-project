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

<title>Manage Products</title>

<meta name="keywords" content="Kitchen Store" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="assets/images/icons/favicon.ico">
<style type="text/css">
.p-image {
	cursor: pointer;
}
.product-table-content
{
	vertical-align:middle !important;
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
<link rel="stylesheet" href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/datatables.bootstrap4.min.css" rel="stylesheet">


<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css">
<style type="text/css">
.form-control
{
	font-size: 16px !important;
}
::placeholder { 
  font-size:16px !important;
}
</style>
</head>
<body>
	<% List<Product> productList=(List) request.getAttribute("productList");
		Product productBean=(Product) request.getAttribute("editProduct");
	   String addMsg=(String) request.getAttribute("add");
	   String updateMsg=(String) request.getAttribute("update");
	   String deleteMsg=(String) request.getAttribute("delete");
	   
	   String pname="",des="",moreInfo="",price="",pimage="",pSubCategory="Choose...",pSubCategoryId="";
	   if(productBean!=null)
	   {
		   pname=productBean.getProductName();
		   des=productBean.getDes();
		   price=Float.toString(productBean.getPrice());
		   if(productBean.getMoreIndfo()!=null)
			   moreInfo=productBean.getMoreIndfo();
		   pimage=productBean.getProductThumbString();
			if(productBean.getSubCategoryName()!=null){ 
				pSubCategory=productBean.getSubCategoryName();
				pSubCategoryId=Integer.toString(productBean.getSubCategoryId());
			}
	   }
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
					<div class="ml-3">
						<div class=" text-center">
							<h2>Manage Products</h2>
						</div>

							<div class="d-flex mt-5">
								<a
									class="btn btn-light text-capitalize p-3 px-4 mr-1 text-dark rounded" href="ProductStock"><i
									class="fas fa-layer-group mr-3"></i>Product Stocks</a>
									<a class="btn btn-light text-capitalize p-3 px-4 ml-2 text-dark rounded" href="ProductGallery"><i
									class="fas fa-image mr-2"></i>Product images</a>
									<a href="ManageOffers" class="btn btn-light text-capitalize p-3 px-4 ml-2 text-dark rounded"><i
									class="fas fa-tags mr-2"></i>Discount,Offers</a>
									
							</div>
						<div class="pt-4 pl-5 pr-4 pb-4 mb-3 mt-1" id="categoryCard"
							style="background-color: #F2F3F4";>
							<span class="text-primary font-weight-bold"
								style="cursor: pointer; font-size: 1.6rem;" id="pInfoEdit"><i
								class="fas fa-plus mr-2"></i> <% if(productBean!=null){ %> Edit
								Product <% } else { %> New Product <% } %> </span> <span
								class="text-primary font-weight-bold"
								style="cursor: pointer; font-size: 1.6rem;" id="pInfoCancel">Cancel</span>
							<div class="form-content mt-4">
								<% if(productBean!=null){ %>
								<h4 class="mt-2">Edit Product</h4>
								<% } %>
								<form action="Products" method="POST" class="needs-validation"
									id="formSubmit" enctype="multipart/form-data" novalidate>
									<div class="form-group row">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-normal"
											style="font-size: 14px;">Product Name</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="inputproduct"
												name="name" value="<%=pname %>" required>
											<div class="invalid-feedback">Please enter product
												name.</div>
										</div>
									</div>
									<div class="form-group row">
										<label for="inputdes"
											class="col-sm-2 col-form-label font-weight-normal align-self-center"
											style="font-size: 14px;">Description</label>
										<div class="col-sm-9">
											<textarea class="form-control" required id="inputdes"
												name="des"><%=des %></textarea>
											<div class="invalid-feedback">Please enter Description.</div>
										</div>
									</div>
									<div class="form-group row">
										<label for="inputmoreinfo"
											class="col-sm-2 col-form-label font-weight-normal align-self-center"
											style="font-size: 14px;">More info</label>
										<div class="col-sm-9">
											<textarea class="form-control" id="inputmoreinfo"
												name="moreinfo"><%=moreInfo %></textarea>
										</div>
									</div>


									<div class="form-group row">
										<label for="inputproduct"
											class="col-sm-2 col-form-label font-weight-normal"
											style="font-size: 14px;">Price</label>
										<div class="col-sm-4">
											<input type="number" class="form-control" id="inputproduct"
												step="0.01" name="price" value="<%=price %>" required>
											<div class="invalid-feedback">Please enter price.</div>
										</div>
									</div>

									<div class="form-group row">
										<label for="category"
											class="col-sm-2 col-form-label font-weight-normal"
											style="font-size: 14px;">Product Category</label>
										<div class="col-sm-4">
											<div class="input-group">
												<select class="custom-select form-control" id="category"
													name="category" required>
													<option value="">Choose...</option>
													<%
														for (Category category : categoryMenu) { 
															String isSelected="";
															if(productBean!=null)
															{
																if(category.getCategoryId()==productBean.getCategoryId())
																{
																	isSelected="selected";
																}
															}
														%>
													<option value="<%=category.getCategoryId()%>" <%=isSelected%>><%=category.getCategoryName() %></option>
													<% } %>
												</select>
												<div class="invalid-feedback">Please select category.</div>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label for="inputGroupSelect01"
											class="col-sm-2 col-form-label font-weight-normal"
											style="font-size: 14px;">Product Sub Category</label>
										<div class="input-group col-sm-4" id="subcategory">
											<select class="custom-select form-control"
												id="inputGroupSelect01" name="subcategory">
												<option value="<%=pSubCategoryId%>"><%=pSubCategory %></option>
											</select>
										</div>
									</div>
									<div class="form-group row pt-3">
										<label for="inputimage"
											class="col-sm-2 col-form-label font-weight-normal"
											style="font-size: 14px;">Product image</label>
										<div class="col-sm-4">
											<%
												if (productBean != null) {
											%>
											<div class="mb-1">
												<img
													src="data:image/png/jpeg/jpg;base64,<%=productBean.getProductThumbString()%>"
													onclick="getSrc(this.src);" class="img-thumbnail p-image" width="100px" height="100px"
													alt="<%=productBean.getProductName()%>">
												<p class="mt-1">(Note : If you want to change the image please select a new image below otherwise click on save.)</p>
											</div>
											<% } %>
											<div class="form-group">
												<div class="d-flex">
												<%
												if (productBean != null) { %> 
													<label style="font-size:1.3rem" for="file">Select new image (jpeg/jpg/png)</label> 
												<% } else { %> 
													<label style="font-size:1.3rem" for="file">image (jpeg/jpg/png)</label> 		
												<% } %>
												<span class="text-primary font-weight-bold pl-4"
														style="cursor: pointer; font-size: 1.4rem"
														id="clearField">Clear</span>
												</div>
												<input
													type="file" class="form-control-file" id="file"
													name="productthumb" 
													<%if(productBean==null){ %>
														required
													<% } %>
													>
												<div class="invalid-feedback">Please select image.</div>
												<div class="text-danger image-check mt-1">image file
													must be .png, .jpeg, or .jpg format and file size must be
													less than 1MB.</div>
											</div>
											
										</div>
									</div>
									<% if(productBean!=null){ %>
													<input type="hidden" value="<%=Encryption.encode(Long.toString(productBean.getProductId()))%>" name="pid"> 
													<% } %>
									<div class="form-group row">
										<div class="col-sm-10">
											<button type="submit" class="btn btn-primary">Save</button>
										</div>
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
								<strong>New Product added!</strong>
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
								<strong>Product not added! Please try again later</strong>
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
								<strong>Product updated!</strong>
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
								<strong>Product not updated! Please try again later</strong>
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
								<strong>Product deleted!</strong>
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
								<strong>Product not deleted! Please try again later</strong>
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
							<thead class="text-white text-center" style="background-color:#0088cc;">
								<tr class="">
									<th>Sr No.</th>
									<th>Thumbnil</th>
									<th>Product Name</th>
									<th>Category</th >	
									<th>Subcategory</th >																		
									<th>Price</th >	
									<th>Available Stock</th>
									<th>Edit</th>																		
									<th>Delete</th>																		
								</tr>
							</thead>
							<tbody>
								<%
									int i=1;
									for (Product product : productList) {
								%>
								<tr>
									<td class="product-table-content"><%=i++ %></td>
									<td><img src="data:image/png/jpeg/jpg;base64,<%=product.getProductThumbString() %>" onclick="getSrc(this.src);" class="img-thumbnail p-image" alt="<%=product.getProductName()%>" width="100px" height="100px"></td>
									<td class="product-table-content"><%=product.getProductName() %></td>
									<td class="product-table-content"><%=product.getCategoryName() %></td>
									<td class="product-table-content"><%=product.getSubCategoryName() %></td>
									<td class="product-table-content"><%=product.getPrice() %></td>
									<td class="product-table-content text-center"><%=product.getProductStock() %><a href="ProductStock?stock=<%=Encryption.encode("true") %>&uid=<%=Encryption.encode(Long.toString(product.getProductId())) %>"
										 class="text-primary"
										style="font-size: 14px; cursor: pointer; margin-left:10%;" data-toggle="tooltip" data-placement="top" title="Update Stock"><i
											class="fas fa-external-link-alt"></i></a></td>
									<td class="text-center product-table-content" ><a href="Products?edit=<%=Encryption.encode("true") %>&uid=<%=Encryption.encode(Long.toString(product.getProductId())) %>"
										 class="text-success"
										style="font-size: 16px; cursor: pointer;"><i
											class="fas fa-edit"></i></a></td>
									<td class="text-center product-table-content"><a class="text-secondary" style="font-size:16px;cursor:pointer;" role="button" data-toggle="modal" data-target="#exampleModal"
													onclick="getDelId(<%=Long.toString(product.getProductId()) %>)"><i class="fas fa-trash"></i></a></td>	
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
						<div class="exportAs">
							<a class="btn btn-primary btn-sm text-white rounded-pill" id="exportBtn"><i class="fas fa-download mr-3 p-1" style="font-size:18px;"></i> Export As .CSV </a>
						</div>
						<!-- The Modal -->
						<div id="myModal" class="iModal">
							<span class="iClose py-1 px-3">&times;</span>
							<!-- Modal Content (The Image) -->
							<img class="iModal-content" id="img01">
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
							<li class="active"><a href="Products"><i
									class="fas fa-database mx-2"></i>Manage Products</a></li>
							<li class=""><a href="ProductStock"><i
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
		<!-- Alert Box -->
		<!-- Modal -->
		<div>
			<div class="modal fade" id="exampleModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="p-4 mr-3">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body text-center"><h4 style="color:#454545;">Are you sure to delete Product ?</h4></div>
						<div class="mb-4 text-center">
							<button type="button" class="btn btn-sm btn-secondary mr-3"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-sm btn-danger"><a id="takeid" class="text-white">Delete</a></button>
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
				var strLink = "RemoveProduct?id=" + id;
				document.getElementById("takeid").setAttribute("href", strLink);
			}	
    </script>
	<script>
					$(document).ready(function() {
						$('#dataTable').DataTable();				
						<%if(productBean!=null){%>
							$(".form-content").show();
							$("#pInfoEdit").hide();
							$("#pInfoCancel").show();
							$("#categoryCard").removeClass("pb-4");
						<% } else {%>
							$(".form-content").hide();
							$("#pInfoCancel").hide();
						<% } %>
						
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
							
							$("#category").change(function() {
								 var id = $("#category").val();
								 if(id=="")
								 {
									 id="0";
								 }
								 $.ajax({
								        type: "POST",
								        url: "GetSubcategory",
								        data: {
								        	"id":id
								        },
								        success: function(result) {
								            document.getElementById("subcategory").innerHTML = result;
								        }
								    });
							});
							
						//Image Validation
						var imageEmpty=false;
						var validExt = ".png,.jpeg,.jpg";
						function fileExtValidate(fdata) {
							 var filePath = fdata.value;
							 if(filePath == "")
							 {
								 $(".image-check").hide();
								 imageCheck=false;
								 imageEmpty=true;
									 return false;
							 }
							 else 
						 	 {
								 var getFileExt = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
								 var pos = validExt.indexOf(getFileExt);
								 if(pos < 0) {
								 	return false;
								  } else {
								  	return true;
								  }
						 	 }
						}
						
						var maxSize = '1024';
						function fileSizeValidate(fdata) {
							 if (fdata.files && fdata.files[0]) {
						                var fsize = fdata.files[0].size/1024;
						                if(fsize > maxSize) {
						                	 return false;
						                } else {
						                	return true;
						                }
						     }
						 }
						var imageCheck=true;
						$("#clearField").hide();
						$(".image-check").hide();
						$("#file").change(function () {
							<% if(productBean!=null){%>
								$("#clearField").show();
							<% } %>
						    if(fileExtValidate(this)) {
						    	 if(fileSizeValidate(this)) {
						    		 imageCheck=true;
						    		 $(".image-check").hide();
						    	 }
						    	 else 
						    	 {
						    		 imageCheck=false;
						    		 $(".image-check").show();
						    	 }
						    } else if(imageEmpty==false)
						    {
						    	imageCheck=false;
					    		 $(".image-check").show();
						    }   
					    });
						$("#clearField").click(function() {
							$("#file").val("");
							$(".image-check").hide();
							imageCheck=true;
							$(this).hide();
						});		
						(function() {
							  'use strict';
							  window.addEventListener('load', function() {
							    // Fetch all the forms we want to apply custom Bootstrap validation styles to
							    var forms = document.getElementsByClassName('needs-validation');
							    // Loop over them and prevent submission
							    var validation = Array.prototype.filter.call(forms, function(form) {
							      form.addEventListener('submit', function(event) {
							        if (form.checkValidity() === false || imageCheck==false) {
							          event.preventDefault();
							          event.stopPropagation();
							        }
							        form.classList.add('was-validated');
							      }, false);
							    });
							  }, false);
							})();
					});
				
					var exportBtn = document.getElementById("exportBtn");
					
					exportBtn.addEventListener("click", function(e){
					const rows = [];
					let tableRow="";
					<% i = 1;
					for (Product product : productList) { %>
							tableRow=["<%=i++%>","<%=product.getProductName()%>","<%=product.getCategoryName()%>","<%=product.getSubCategoryName()%>","<%=product.getProductStock()%>","<%=product.getPrice()%>"];
							rows.push(tableRow);
							tableRow="";
					<% }%>
					let csvContent = "data:text/csv;charset=utf-8,Sr No,Product Name,Category Name, Subcategory Name, Available Stock,Price\r\n";

					rows.forEach(function(rowArray) {
						 let row = rowArray.join(" andSperator ");
						 row=row.replace(/,/g , ' ');
						 row=row.replace(/ andSperator /g , ',');
						 csvContent += row + "\r\n";
					});
					var encodedUri = encodeURI(csvContent);
					exportBtn.setAttribute("href", encodedUri);
					let today=new Date();
					exportBtn.setAttribute("download", "products_" + today.getDate() + "-" + today.getMonth() + "-" + today.getFullYear() + ".csv");
					});			
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