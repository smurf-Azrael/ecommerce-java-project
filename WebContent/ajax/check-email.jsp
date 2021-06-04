<%@page import="com.kitchenstore.service.impl.UserServiceImpl"%>
<%@page import="com.kitchenstore.service.UserService"%>
<%@page import="com.kitchenstore.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <% String email=request.getParameter("email");
 UserService userService=new UserServiceImpl();
 // check Email if registered or not yet
		Boolean registeredEmail = userService.checkEmail(email);

		if (registeredEmail) { %>
			Opps ! it looks like this email address already associated with another account!
			<script> var checked=false;</script>
		<% } else { %>
			<script> var checked=true;</script>
		<% } %>