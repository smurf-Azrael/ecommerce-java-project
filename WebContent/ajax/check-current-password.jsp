<%@page import="com.kitchenstore.utilities.BCrypt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String dbPass= request.getParameter("dbpass");
   String currentPass= request.getParameter("currentpass");
   boolean matched = BCrypt.checkpw(currentPass, dbPass);
   	if(!matched){ %>
Opps ! it looks like you enter incorrect password! 
<script>var checked=false;</script>
<% } else { %>
	<script>var checked=true;</script>
<% } %>
