<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="com.kitchenstore.bean.ProductImage"%>
<%@page import="java.util.List"%>
<%
	List<ProductImage> productImages= (List) request.getAttribute("productimages");
   long productId =  (long) request.getAttribute("productid");
   	String image1 = "images/no-Image.jpg";
	String image2 = "images/no-Image.jpg";
	String image3 = "images/no-Image.jpg";
	String image4 = "images/no-Image.jpg";
	String pImageId1 = "value=''";
	String pImageId2 = "value=''";
	String pImageId3 = "value=''";
	String pImageId4 = "value=''";
	String imageId1=null;
	String imageId2=null;
	String imageId3=null;
	String imageId4=null;
	if (productImages != null) {
		int i = 1;
		for (ProductImage productImage : productImages) {
			if (i == 1) {
				image1 = "data:image/png/jpeg/jpg;base64," + productImage.getProductImageString();
				pImageId1 = "value='" + Encryption.encode(Long.toString(productImage.getpImageId())) + "'";
				imageId1=Encryption.encode(Long.toString(productImage.getpImageId()));
				
			} else if (i == 2) {
				image2 = "data:image/png/jpeg/jpg;base64," + productImage.getProductImageString();
				pImageId2 = "value='" + Encryption.encode(Long.toString(productImage.getpImageId())) + "'";
				imageId2=Encryption.encode(Long.toString(productImage.getpImageId()));
			} else if (i == 3) {
				image3 = "data:image/png/jpeg/jpg;base64," + productImage.getProductImageString();
				pImageId3 = "value='" + Encryption.encode(Long.toString(productImage.getpImageId())) + "'";
				imageId3=Encryption.encode(Long.toString(productImage.getpImageId()));
			} else if (i == 4) {
				image4 = "data:image/png/jpeg/jpg;base64," + productImage.getProductImageString();
				pImageId4 = "value='" + Encryption.encode(Long.toString(productImage.getpImageId())) + "'";
				imageId4=Encryption.encode(Long.toString(productImage.getpImageId()));
			}
			i++;
		}
	}
