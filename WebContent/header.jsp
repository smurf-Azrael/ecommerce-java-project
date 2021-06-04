<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="com.kitchenstore.bean.SubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.kitchenstore.bean.Category"%>
<%@page import="com.kitchenstore.bean.User"%>
<jsp:include page="/HeaderMenu" flush="true" />
<%
	List<Category> categoryMenu = (List) request.getAttribute("categoryMenu");
List<SubCategory> subCategoryMenu = (List) request.getAttribute("subCategoryMenu");
%>
<div class="page-wrapper">
	<header class="header">

		<div class="header-middle">
			<div class="container">
				<div class="header-left col-lg-2 w-auto pl-0">
					<button class="mobile-menu-toggler mr-2" type="button">
						<i class="icon-menu"></i>
					</button>
					<a href="index.html" class="logo"> <img
						src="assets/images/logo.png" alt="Porto Logo" width="125px"
						height="90px" />
					</a>
				</div>
				<!-- End .header-left -->

				<div class="header-right w-lg-max ml-0">
					<div
						class="header-icon header-search header-search-inline header-search-category w-lg-max pl-3">
						<a href="#" class="search-toggle" role="button"><i
							class="icon-search-3"></i></a>
						<form action="Search" method="Post">
							<div class="header-search-wrapper">
								<input type="search" class="form-control" name="q" id=""
									placeholder="Search for Products, Brands" required />
								<!-- <div class="select-custom">
                      <select id="cat" name="cat">
                        <option value="">All Categories</option>
                        <option value="4">Fashion</option>
                        <option value="12">- Women</option>
                        [ next two line copy for push ]
                        <option value="13">- Men</option>
                         <option value="13">- Men</option>
                        <option value="66">- Jewellery</option>
                        <option value="67">- Kids Fashion</option>
                        <option value="5">Electronics</option>
                        <option value="21">- Smart TVs</option>
                        <option value="22">- Cameras</option>
                        <option value="63">- Games</option>
                        <option value="7">Home &amp; Garden</option>
                        <option value="11">Motors</option>
                        <option value="31">- Cars and Trucks</option>
                        <option value="32">- Motorcycles &amp; Powersports</option>
                        <option value="33">- Parts &amp; Accessories</option>
                        <option value="34">- Boats</option>
                        <option value="57">- Auto Tools &amp; Supplies</option>
                      </select>
                    </div> -->
								<!-- End .select-custom -->
								<button class="btn icon-search-3" type="submit"></button>
							</div>
							<!-- End .header-search-wrapper -->
						</form>
					</div>
					<!-- End .header-search -->

					<div class="header-contact d-none d-lg-flex pl-4 ml-3 mr-xl-5 pr-4">
						<img alt="phone" src="assets/images/phone.png" width="30"
							height="30" class="pb-1" />
						<h6>
							Call us now<a href="tel:#" class="font1">+91 9173827571</a>
						</h6>
					</div>

					<%
						HttpSession loginSession = request.getSession(false);
					if (loginSession == null) {
					%>
					<a href="login.jsp" class="header-icon login-label">Login</a>
					<%
						} else {
					User loginUser = (User) loginSession.getAttribute("loginBean");
					if (loginSession.getAttribute("loginBean") != null) {
					%>
					<div class="dropdown">
						<a href="" class="header-icon" id="myacc"><i
							class="icon-user-2"></i><i class="fas fa-sort-down d-inline ml-2"
							style="font-size: 12px;"></i></a>
						<div class="dropdown-content">
							<a> <span class="pb-2 text-dark font-weight-bold"
								style="font-size: 12px;">Hello, <%=loginUser.getfName()%>
							</span>
							</a> <a href="MyAccount"><i class="fas fa-user-circle mr-3"
								style="font-size: 16px;"></i>My Account</a> <a href="Orders"><i
								class="fas fa-archive mr-3" style="font-size: 14px;"></i>My Orders</a>
							<a href="Logout"><i class="fas fa-power-off mr-3"
								style="font-size: 14px;"></i>Logout</a>
						</div>
					</div>
					<%
						} else {
					%>
					<a href="login.jsp" class="header-icon login-label">Login</a>
					<%
						}
					}
					%>
					<a href="Wishlist" class="header-icon"><i
						class="icon-wishlist-2"></i></a>

					<div class="dropdown cart-dropdown">
						<a href="Cart" class="dropdown-toggle"> <i
							class="icon-shopping-cart"></i> <!--  <span class="cart-count badge-circle">2</span>-->
						</a>
					</div>
					<!-- End .dropdown -->
				</div>
				<!-- End .header-right -->
			</div>
			<!-- End .container -->
		</div>
		<!-- End .header-middle -->

		<div class="header-bottom sticky-header d-none d-lg-block">
			<div class="container">
				<nav class="main-nav w-100">
					<ul class="menu">
						<li><a href="/KitchenStore/">Home</a></li>
						<%
							int menuCnt = 0;
						if (categoryMenu != null) {
							for (Category category : categoryMenu) {
								if (menuCnt > 6) {
						%>
						<li><a >More</a>
							<ul>
								<%
									for (int i = menuCnt; i < categoryMenu.size(); i++) {
									Category moreCategory = categoryMenu.get(i);
								%>
								<li><a
									href="ProductCategory?c=<%=moreCategory.getCategoryName()%>&cid=<%=Encryption.encode(Integer.toString(moreCategory.getCategoryId()))%>"><%=moreCategory.getCategoryName()%></a>
									<%
										boolean flag = false;
									for (SubCategory subCategory : subCategoryMenu) {
										if (moreCategory.getCategoryId() == subCategory.getCategoryId()) {
											flag = true;
											break;
										}
									}
									if (flag == true) {
									%>
									<ul>
										<%
											for (SubCategory subCategory : subCategoryMenu) {
											if (moreCategory.getCategoryId() == subCategory.getCategoryId()) {
										%>
										<li><a
											href="AllProducts?c=<%=subCategory.getSubCategoryName()%>&id=<%=Encryption.encode(Integer.toString(subCategory.getSubCategoryId()))%>"><%=subCategory.getSubCategoryName()%></a></li>
										<%
											}
										}
										%>
									</ul></li>
						<%
							} else {
						%>

						</li>
					</ul>
					</li>

					<%
						}%> 
					<% } %>
					</ul></li>
					<% break ; } else {
					%>

					<li><a
						href="ProductCategory?c=<%=category.getCategoryName()%>&cid=<%=Encryption.encode(Integer.toString(category.getCategoryId()))%>"><%=category.getCategoryName()%></a>
						<%
							boolean flag = false;
						for (SubCategory subCategory : subCategoryMenu) {
							if (category.getCategoryId() == subCategory.getCategoryId()) {
								flag = true;
								break;
							}
						}
						if (flag == true) {
						%>
						<ul>
							<%
								for (SubCategory subCategory : subCategoryMenu) {
								if (category.getCategoryId() == subCategory.getCategoryId()) {
							%>
							<li><a
								href="AllProducts?c=<%=subCategory.getSubCategoryName()%>&id=<%=Encryption.encode(Integer.toString(subCategory.getSubCategoryId()))%>"><%=subCategory.getSubCategoryName()%></a></li>
							<%
								}
							}
							%>
						</ul></li>
					<%
						} else {
					%>

					</li>

					<%
						}
					}
					menuCnt++;
					}

					} else {
					%>
					</li>
					<%
						}
					%>

					<%
						if (loginSession != null) {
						User loginUser = (User) loginSession.getAttribute("loginBean");
						if (loginUser != null) {
							if (loginUser.getIsAdmin() == 1) {
					%>

					<li class="float-right"><a href="Customers">Admin
							Dashboard</a> <span class="tip tip-new tip-top">New</span>
						<ul>
							<li class=""><div
									class="text-capitalize  pl-4 mb-1 text-dark">
									<span class="border-bottom pb-2">Hello, admin </span>
								</div></li>
							<li><a href="Customers">Customer Details</a></li>
							<li><a href="OrderDetails">Orders</a></li>
							<li><a href="ManageFeedback">Feedbacks</a></li>
							<li><a href="Products">Products</a></li>
							<li><a href="Category">Product Category</a></li>
							<li><a href="SubCategory">Product Subcategory</a></li>
							<li><a href="ProductStock">Product Stock</a></li>
							<li><a href="ProductGallery">Product Images</a></li>
							<li><a href="ManageOffers">Product Offer</a></li>
							<li><a href="Logout">Logout</a></li>
						</ul></li>
					<%
						}
					}
					}
					%>
					</ul>
				</nav>
			</div>
			<!-- End .container -->
		</div>
		<!-- End .header-bottom -->
	</header>
	<!--End of header-->