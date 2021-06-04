
<%@page import="com.kitchenstore.utilities.Encryption"%>
<%@page import="com.kitchenstore.utilities.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="false"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		System.out.println(paramName);
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
		}else{
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
	e.printStackTrace();
}
%>
<%
	String str = String.valueOf(parameters);
String s[] = str.split(",");
String tId[] = s[12].split("=");
String resposeCode[] = s[7].split("=");
String status[] = s[9].split("=");


String string = tId[1];

StringBuffer transationId= new StringBuffer(string);  
 
transationId.deleteCharAt(transationId.length()-1);  


if ("TXN_SUCCESS".equals(status[1])) {
	response.sendRedirect("OrderProcess?pmode=online&tId=" + transationId);
} else {
	response.sendRedirect("PaymentFailed?source="+Encryption.encode("PAYTM"));
}
%> 



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%= outputHTML %>
</body>
</html>