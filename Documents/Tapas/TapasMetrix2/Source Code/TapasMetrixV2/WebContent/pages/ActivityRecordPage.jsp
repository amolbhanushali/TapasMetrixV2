<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.util.Utility"%>
<%@include file="UtilityPage.jsp" %>
<%@page import="com.dao.MetrixDataController"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Activity Page</title>
</head>
<body>

<!-- Data populates from database :: begin -->

		<hr>
		<h3>Team activity data</h3>
		<div>
		
		
		<%-- <table width= 100% cellspacing="1" cellpadding="1" border="1">
			<%
			String selectedActivity = request.getParameter("selectedActivity");
				rs = metrixDataController.getMetrixDataFromDb(MetrixDataController.Trn_TBL_USER_ACTIVITY, "1");
			%>
			<tr>
				<td width=20% align="center"><b>Product</b></td>
				<td width=20% align="center"><b><%=Utility.getCurrentMonth()%></b></td>
				<td width=20% align="center"><b><%=Utility.getPreviousMonth()%></b></td>
				<td width=20% align="center"><b><%=Utility.getPrePreviousMonth()%></b></td>
			</tr>
			<%
			  if(rs !=null) {
				while (rs.next()) {
			%>
			<tr>
				<td align="center"><%=rs.getString(1)%></td>
				<td align="center"><%=rs.getInt(2)%></td>
				<td align="center"><%=rs.getInt(3)%></td>
				<td align="center"><%=rs.getInt(4)%></td>
			</tr>
			<% 
				}
			  }
			%>
		</table>  --%>
		
		
		</div>
		<!-- Data populates from database :: end -->
		
		
		<!-- User Data populates from database :: begin -->
		
		<h3> <%=capitalUserName +" Activity data"%> </h3>
		
		<div>
		
		
      	<%-- <table  width= 100%  cellspacing="1" cellpadding="1" border="1" > 
      	
      	 <%
       	      		rs = metrixDataController.getUserDataFromDb(MetrixDataController.Mst_TBL_USER, MetrixDataController.DMSactivityId, userMaster.getUserId());
       	 %>
      		<thead>
			<tr>
				<td width=20% align="center"><b>Product</b></td>
				<td width=20% align="center"><b><%=Utility.getCurrentMonth()%></b></td>
				<td width=20% align="center"><b><%=Utility.getPreviousMonth()%></b></td>
				<td width=20% align="center"><b><%=Utility.getPrePreviousMonth()%></b></td>
			</tr>
			</thead>
			
			<%
			  if(rs !=null) {
				  
				while (rs.next()) {
			%>
			
			<tbody>
			<tr>
				<td align="center"><%=rs.getString("productName")%></td>
				<td align="center"><%=rs.getInt(2)%></td>
				<td align="center"><%=rs.getInt(3)%></td>
				<td align="center"><%=rs.getInt(4)%></td>
			</tr>
			</tbody> 
			<%
				}
				
			  }
			%> 
        
      </table> --%>
      
      
      </div>
      
      <!-- User Data populates from database :: end -->

</body>
</html>