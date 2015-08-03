<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.util.Utility"%>
<%@include file="UtilityPage.jsp" %>
<%@page import="com.dao.MetrixDataController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tapas Report Master</title>

<style>

label {
    font-family: Arial, Verdana;
  /*   text-shadow: 2px 2px 2px #ccc; */
    display: block;
    float: left;
    font-weight: bold;
    margin-right:10px;
    text-align: left;
    width: 120px;
    line-height: 25px;
    font-size: 17px;
    }

.input{
    font-family: Arial, Verdana;
    font-size: 15px;
    padding: 5px;
    border: 1px solid #b9bdc1;
    width: 300px;
    color: #797979;
    }
    
 .input:focus{
	background-color:#E7E8E7;	
	}
	
.hint{
    display:none;
    }    
    
#userform {
 
    width: 500px;
    padding: 20px;
    background: #f0f0f0;
    overflow:auto;
 
    /* Border style */
    border: 1px solid #cccccc;
    -moz-border-radius: 7px;
    -webkit-border-radius: 7px;
    border-radius: 7px; 
 
    /* Border Shadow */
    -moz-box-shadow: 2px 2px 2px #cccccc;
    -webkit-box-shadow: 2px 2px 2px #cccccc;
    box-shadow: 2px 2px 2px #cccccc;
    }
    
.field:hover .hint {
    position: absolute;
    display: block;
    margin: -30px 0 0 455px;
    color: #FFFFFF;
    padding: 7px 10px;
    background: rgba(0, 0, 0, 0.6);
 
    -moz-border-radius: 7px;
    -webkit-border-radius: 7px;
    border-radius: 7px;
    }
    