%>
<div class="row">
	<div class="col-6">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-6">
						<img src="<%=image1%>" class="img-thumbnail" alt=""
							style="widht: 200px; height: 200px;">
					</div>
					<div class="col-4">
						<%
							if (imageId1 != null && !imageId1.isEmpty()) {
						%>
						<button type="button" style="padding: 5px 5px; font-size: 18px;"
							role="button" data-toggle="modal" data-target="#exampleModal"
							onclick="getDelId('<%=imageId1%>');"
							class="btn btn-light text-danger">
							<i class="fas fa-trash"></i>
						</button>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<div class="col-12 my-5">
				<div class="form-group">
					<div class="d-flex">
						<label style="font-size: 1.3rem" for="file1">Select new
							image (jpeg/jpg/png)</label> <span
							class="text-primary font-weight-bold pl-4"
							style="cursor: pointer; font-size: 1.4rem" id="clearField1">Clear</span>
					</div>
					<input type="file" class="form-control-file" id="file1"
						name="image1">
					<div class="text-danger image-check1 mt-1">image file must be
						.png, .jpeg, or .jpg format and file size must be less than 1MB.</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-6">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-6">
						<img src="<%=image2%>" class="img-thumbnail" alt=""
							style="widht: 200px; height: 200px;">
					</div>
					<div class="col-4">
						<%
							if (imageId2 != null && !imageId2.isEmpty()) {
						%>
						<button type="button" style="padding: 5px 5px; font-size: 18px;"
							role="button" data-toggle="modal" data-target="#exampleModal"
							onclick="getDelId('<%=imageId2%>');"
							class="btn btn-light text-danger">
							<i class="fas fa-trash"></i>
						</button>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<div class="col-12 my-5">
				<div class="form-group">
					<div class="d-flex">
						<label style="font-size: 1.3rem" for="file2">Select new
							image (jpeg/jpg/png)</label> <span
							class="text-primary font-weight-bold pl-4"
							style="cursor: pointer; font-size: 1.4rem" id="clearField2">Clear</span>
					</div>
					<input type="file" class="form-control-file" id="file2"
						name="image2">
					<div class="text-danger image-check2 mt-1">image file must be
						.png, .jpeg, or .jpg format and file size must be less than 1MB.</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-6">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-6">
						<img src="<%=image3%>" class="img-thumbnail" alt=""
							style="widht: 200px; height: 200px;">
					</div>
					<div class="col-4">
						<%
							if (imageId3 != null && !imageId3.isEmpty()) {
						%>
						<button type="button" style="padding: 5px 5px; font-size: 18px;"
							role="button" data-toggle="modal" data-target="#exampleModal"
							onclick="getDelId('<%=imageId3%>');"
							class="btn btn-light text-danger">
							<i class="fas fa-trash"></i>
						</button>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<div class="col-12 mt-5">
				<div class="form-group">
					<div class="d-flex">
						<label style="font-size: 1.3rem" for="file3">Select new
							image (jpeg/jpg/png)</label> <span
							class="text-primary font-weight-bold pl-4"
							style="cursor: pointer; font-size: 1.4rem" id="clearField3">Clear</span>
					</div>
					<input type="file" class="form-control-file" id="file3"
						name="image3">
					<div class="text-danger image-check3 mt-1">image file must be
						.png, .jpeg, or .jpg format and file size must be less than 1MB.</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-6">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-6">
						<img src="<%=image4%>" class="img-thumbnail" alt=""
							style="widht: 200px; height: 200px;">
					</div>
					<div class="col-4">
						<%
							if (imageId4 != null && !imageId4.isEmpty()) {
						%>
						<button type="button" style="padding: 5px 5px; font-size: 18px;"
							role="button" data-toggle="modal" data-target="#exampleModal"
							onclick="getDelId('<%=imageId4%>');"
							class="btn btn-light text-danger">
							<i class="fas fa-trash"></i>
						</button>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<div class="col-12 mt-5">
				<div class="form-group">
					<div class="d-flex">
						<label style="font-size: 1.3rem" for="file4">Select new
							image (jpeg/jpg/png)</label> <span
							class="text-primary font-weight-bold pl-4"
							style="cursor: pointer; font-size: 1.4rem" id="clearField4">Clear</span>
					</div>
					<input type="file" class="form-control-file" id="file4"
						name="image4">
					<div class="text-danger image-check4 mt-1">image file must be
						.png, .jpeg, or .jpg format and file size must be less than 1MB.</div>
				</div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" <%=pImageId1%>  name="imgid1" /> 
									<input type="hidden" <%=pImageId2%> name="imgid2" /> 
									<input type="hidden" <%=pImageId3%> name="imgid3" /> 
									<input type="hidden" <%=pImageId4%> name="imgid4" /> 
									<input type="hidden" value="<%=Encryption.encode(Long.toString(productId))%>" name="productid" /> 
					
<script type="text/javascript">
		$(document).ready(function() {	
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
			var imageCheck1=true;
			var imageCheck2=true;
			var imageCheck3=true;
			var imageCheck4=true;
			$("#clearField1").hide();
			$(".image-check1").hide();
			$("#clearField2").hide();
			$(".image-check2").hide();
			$("#clearField3").hide();
			$(".image-check3").hide();
			$("#clearField4").hide();
			$(".image-check4").hide();
			$("#file1").change(function () {
				$("#clearField1").show();
			    if(fileExtValidate(this)) {
			    	 if(fileSizeValidate(this)) {
			    		 imageCheck1=true;
			    		 $(".image-check1").hide();
			    	 }
			    	 else 
			    	 {
			    		 imageCheck1=false;
			    		 $(".image-check1").show();
			    	 }
			    } else if(imageEmpty==false)
			    {
			    	imageCheck1=false;
		    		 $(".image-check1").show();
			    }   
		    });
			$("#clearField1").click(function() {
				$("#file1").val("");
				$(".image-check1").hide();
				imageCheck1=true;
				$(this).hide();
			});	
			$("#file2").change(function () {
				$("#clearField2").show();
			    if(fileExtValidate(this)) {
			    	 if(fileSizeValidate(this)) {
			    		 imageCheck2=true;
			    		 $(".image-check2").hide();
			    	 }
			    	 else 
			    	 {
			    		 imageCheck2=false;
			    		 $(".image-check2").show();
			    	 }
			    } else if(imageEmpty==false)
			    {
			    	imageCheck2=false;
		    		 $(".image-check2").show();
			    }   
		    });
			$("#clearField2").click(function() {
				$("#file2").val("");
				$(".image-check2").hide();
				imageCheck2=true;
				$(this).hide();
			});	
			$("#file3").change(function () {
				$("#clearField3").show();
			    if(fileExtValidate(this)) {
			    	 if(fileSizeValidate(this)) {
			    		 imageCheck3=true;
			    		 $(".image-check3").hide();
			    	 }
			    	 else 
			    	 {
			    		 imageCheck3=false;
			    		 $(".image-check3").show();
			    	 }
			    } else if(imageEmpty==false)
			    {
			    	imageCheck3=false;
		    		 $(".image-check3").show();
			    }   
		    });
			$("#clearField3").click(function() {
				$("#file3").val("");
				$(".image-check3").hide();
				imageCheck3=true;
				$(this).hide();
			});	
			$("#file4").change(function () {
				$("#clearField4").show();
			    if(fileExtValidate(this)) {
			    	 if(fileSizeValidate(this)) {
			    		 imageCheck4=true;
			    		 $(".image-check4").hide();
			    	 }
			    	 else 
			    	 {
			    		 imageCheck4=false;
			    		 $(".image-check4").show();
			    	 }
			    } else if(imageEmpty==false)
			    {
			    	imageCheck4=false;
		    		 $(".image-check4").show();
			    }   
		    });
			$("#clearField4").click(function() {
				$("#file4").val("");
				$(".image-check4").hide();
				imageCheck4=true;
				$(this).hide();
			});	
			$("#formSubmit").submit(
					function(e) {
						
				if(imageCheck1 == false || imageCheck2 == false || imageCheck3 == false || imageCheck4 == false)
				{
					return false;
				}
				else
					return true;
			});
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