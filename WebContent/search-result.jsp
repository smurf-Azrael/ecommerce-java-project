<%@page import="com.kitchenstore.bean.Product"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	List<Product> productList = (List) request.getAttribute("serchItems");
	String query= (String) request.getAttribute("query");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Search Results</title>

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
						<li class="breadcrumb-item active" aria-current="page">Search Results</li>
					</ol>
				</div>
				<!-- End .container -->
			</nav>

			<div class="row">
				<%if(productList.size()>0){ %>
				<div class="col-lg-9 main-content">
					<!-- <nav class="toolbox">
						<div class="toolbox-left">
							<div class="toolbox-item toolbox-sort">
								<label>Sort By:</label>

								<div class="select-custom">
									<select name="orderby" class="form-control">
										<option value="menu_order" selected="selected">Default
											sorting</option>
										<option value="popularity">Sort by popularity</option>
										<option value="rating">Sort by average rating</option>
										<option value="date">Sort by newness</option>
										<option value="price">Sort by price: low to high</option>
										<option value="price-desc">Sort by price: high to low</option>
									</select>
								</div>
								End .select-custom


							</div>
							End .toolbox-item
						</div>
						End .toolbox-left

						<div class="toolbox-right">
							<div class="toolbox-item toolbox-show">
								<label>Show:</label>

								<div class="select-custom">
									<select name="count" class="form-control">
										<option value="12">12</option>
										<option value="24">24</option>
										<option value="36">36</option>
									</select>
								</div>
								End .select-custom
							</div>
							End .toolbox-item

							<div class="toolbox-item layout-modes">
								<a href="category.html" class="layout-btn btn-grid active"
									title="Grid"> <i class="icon-mode-grid"></i>
								</a> <a href="category-list.html" class="layout-btn btn-list"
									title="List"> <i class="icon-mode-list"></i>
								</a>
							</div>
							End .layout-modes
						</div>
						End .toolbox-right
					</nav> -->
					<h4 class="my-3 text-primary"><i class="fa fa-search mr-2"></i>Search results for "<%=query%>"</h4>
					<div class="row mt-5">
							<%
								for (Product product : productList) {
							%>
								<div class="col-6 col-sm-4">
									<div class="product-default inner-quickview inner-icon">
										<figure>
											<a
												href="Product?p=<%=product.getProductName()%>&pid=<%=Encryption.encode(Long.toString(product.getProductId()))%>">
												<img class="img-fluid"
												src="data:image/png/jpeg/jpg;base64,<%=product.getProductThumbString()%>"
												style="display: block; max-width: 250px; max-height: 200px; width: auto; height: auto;">
											</a>
											<!-- 
										<div class="product-label label-hot">HOT</div>-->
											<% if(product.getDiscount()>0){%>
												<div class="label-group">
													<div class="product-label label-hot"><%=(int)(product.getDiscount())%> % OFF</div>
												</div>
											<% } %>
											<div class="btn-icon-group">
												<button class="btn-icon btn-add-cart" data-toggle="modal"
													data-target="#addCartModal">
													<i class="icon-shopping-cart"></i>
												</button>
											</div>
										</figure>
										<div class="product-details">
											<div class="category-wrap">
												<div class="category-list">
													<a
														href="ProductCategory?c=<%=product.getCategoryName()%>&cid=<%=Encryption.encode(Integer.toString(product.getCategoryId()))%>"
														class="product-category"><%=product.getCategoryName()%></a>
													<span> / </span> <a
														href="AllProducts?c=<%=product.getSubCategoryName()%>&id=<%=Encryption.encode(Integer.toString(product.getSubCategoryId()))%>"
														class="product-category"><%=product.getSubCategoryName()%></a>
												</div>
												<a href="#" class="btn-icon-wish"><i class="icon-heart"></i></a>
											</div>
											<h2 class="product-title my-3">
												<a
													href="Product?p=<%=product.getProductName()%>&pid=<%=Encryption.encode(Long.toString(product.getProductId()))%>"><%=product.getProductName()%></a>
											</h2>
											
											<div class="price-box">
												<% 
												if(product.getDiscountPrice()>0){ %>
													<span class="old-price"> &#8377; <%=product.getPrice() %></span> 
													<span class="product-price">&#8377; <%=product.getDiscountPrice()%></span>
												<% } else { %>
													<span class="product-price">&#8377; <%=product.getPrice()%></span>
												<% } %>
											</div>
											<!-- End .price-box -->
										</div>
										<!-- End .product-details -->
									</div>
								</div>
								<!-- End .col-sm-4 -->
							<tr />
							<%
								}
							%>
						</table>
					</div>
					<!-- End .row -->

					<!-- <nav class="toolbox toolbox-pagination">
						<div class="toolbox-item toolbox-show">
							<label>Show:</label>

							<div class="select-custom">
								<select name="count" class="form-control">
									<option value="12">12</option>
									<option value="24">24</option>
									<option value="36">36</option>
								</select>
							</div>
							End .select-custom
						</div>
						End .toolbox-item

						<ul class="pagination toolbox-item">
							<li class="page-item disabled"><a
								class="page-link page-link-btn" href="#"><i
									class="icon-angle-left"></i></a></li>
							<li class="page-item active"><a class="page-link" href="#">1
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><span class="page-link">...</span></li>
							<li class="page-item"><a class="page-link page-link-btn"
								href="#"><i class="icon-angle-right"></i></a></li>
						</ul>
					</nav> -->
				</div>
				<!-- End .col-lg-9 -->

				<div class="sidebar-overlay"></div>
				<div class="sidebar-toggle">
					<i class="fas fa-sliders-h"></i>
				</div>
				<aside class="sidebar-shop col-lg-3 order-lg-first mobile-sidebar">
					<div class="sidebar-wrapper">
						<div class="widget">
							<h3 class="widget-title">
								<a data-toggle="collapse" href="#widget-body-2" role="button"
									aria-expanded="true" aria-controls="widget-body-2">Categories</a>
							</h3>

							<div class="collapse show" id="widget-body-2">
								<div class="widget-body">
									<ul class="cat-list">
										<%
											if (categoryMenu != null) {
											for (Category category : categoryMenu) {
										%>
										<li><a
											href="ProductCategory?c=<%=category.getCategoryName()%>&cid=<%=Encryption.encode(Integer.toString(category.getCategoryId()))%>"><%=category.getCategoryName()%></a></li>
										<%
											}
										}
										%>
									</ul>
								</div>
								<!-- End .widget-body -->
							</div>
							<!-- End .collapse -->
						</div>
						<!-- End .widget -->
						</div>
						<!-- End .widget -->
					</div>
					<!-- End .sidebar-wrapper -->
				</aside>
				<!-- End .col-lg-3 -->
			<% } else { %>
				<div class="container mb-5 pb-5">
			
			<div class="">
				<div class="text-center d-flex align-items-center justify-content-center">
					<img class="img-flud" src="images/order-failed.jpg" width="500" height="300" />
				</div>
				<div class="text-center">
					<h2>Oops! We couldn't find results for your search: <%=query %></h2>
					<a href="/KitchenStore/" class="btn btn-sm btn-outline-dark text-capitalize" style="font-size:1.5rem;">Go Home</a>
				</div>
			</div>
			<!-- End .row -->
		</div>
			<% } %>
			</div>
			<!-- End .row -->
		</div>
		<!-- End .container -->
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
	<script src="assets/js/nouislider.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="assets/js/jquery.datatables.min.js"></script>
	<script src="assets/js/datatables.bootstrap4.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTable').DataTable();
		});
	</script>
</body>
</html>