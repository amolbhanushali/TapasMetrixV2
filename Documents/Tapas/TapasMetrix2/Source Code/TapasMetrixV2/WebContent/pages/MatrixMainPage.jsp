<%@page import="com.dao.MetrixDataController"%>
<%@include file="UtilityPage.jsp" %>

<html lang="en">
<head>
<meta charset="utf-8" />

<title>User Matrix Page</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<style>
table {
	text-align: left;
	font-size: 15px;
	font-family: Arial;
	background: #488AC7;
}

table thead tr,table tfoot tr {
	background: #488AC7;
}

table tbody tr {
	background: #488AC7;
}

td,th {
	border: 1px solid white;
}

a.invisible
{
 display:none;
}
</style>

<script>

  $(function() {
	  
    $( "#tabs" ).tabs();
  });
  
	function goclicky(meh) {

		var x = screen.width / 2 - 900 / 2;
		var y = screen.height / 2 - 700 / 2;
		
		window.open(meh.href, 'sharegplus', 'height=300,width=600,scrollbars=yes, menubar=no,resizable=no,left=' + x + ',top=' + y);
	}
  
  window.history.forward();

   function noBack() {
  	
  	window.history.forward();
  } 
  </script>


</head> 
<body>

	<div id="tabs" >

		<div style="text-align: right; font-size: 15px; float: right;  color: black">

		<br>
		
		<% insertCode = 1;%>
			<%=" Welcome "+ capitalUserName %> 
			
			<%=" | "%>  
			
			<%=userRole %>		
			
			<%=" | "%>   
			
			<%=teamName %>		
			
			<%=" | "%>
			
			<%=workLocation %>	
		
			<%=" | "%>
			
			<a href="<%= request.getContextPath()%>/pages/ChangePassword.jsp" style="text-decoration:none; text-align: right; color: black; font-size: 15px;"  onclick="goclicky(this); return false; window.close();" target="_top">Change password</a>  
			
			<%=" | "%>
			
			<a href="<%= request.getContextPath()%>/index.jsp" style="text-decoration:none; color: #8A0808"  target="_top">
			
		<!-- 	<img class="myclass" title="Logout" alt="Logout" src="images/signout.png"> -->
			
			<img src='<%= request.getContextPath()%>/images/signout.png' title="Logout" alt="Logout">
			</a> 
			<%-- <a href="<%= request.getContextPath()%>/index.jsp" style="text-decoration:none; color: #8A0808"  target="_top">logout</a>  --%>
			
			
		</div>

		<ul>
		<!-- <li><a href=" <%= request.getContextPath()%>/pages/HomePage.jsp" style="text-decoration:none; color: #488AC7" target="_top">Home</a></li>-->

			<li><a href="<%= request.getContextPath()%>/pages/TapasMetrixPage.jsp" style="text-decoration:none; color: #488AC7" target="_top">Activity</a></li>
			
			<%-- <li><a href="<%= request.getContextPath()%>/pages/ActivityRecordPage.jsp" style="text-decoration:none; color: #488AC7" target="_top">Record</a></li> --%> 
			
			<%
			if(userRole!=null && userRole.equals("admin")){
			%>
			
			<li><a href="<%= request.getContextPath()%>/pages/AdminMasterPage.jsp" style="text-decoration:none; color: #488AC7" target="_top" >Admin Master</a></li>
			
			<%
			}
			%>
			
			
			<%--
			<%
			if(userRole!=null && userRole.equals("admin")){
			%>
			
			<li><a href="<%= request.getContextPath()%>/pages/ReportMasterPage.jsp" style="text-decoration:none; color: #488AC7" target="_top" >Tapas Report</a></li>
			
			<%
			}
			%> --%>
			
			
			
			<li><a href="<%= request.getContextPath()%>/pages/HistoryNLogsPage.jsp" style="text-decoration:none; color: #488AC7" target="_top">History</a></li>
		</ul>

	</div> 
</body>
</html>