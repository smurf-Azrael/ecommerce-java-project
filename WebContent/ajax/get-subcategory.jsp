<%@page import="com.kitchenstore.bean.SubCategory"%>
<%@page import="java.util.List"%>
<% List<SubCategory> subCategoryList=(List) request.getAttribute("subCategoryList");%>

	<select class="custom-select form-control" id="inputGroupSelect01" name="subcategory">
		<option value="">Choose...</option>
		<% if(subCategoryList!=null)
		{ for(SubCategory subCategory : subCategoryList){ %>
			<option value="<%=subCategory.getSubCategoryId()%>"><%=subCategory.getSubCategoryName() %></option>
	<% } }%>
</select>