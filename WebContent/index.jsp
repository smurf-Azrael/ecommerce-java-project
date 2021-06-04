<%@page import="com.kitchenstore.bean.Product"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page="/Home" flush="true" />
<%
    List<Product> fetureProducts = (List) request.getAttribute("fetureProducts");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Kitchen Store The online Shopping</title>

<meta name="keywords" content="Kitchen Store" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="assets/images/icons/favicon.ico" />

<script type="text/javascript">
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700,800" ]
		},
	};
	(function(d) {
		var wf = d.createElement("script"), s = d.scripts[0];
		wf.src = "assets/js/webfont.js";
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/style.min.css" />
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css" />
</head>
<body>
	<!-- Header File -->
	
	<%@include file="header.jsp"%>
	<main class="main">
		<div
			class="home-slider owl-carousel owl-theme owl-carousel-lazy show-nav-hover nav-big mb-2 text-uppercase"
			data-owl-options="{
				'loop': false
			}">
			<div class="home-slide home-slide1 banner">
				<img class="owl-lazy slide-bg" src="assets/images/lazy.png"
					data-src="images/home-slide-1.jpg" alt="slider image" />
				<div class="container">
					<div class="banner-layer banner-layer-middle">
						<h2 class="text-transform-none mb-0">New Sale</h2>
						<h3 class="m-b-3">20% Off</h3>
						<a href="category.html" class="btn btn-dark btn-lg ls-10">Shop
							Now!</a>
					</div>
					<!-- End .banner-layer -->
				</div>
			</div>
			<!-- End .home-slide -->

			<div class="home-slide home-slide2 banner banner-md-vw">
				<img class="owl-lazy slide-bg" src="assets/images/lazy.png"
					data-src="images/home-slide-2.jpg" alt="slider image" />
				<div class="container">
					<div
						class="banner-layer banner-layer-middle d-flex justify-content-center">
						<div class="mx-auto">
							<h4 class="m-b-1">New Microwaves</h4>
							<h3 class="m-b-2">10% off</h3>
							<h3 class="mb-2 heading-border">Appliances</h3>
							<h2 class="text-transform-none m-b-4">New Sale</h2>
							<a href="category.html" class="btn btn-block btn-dark">Shop Now</a>
						</div>
					</div>
					<!-- End .banner-layer -->
				</div>
			</div>
			<!-- End .home-slide -->
			
			<div class="home-slide home-slide2 banner banner-md-vw">
				<img class="owl-lazy slide-bg" src="assets/images/lazy.png"
					data-src="images/home-slide-3.jpg" alt="slider image" />
				<div class="container">
					<div
						class="banner-layer banner-layer-middle d-flex justify-content-center">
						<div class="mx-auto">
							<h4 class="m-b-1">Cookwere</h4>
							<h3 class="mb-2 heading-border">cooking</h3>
							<a href="category.html" class="btn btn-block btn-dark">Shop Now</a>
						</div>
					</div>
					<!-- End .banner-layer -->
				</div>
			</div>
			<!-- End .home-slide -->
			<div class="home-slide home-slide2 banner banner-md-vw">
				<img class="owl-lazy slide-bg" src="assets/images/lazy.png"
					data-src="images/home-slide-4.jpg" alt="slider image" />
				<div class="container">
					<div
						class="banner-layer banner-layer-middle d-flex justify-content-center">
						<div class="mx-auto">
							<h4 class="m-b-1">crockery </h4>
							<h3 class="m-b-2">10% off</h3>
							<h3 class="mb-2 heading-border">Daining</h3>
							<a href="category.html" class="btn btn-block btn-dark">Shop Now</a>
						</div>
					</div>
					<!-- End .banner-layer -->
				</div>
			</div>
			<!-- End .home-slide -->
		</div>
		<!-- End .home-slider -->

		<div class="container">
			<div class="info-boxes-slider owl-carousel owl-theme mb-2"
				data-owl-options="{
					'dots': false,
					'loop': false,
					'responsive': {
						'576': {
							'items': 2
						},
						'992': {
							'items': 3
						}
					}
				}">
				<div class="info-box info-box-icon-left">
					<i class="icon-shipping"></i>

					<div class="info-box-content">
						<h4>FREE SHIPPING </h4>
						<p class="text-body">Free shipping on all orders over &#8377; 500.</p>
					</div>
					<!-- End .info-box-content -->
				</div>
				<!-- End .info-box -->

				<div class="info-box info-box-icon-left">
					<i class="fas fa-rupee-sign"></i>
					<div class="info-box-content">
						<h4>MONEY BACK GUARANTEE</h4>
						<p class="text-body">100% money back guarantee</p>
					</div>
					<!-- End .info-box-content -->
				</div>
				<!-- End .info-box -->

				<div class="info-box info-box-icon-left">
					<i class="icon-support"></i>

					<div class="info-box-content">
						<h4>ONLINE SUPPORT 24/7</h4>
					</div>
					<!-- End .info-box-content -->
				</div>
				<!-- End .info-box -->
			</div>
			<!-- End .info-boxes-slider -->

			<div class="banners-container">
				<div class="banners-slider owl-carousel owl-theme">
					<div class="banner banner1 banner-sm-vw">
						<figure>
							<img src="assets/images/banners/home-banner-1.jpg" alt="banner" />
						</figure>
						<div class="banner-layer banner-layer-middle">
							<h3 class="m-b-2">New Mixers</h3>
							<h4 class="m-b-3 ls-10 text-primary">
								<sup class="text-dark"></sup>10%<sup>OFF</sup>
							</h4>
							<a href="AllProducts?c=Mixer Grinders&id=OXFb-x1eME0=" class="btn btn-sm btn-dark ls-10">Shop Now</a>
						</div>
					</div>
					<!-- End .banner -->

					<div class="banner banner2 banner-sm-vw text-uppercase">
						<figure>
							<img src="assets/images/banners/banner-2.jpg" alt="banner" />
						</figure>
						<div class="banner-layer banner-layer-middle text-center">
							<div class="row align-items-lg-center">
								<div class="col-lg-7 text-lg-right">
									<h3 class="m-b-1">Storage Containers Flask</h3>
									<h4 class="pb-4 pb-lg-0 mb-0 text-body"></h4>
								</div>
								<div class="col-lg-5 text-lg-left px-0 px-xl-3">
									<a href="AllProducts?c=Flask&id=_MBdJZ-9nR0=" class="btn btn-sm btn-dark ls-10">Shop Now</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End .banner -->

					<div class="banner banner3 banner-sm-vw">
						<figure>
							<img src="assets/images/banners/home-banner-3.jpg" alt="banner" />
						</figure>
						<div class="banner-layer banner-layer-middle text-right">
							<h3 class="m-b-2">Cookers</h3>
							<h4 class="m-b-2 text-primary text-uppercase font-weight-bold">Starting at
								&#8377; 999</h4>
							<a href="AllProducts?c=Pressure Cookers&id=BHj6iNhly4c=" class="btn btn-sm btn-dark ls-10">Shop Now</a>
						</div>
					</div>
					<!-- End .banner -->
				</div>
			</div>
		</div>
		<!-- End .container -->

		<section class="featured-products-section">
			<div class="container">
				<h2 class="section-title heading-border ls-20 border-0">Featured
					Products</h2>

				<div
					class="products-slider custom-products owl-carousel owl-theme nav-outer show-nav-hover nav-image-center"
					data-owl-options="{
						'dots': false,
						'nav': true
					}">
					
					<% int cnt=0;
					for(Product product : fetureProducts){ 
						if(cnt%5==0){
					%>
					<div class="product-default">
						<figure>
							<a href="Product?p=<%=product.getProductName()%>&pid=<%=Encryption.encode(Long.toString(product.getProductId()))%>"> <img style="display: block; max-height: 300px; width: auto; height: auto;"
								src="data:image/png/jpeg/jpg;base64,<%=product.getProductThumbString()%>" alt="product" />
							</a>
							<div class="label-group">
								<!-- <div class="product-label label-hot">HOT</div>
								<div class="product-label label-sale">20% Off</div> -->
							</div>
						</figure>
						<div class="product-details">
							<div class="category-list">
								<a href="Product?p=<%=product.getProductName()%>&pid=<%=Encryption.encode(Long.toString(product.getProductId()))%>" class="product-category"><%=product.getCategoryName() %></a>
							</div>
							<h3 class="product-title">
								<a href="Product?p=<%=product.getProductName()%>&pid=<%=Encryption.encode(Long.toString(product.getProductId()))%>"><%=product.getProductName() %></a>
							</h3>
							<div class="price-box">
								<!-- <del class="old-price">$59.00</del> -->
								<span class="product-price"><i class="fas fa-rupee-sign"></i> <%=product.getPrice() %></span>
							</div>
							<!-- End .price-box -->
							<div class="product-action">
								<a class="btn-icon-wish" onclick="goWishlist('<%=product.getProductId()%>')"><i class="icon-heart"></i></a>
								<button class="btn-icon btn-add-cart" onclick="goCart('<%=Encryption.encode(Long.toString(product.getProductId()))%>')"
									>ADD TO CART</button>
								<a href="#" class="btn-quickview"
									title="Quick View"><i class="fas fa-external-link-alt"></i></a>
							</div>
						</div>
						<!-- End .product-details -->
					</div>
				<% }
						cnt++; 
				} %>
				</div>
				<!-- End .featured-proucts -->
			</div>
		</section>

		<section class="new-products-section">
			<div class="container">
				<h2 class="section-title heading-border ls-20 border-0">New
					Arrivals</h2>

				<div
					class="products-slider custom-products owl-carousel owl-theme nav-outer show-nav-hover nav-image-center"
					data-owl-options="{
						'dots': false,
						'nav': true,
						'responsive': {
							'992': {
								'items': 5
							}
						}
					}">
					<% for(int j=0;j<fetureProducts.size();j++){
						Product product=fetureProducts.get(j);
						%>
					<div class="product-default">
						<figure>
							<a href="Product?p=<%=product.getProductName()%>&pid=<%=Encryption.encode(Long.toString(product.getProductId()))%>"> <img style="display: block; max-height: 150px; width: auto; height: auto;"
								src="data:image/png/jpeg/jpg;base64,<%=product.getProductThumbString()%>" alt="product" />
							</a>
							<div class="label-group">
								<!-- <div class="product-label label-hot">HOT</div> -->
							</div>
						</figure>
						<div class="product-details">
							<div class="category-list">
								<a href="ProductCategory?c=<%=product.getCategoryName()%>&cid=<%=Encryption.encode(Integer.toString(product.getCategoryId()))%>" class="product-category"><%=product.getCategoryName() %></a>
							</div>
							<h3 class="product-title">
								<a href="Product?p=<%=product.getProductName()%>&pid=<%=Encryption.encode(Long.toString(product.getProductId()))%>"><%=product.getProductName() %></a>
							</h3>
							<!-- End .product-container -->
							<div class="price-box">
								<!-- <del class="old-price">$59.00</del> -->
								<span class="product-price"><%=product.getPrice() %></span>
							</div>
							<!-- End .price-box -->
							<div class="product-action">
								<a class="btn-icon-wish" onclick="goWishlist('<%=product.getProductId()%>')"><i class="icon-heart"></i></a>
								<button class="btn-icon btn-add-cart" onclick="goCart('<%=Encryption.encode(Long.toString(product.getProductId()))%>')">ADD TO CART</button>
								<a href="ajax/product-quick-view.html" class="btn-quickview"
									title="Quick View"><i class="fas fa-external-link-alt"></i></a>
							</div>
						</div>
						<!-- End .product-details -->
					</div>
				<% } %>
				</div>
				<!-- End .featured-proucts -->

				<h2 class="section-title heading-border border-0 mb-5">Browse
					Categories</h2>

				<div
					class="categories-slider owl-carousel owl-theme show-nav-hover nav-outer">
					<%for(Category category :  categoryMenu){ %>
						<div class="product-category">
							<a href="ProductCategory?c=<%=category.getCategoryName()%>&cid=<%=Encryption.encode(Integer.toString(category.getCategoryId()))%>">
								<figure>
									<img src="https://images.unsplash.com/photo-1484154218962-a197022b5858?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8bW9kZXJuJTIwa2l0Y2hlbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"
										alt="category" />
								</figure>
								<div class="category-content">
									<h3><%=category.getCategoryName() %></h3>
								</div>
							</a>
						</div>
					<% } %>
				</div>
			</div>
		</section>
	</main>
	<div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div id="modalContent"></div>
			</div>
		</div>
	</div>
	<div>
		<div class="modal fade" id="exampleModalCart" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div id="modalContentCart"></div>
			</div>
		</div>
	</div>
	<div>
	<!-- margin -->
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
	<script type="text/javascript">
		function goCart(pId)
		{
			$(document).ready(function() {
		            $.ajax({
		                url: "Cart",
		                type: "POST",
		                data: {
		                    "productId": pId
		                },
		                success: function(
		                    result) {
		                    $(
		                            "#modalContentCart")
		                        .html(
		                            result);
		                    $(
		                            '#exampleModalCart')
		                        .modal(
		                            'show');
		                },
		                error: function(
		                    error) {
		                    $(
		                            "#modalContentCart")
		                        .html(
		                            "<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Somthing went wrong. Please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-danger float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
		                }
		            });
			});
		}
		
		function goWishlist(pId){
			$(document).ready(function() {
				 $.ajax({
		                url: "Wishlist",
		                type: "POST",
		                data: {
		                    "productId": pId
		                },
		                success: function(result) {
		                    $("#modalContent").html(result);
		                    $('#exampleModal').modal('show');
		                },
		                error: function(error) {
		                    $("#modalContent").html("<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Somthing went wrong. Please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-danger float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
		                }
		         });
			});
		}
	           
	</script>
</body>

</html>
