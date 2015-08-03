<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@include file = "pages/UserLoginPage.jsp" %>

<% String username = (String)session.getAttribute("logged_username"); %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Tapas Metrix</title>

<script type="text/javascript"> 

window.history.forward();

function noBack() {
	
	window.history.forward();
}
</script>

</head>

<body onload="noBack();">

<%
	if (session.getAttribute("login") != null && session.getAttribute("login").equals("fail")) {
		
		response.setContentType("text/html");
		out.println("<script type=\"text/javascript\">");
		out.println("alert('You username and password does not match, please login again.');");
		out.println("</script>");
	}
	//System.out.print("Inside index.jsp invalidate   ");

	session.invalidate();
%>

</body>

</html> 