.button{
    float:none;
    margin:10px 55px 10px 0;
    font-weight: bold;
    line-height: 1;
    padding: 6px 10px;
    cursor:pointer;
    color: #fff;
 
    text-align: center;
    text-shadow: 0 -1px 1px #64799e;
 
    /* Background gradient */
    background: #a5b8da;
    background: -moz-linear-gradient
       (top, #a5b8da 0%, #7089b3 100%);
    background: -webkit-gradient
       (linear, 0% 0%, 0% 100%,
       from(#a5b8da), to(#7089b3));
 
    /* Border style */
    border: 1px solid #5c6f91;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
 
    /* Box shadow */
    -moz-box-shadow: inset 0 1px 0 0 #aec3e5;
    -webkit-box-shadow: inset 0 1px 0 0 #aec3e5;
    box-shadow: inset 0 1px 0 0 #aec3e5;
    }
    
   .button:hover {
	background: #848FB2;
    cursor: pointer;
	}
</style>

</head>
<body>

<%
String currentmonth = Utility.getCurrentMonth();
String prevMonth = Utility.getPreviousMonth();
String prePrevMonth = Utility.getPrePreviousMonth(); 
%>

		<!--------------------------- Team :: Begin --------------------------->
		<%
				request.setAttribute("insertCode", insertCode);		
				rs = metrixDataController.getUserTeam(userMaster.getUserId());
		%>
<label for="name">Team: </label>
		               
		    <select id="selectedTeam" name="selectedTeam" style="padding:2px;color:#646D7E;font-size:15pt;background:#fffff;width:200px;font-family:trebuchet" title="Select a team" >
		    
		    <option value="Select team" >Select team</option>
		    
		     
		<%
		  if(rs !=null) {
			while (rs.next()) { 
				
			teamName = rs.getString("teamName");
			
		%>
			<option value="<%=teamName%>"><%=teamName%></option>
		<%
			}
			}
		%>
		</select> &nbsp;
		<!-- 		<input type="submit" name="submit" value="View report" class="button" value="Submit"/>  -->
		
 		<a href="http://10.7.223.104:8080/WebViewerExample/frameset?__report=TapasReport/DMSinvestigated_report.rptdesign&sample=my+parameter" target="_blank" style="text-decoration: none; color: #488AC7; ">View Report</a>
		<!--------------------------- Team :: end --------------------------->
		
		<br><br>
		
		
		<!--------------------------- User :: Begin--------------------------->
		<%
				request.setAttribute("insertCode", insertCode);		
				rs = metrixDataController.getUserFirstNameFromUserId(userMaster.getUserId());
		%>

  			<label for="name">User:</label> 
		               
		    <select id="selectedUser" name="selectedUser" style="padding:2px;color:#646D7E;font-size:15pt;background:#fffff;width:200px;font-family:trebuchet" title="Select a user">
		    
		    <option value="Select user" >Select user</option>
		    
		     
		<%
		  if(rs !=null) {
			while (rs.next()) { 
				
				firstName = rs.getString("firstName");
			
		%>
			<option value="<%=firstName%>"><%=firstName%></option>
		<%
			}
			}
		%>
		</select> &nbsp;
		
		<a href="http://10.7.223.104:8080/WebViewerExample/frameset?__report=TapasReport/DMSinvestigated_report.rptdesign&sample=my+parameter" target="_blank" style="text-decoration: none; color: #488AC7; ">View Report</a>
		<!--------------------------- User :: end --------------------------->
		
		<br><br>
		
		<!--------------------------- Product :: begin --------------------------->
		<%
				request.setAttribute("insertCode", insertCode);		
				rs = metrixDataController.getProductNamesFromDb(MetrixDataController.Mst_TBL_Product);
		%>

  			<label for="name">Product:</label> 
		               
		    <select id="selectedProduct" name="selectedProduct" style="padding:2px;color:#646D7E;font-size:15pt;background:#fffff;width:200px;font-family:trebuchet" title="Select a product">
		    
		    <option value="Select product" >Select product</option>
		    
		     
		<%
		  if(rs !=null) {
			while (rs.next()) { 
				
			productId = rs.getString("productId");
			productName = rs.getString("productName");
			
		%>
			<option value="<%=productId%>"><%=productName%></option>
		<%
			}
			}
		%>
		</select> &nbsp;
	
		<a href="http://10.7.223.104:8080/WebViewerExample/frameset?__report=TapasReport/DMSinvestigated_report.rptdesign&sample=my+parameter" target="_blank" style="text-decoration: none; color: #488AC7; ">View Report</a>
		<!--------------------------- Product :: end --------------------------->
		
		<br><br>
		
		<!--------------------------- Activity :: begin --------------------------->
		<%
				request.setAttribute("insertCode", insertCode);		
				rs = metrixDataController.getActivityNamesFromDb(MetrixDataController.TRN_ROLEACTIVITY,  userMaster.getUserId());
		%>

  			<label for="name">Activity:</label> 
		               
		    <select id="selectedActivity" name="selectedActivity" style="padding:2px;color:#646D7E;font-size:15pt;background:#fffff;width:200px;font-family:trebuchet" title="Select an activity">
		    
		    <option value="Select activity" >Select activity</option>
		    
		     
		<%
		  if(rs !=null) {
			while (rs.next()) { 
				
				activityId = rs.getString("activityId");
				activityName = rs.getString("activityName");
			
		%>
			<option value="<%=activityId%>"><%=activityName%></option>
		<%
			}
			}
		%>
		</select> &nbsp;
		
		<a href="http://10.7.223.104:8080/WebViewerExample/frameset?__report=TapasReport/DMSinvestigated_report.rptdesign&sample=my+parameter" target="_blank" style="text-decoration: none; color: #488AC7; ">View Report</a>
		<!--------------------------- Activity :: end --------------------------->
		
		<br><br>
		
		<!------------------------- Month :: begin --------------------------->
  			<label for="name">Month: &nbsp;</label>
		               
		    <select id="selectedMonth" name="selectedMonth" style="padding:2px;color:#646D7E;font-size:15pt;background:#fffff;width:200px;font-family:trebuchet" title="Select a month">
		    
		    <option value="Select month" >Select month</option>
		     
		<%
			
		%>
			<option value="<%=currentmonth%>"><%=currentmonth%></option>
			<option value="<%=prevMonth%>"><%=prevMonth%></option>
			<option value="<%=prePrevMonth%>"><%=prePrevMonth%></option>
		<%
		%>
		</select> &nbsp;
		<!-- <input type="submit" name="submit" value="View report" class="button" value="Submit"/>  -->
		
		<a href="http://10.7.223.104:8080/WebViewerExample/frameset?__report=TapasReport/DMSinvestigated_report.rptdesign&sample=my+parameter" target="_blank" style="text-decoration: none; color: #488AC7; ">View Report</a>
		<!--------------------------- Month :: end --------------------------->
			 
</body>
</html>