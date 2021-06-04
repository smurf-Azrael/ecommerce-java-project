<%@page import="com.kitchenstore.bean.Feedback"%>
<%@page import="com.kitchenstore.bean.ProductImage"%>
<%@page import="com.kitchenstore.bean.Product"%>
<%@page import="com.kitchenstore.bean.Category"%>
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="java.util.List"%>
<%@page import="com.kitchenstore.bean.User"%>
<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	Product product = (Product) request.getAttribute("product");
List<ProductImage> productImages = (List) request.getAttribute("productImages");
List<Product> reletedProduct = (List) request.getAttribute("reletedProduct");
String sortDes = "";
float productPrice=0;
for (int i = 0; i < product.getDes().length(); i++) {
	if (i == 100) {
		break;
	}
	sortDes += product.getDes().charAt(i);
} ;

int reviewCount=0;
if(product.getFeedbackList().size()>0){
  reviewCount=product.getFeedbackList().size();
} 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title><%=product.getProductName()%> | Kitchen Store</title>

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
<link rel="stylesheet" href="assets/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/css/datatables.bootstrap4.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css">
<style type="text/css">
::placeholder {
	font-size: 16px !important;
}
</style>
</head>
<body>
	<!-- Header File -->
	<%@include file="header.jsp"%>

	<main class="main">
		<div class="container">
			<nav aria-label="breadcrumb" class="breadcrumb-nav">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/KitchenStore/"><i
							class="icon-home"></i></a></li>
				</ol>
			</nav>
			<div class="product-single-container product-single-default">
				<div class="row">
					<div class="col-md-5 product-single-gallery">
						<div class="product-slider-container">
							<div class="product-single-carousel owl-carousel owl-theme">
								<%
									for (ProductImage productImage : productImages) {
								%>
								<div class="product-item">
									<img class="product-single-image"
										style="display: block; max-height: 400px; width: auto; height: auto;"
										src="data:image/png/jpeg/jpg;base64,<%=productImage.getProductImageString()%>"
										data-zoom-image="data:image/png/jpeg/jpg;base64,<%=productImage.getProductImageString()%>" />
								</div>
								<%
									}
								%>
							</div>
							<!-- End .product-single-carousel -->
							<span class="prod-full-screen"> <i class="icon-plus"></i>
							</span>
						</div>
						<div class="prod-thumbnail owl-dots" id='carousel-custom-dots'>
							<%
								for (ProductImage productImage : productImages) {
							%>
							<div class="owl-dot">
								<img style="max-height: 100px"
									src="data:image/png/jpeg/jpg;base64,<%=productImage.getProductImageString()%>" />
							</div>
							<%
								}
							%>

						</div>
					</div>
					<!-- End .product-single-gallery -->

					<div class="col-md-7 product-single-details">
						<h1 class="product-title"><%=product.getProductName()%></h1>

						<div class="ratings-container">
							<a href="#" class="rating-link">( Rate & Reviews )</a>
						</div>
						<!-- End .ratings-container -->

						<hr class="short-divider">

						<div class="price-box">
							<%
								if (product.getDiscountPrice() > 0) {
									productPrice=product.getDiscountPrice();
							%>
							<span class="old-price"> &#8377; <%=product.getPrice()%></span> <span
								class="product-price">&#8377; <%=product.getDiscountPrice()%></span>
							<%
								} else { productPrice=product.getPrice();
							%>
							<span class="product-price">&#8377; <%=product.getPrice()%></span>
							<%
								}
							%>
						</div>
						<!-- End .price-box -->
						<div class="product-desc">
							<p>
								<%=sortDes%>
								<a href="#" class="des-link tex-primary">read more</a>
							</p>
						</div>
						<!-- End .product-desc -->
						<div
							style="margin-top: -4% !important; margin-bottom: 1% !important;">
							<%if(product.getProductStock()>0){ %>
							<% } else { %>
								<h4 class="text-danger pt-2">Out of Stock !</h4	>
								<p>We will notify via email when product come in stock.</p>
							<% } %>
						</div>
						<!-- End .product single-share -->
						<div class="product-action">
							<%if(product.getProductStock()>0){ %>
								<div class="mt-5"></div>
								<form action="BuyProducts" target="_blank" method="POST" class="d-inline">
								<div class="product-single-qty">
									<input class="horizontal-quantity form-control" name="singleProductQty" type="text" readonly="readonly">
								</div>
								<input type="hidden" value="<%=Encryption.encode(Long.toString(product.getProductId())) %>" name="singleProductId" />
								<input type="hidden" value="<%=Encryption.encode(Float.toString(productPrice)) %>" name="singleProductPrice" />
									<!-- End .product-single-qty -->
								
								<button type="submit" class="btn btn-success add-cart mr-1"
									title="Buy Now"><i class="fas fa-bolt mr-3"></i>Buy Now </button> 
								</form>
								<a href="" class="btn btn-dark add-cart icon-shopping-cart"
									title="Add to Cart" id="cart">Add to Cart</a> 
								<hr class="divider mb-0">
								<a href="#"
									class="add-wishlist" id="wishlist" title="Add to Wishlist">Add
									to Wishlist</a>
							<% } else { %>
								<a href="" class="btn btn-dark add-cart" id="notify"
									title="Notify Me"><i class="fas fa-bell mr-3"></i>Notify Me </a>
							<% } %>
						</div>
						<!-- End .product-action -->


					</div>
					<!-- End .product-single-details -->
				</div>
				<!-- End .row -->
			</div>
			<!-- End .product-single-container -->

			<div class="product-single-tabs">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="product-tab-desc" data-toggle="tab"
						href="#product-desc-content" role="tab"
						aria-controls="product-desc-content" aria-selected="true">Description</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="product-tab-more-info" data-toggle="tab"
						href="#product-more-info-content" role="tab"
						aria-controls="product-more-info-content" aria-selected="false">More
							Info</a></li>
					<li class="nav-item"><a class="nav-link"
						id="product-tab-reviews" data-toggle="tab"
						href="#product-reviews-content" role="tab"
						aria-controls="product-reviews-content" aria-selected="false">Rate & Reviews
							<%if(reviewCount>0){ %>
								(<%=reviewCount %>)
							<%} %>
							</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="product-desc-content"
						role="tabpanel" aria-labelledby="product-tab-desc">
						<div class="product-desc-content">
							<p><%=product.getDes()%></p>

						</div>
						<!-- End .product-desc-content -->
					</div>
					<!-- End .tab-pane -->

					<div class="tab-pane fade fade" id="product-more-info-content"
						role="tabpanel" aria-labelledby="product-tab-more-info">
						<div class="product-desc-content">
							<p><%=product.getMoreIndfo()%></p>
						</div>
						<!-- End .product-desc-content -->
					</div>
					<!-- End .tab-pane -->



					<div class="tab-pane fade" id="product-reviews-content"
						role="tabpanel" aria-labelledby="product-tab-reviews">
						<div class="product-reviews-content">
							<div class="row">
								<div class="col-xl-7">
									<%if(reviewCount>0){ %>
									<h2 class="reviews-title"><%=reviewCount %> Review for <%=product.getProductName() %></h2>
									<ol class="comment-list">
										<% for(Feedback feedback : product.getFeedbackList()){ %>
										<li class="comment-container">
											<div class="comment-avatar">
												<div class="position-relative">
													<img src="assets/images/avatar/feedback-avatar.jpg" width="50"
														height="50" alt="avatar" />
													<span class="font-weight-bold text-light" style="position: absolute;top:15%;left:27%;font-size:1.8rem;"><%=feedback.getfName().charAt(0) %><%=feedback.getlName().charAt(0) %></span>
												</div>
											</div> <!-- End .comment-avatar-->
											<div class="comment-box">
												<div class="ratings-container">
													<div class="product-ratings">
														<span class="ratings" style="width: <%=feedback.getRate() * 20 %>%"></span>
														<!-- End .ratings -->
													</div>
													<!-- End .product-ratings -->
												</div>
												<!-- End .ratings-container -->

												<div class="comment-info mb-1">
													<h4 class="avatar-name"><%=feedback.getfName() %> <%=feedback.getlName() %></h4>
													- <span class="comment-date"><%=feedback.getFeedbackDate() %></span>
												</div>
												<!-- End .comment-info -->

												<div class="comment-text">
													<p><%=feedback.getDes() %></p>
												</div>
												<!-- End .comment-text -->
											</div> <!-- End .comment-box -->
										</li>
										<!-- comment-container -->
										<% } %>
									</ol>
									<!-- End .comment-list -->
									<% } else { %>
										<h2 class="reviews-title">Not reviewed yet</h2>
									<% } %>
								</div>
								<div class="col-xl-5"></div>
								
							</div>
						</div>
						<!-- End .product-reviews-content -->
					</div>
					<!-- End .tab-pane -->
				</div>
				<!-- End .tab-content -->
			</div>
			<!-- End .product-single-tabs -->

			<div class="products-section pt-0">
				<h2 class="section-title">Related Products</h2>
				<div class="products-slider owl-carousel owl-theme dots-top">
					<%
						int cnt = 1;
					for (Product rProduct : reletedProduct) {
						if (cnt == 15) {
							break;
						}
						if (product.getProductId() == rProduct.getProductId()) {
							continue;
						}
					%>
					<div class="product-default inner-quickview inner-icon">
						<figure>
							<a
								href="Product?p=<%=rProduct.getProductName()%>&pid=<%=Encryption.encode(Long.toString(rProduct.getProductId()))%>">
								<img
								src="data:image/png/jpeg/jpg;base64,<%=rProduct.getProductThumbString()%>"
								style="display: block; max-width: 250px; max-height: 200px; width: auto; height: auto;" />
							</a>
							<%
								if (rProduct.getDiscount() > 0) {
							%>
							<div class="label-group">
								<div class="product-label label-hot"><%=(int) (rProduct.getDiscount())%>
									% OFF
								</div>
							</div>
							<%
								}
							%>
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

									<a href="category.html" class="product-category"> <%=rProduct.getSubCategoryName()%></a>

								</div>
							</div>
							<h3 class="product-title">
								<a
									href="Product?p=<%=rProduct.getProductName()%>&pid=<%=Encryption.encode(Long.toString(rProduct.getProductId()))%>"><%=rProduct.getProductName()%></a>
							</h3>
							<div class="price-box">
								<%
									if (rProduct.getDiscountPrice() > 0) {
								%>
								<span class="old-price"> &#8377; <%=rProduct.getPrice()%></span>
								<span class="product-price">&#8377; <%=rProduct.getDiscountPrice()%></span>
								<%
									} else {
								%>
								<span class="product-price">&#8377; <%=rProduct.getPrice()%></span>
								<%
									}
								%>
							</div>
							<!-- End .price-box -->
						</div>
						<!-- End .product-details -->
					</div>
					<%
						cnt++;
					}
					%>
				</div>
				<!-- End .products-slider -->
			</div>
			<!-- End .products-section -->
		</div>
		<!-- End .container -->
	</main>
	<!-- End .main -->
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
		<div class="modal fade" id="exampleModalNotify" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div id="modalContentNotify"></div>
			</div>
		</div>
	</div>
	<!-- Footer File -->
	<%@include file="footer.jsp"%>

	<!-- Plugins JS File -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/optional/isotope.pkgd.min.js"></script>
	<script src="assets/js/plugins.min.js"></script>
	<!-- Main JS File -->
	<script src="assets/js/main.min.js"></script>
	<script type = "text/javascript" >
    $(document).ready(function() {
        $("#wishlist").click(function(e) {
            e.preventDefault();
            $.ajax({
                url: "Wishlist",
                type: "POST",
                data: {
                    "productId": "<%=product.getProductId()%>"
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
        $("#cart").click(function(e) {
            e.preventDefault();
            $.ajax({
                url: "Cart",
                type: "POST",
                data: {
                    "productId": "<%=Encryption.encode(Long.toString(product.getProductId()))%>"
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
        $("#notify").click(function(e) {
            e.preventDefault();
            $.ajax({
                url: "NotifyMe",
                type: "POST",
                data: {
                    "productId": "<%=product.getProductId()%>"
                },
                success: function(result) {
                    $("#modalContentNotify").html(result);
                    $('#exampleModalNotify').modal('show');
                },
                error: function(error) {
                    $("#modalContentNotify").html("<div class='modal-content'><div class='p-4 mr-3'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>×</span> </button></div><div class='modal-body text-center'><h4 style='color: #454545;'>Opps ! Somthing went wrong. Please try again later.</h4></div><div class='mb-4 text-center'> <button type='button' class='btn btn-sm btn-danger float-right mx-4' data-dismiss='modal'>Ok</button></div></div>");
                }
            });
        });
    }); 
  </script>

</body>
</html>