<%@page import="com.dao.MetrixDataController"%>

<!DOCTYPE html> 
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8" /> 

<title>Logout Tapas Metrix</title>

 		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        
        <script type="text/javascript" src="js/ControlUserInterface.js"></script>
        
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
</head>

<body>		
<% 

/* //MetrixDataController.username = null;    

session.getAttribute("logged_username");
 */
session.invalidate();

	System.out.print("Inside invalidate   Logout"); 
	
response.sendRedirect("UserLoginPage.jsp"); 
%>

<%@include file = "UserLoginPage.jsp" %> 

</body>
</html>