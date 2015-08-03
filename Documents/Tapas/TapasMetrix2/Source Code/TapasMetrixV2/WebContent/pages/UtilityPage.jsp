<%@page import="com.bean.UserMaster"%>
<%@page import="com.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@page import="com.dao.MetrixDataController"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tapas Metrix</title>
</head>
<body>

<%

	HttpSession session2 = request.getSession();
	UserMaster userMaster = Utility.getUserMaster(session2);
	
	ResultSet rs;

	Connection con;
	
	MetrixDataController metrixDataController = null;
	
	String selectProduct = null;
	
	String selectActivity = null;
	
	String loggedUser = null;
	
	String capitalUserName = userMaster.getFirstName().substring(0, 1).toUpperCase() + userMaster.getFirstName().substring(1);
	
	String productId = null;
	
	String productName = null;
	
    String activityId = null;
	
	String activityName = null;
	
	String userRole = userMaster.getUserRole();
	
	String workLocation = userMaster.getUserWorkLocation();
	
	String firstName = null;
	
	String teamName = null;
	
	String userName = null;
	
	String currMonth = null;
	
	int insertCode = 0; 
%>

<%
	metrixDataController = new MetrixDataController();
%>
	
	<%
		rs = metrixDataController.getUserTeam(userMaster.getUserId());
	%>

	<%
	  if(rs !=null) {
		  
		while (rs.next()) {
			
			teamName = rs.getString("teamName");
		}
	  }
	%>
	
</body>
</html> 