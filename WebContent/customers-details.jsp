<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="java.util.List"%>
<%@page import="com.kitchenstore.utilities.BCrypt"%>
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

<title>My Account</title>

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
</head>
<body>

	<!-- Header File -->
	<%@include file="header.jsp"%>
	
	<% List<User> customerList= (List<User>) request.getAttribute("customers"); 
		String isDeleted = (String) request.getAttribute("isdeleted");
	%>

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
							<h2>Manage Customers</h2>
						</div>
						<%
						if (isDeleted != null) {
						if (isDeleted.equalsIgnoreCase(Encryption.encode("true"))) {
					%>
					<div class="row">
						<div class="col-md-12">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Customer deleted!</strong>
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
						<div class="col-md-12">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Customer not deleted! Please try again
									later</strong>
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
							<thead class="text-white" style="background-color:#0088cc;">
								<tr class="">
									<th># Sr No.</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email Address</th>
									<th>Gender</th>
									<th>Mobile Number</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<% int i=1;
										for(User customer : customerList){ %>
								<tr class="text-dark bg-light">
									<td class="text-center"><%=i++ %></td>
									<td><%=customer.getfName() %></td>
									<td><%=customer.getlName() %></td>
									<td><%=customer.getEmail() %></td>
									<% if(customer.getGender()!=null){
										if(customer.getGender().equalsIgnoreCase("M")){%>
											<td>Male</td>
										<% } else { %>
											<td>Female</td>
										<% }
									 } else { %>
									 	<td>-</td>
									 <% } %>
									 
									 <% if(customer.getContact()!=null){ %>
										 <td><%=customer.getContact() %></td>
									 <% } else { %>
									 	<td>-</td>
									 <% } %>
									 <td class="text-center"><a class="text-secondary" style="font-size:16px;cursor:pointer;" role="button" data-toggle="modal" data-target="#exampleModal"
													onclick="getDelId(<%=Long.toString(customer.getUserId())%>)"><i class="fas fa-trash"></i></a></td>	
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
							<li class="active"><a href="Customers"><i
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
						<div class="modal-body text-center"><h4 style="color:#454545;">Are you sure to delete customer ?</h4></div>
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
			var strLink = "RemoveCustomer?id=" + id;
			document.getElementById("takeid").setAttribute("href", strLink);
		}
		$(document).ready(function() {
			$('#dataTable').DataTable();

		});
		var exportBtn = document.getElementById("exportBtn");
		
		exportBtn.addEventListener("click", function(e){
		const rows = [];
		let tableRow="";
		<%i = 1;
for (User customer : customerList) {
	if (customer.getGender() != null) {
		if (customer.getGender().equalsIgnoreCase("M")) {
			customer.setGender("Male");
		} else {
			customer.setGender("Female");

		}
	} else {
		customer.setGender("-");
	}
	  if(customer.getContact()==null){ 
		 customer.setContact("-");
 	} 
	%>
				tableRow=["<%=i++%>","<%=customer.getfName()%>","<%=customer.getlName()%>","<%=customer.getEmail()%>","<%=customer.getGender()%>","<%=customer.getContact()%>"];
				rows.push(tableRow);
				tableRow="";
		<% }%>
		let csvContent = "data:text/csv;charset=utf-8,Sr No,First Name, Last Name, Email, Gender, Contact Number\r\n";

		rows.forEach(function(rowArray) {
			 let row = rowArray.join(" andSperator ");
			 row=row.replace(/,/g , ' ');
			 row=row.replace(/ andSperator /g , ',');
			 csvContent += row + "\r\n";
		});
		var encodedUri = encodeURI(csvContent);
		exportBtn.setAttribute("href", encodedUri);
		let today=new Date();
		exportBtn.setAttribute("download", "customers_" + today.getDate() + "-" + today.getMonth() + "-" + today.getFullYear() + ".csv");
		});
	</script>

</body>
</html>