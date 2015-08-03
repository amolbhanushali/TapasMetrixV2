<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.util.Utility"%>
<%@page import="com.dao.MetrixDataController"%>
<%@include file="UtilityPage.jsp" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.io.*"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
 
<%
String exportToExcel = null; 
%>

<%
	 
	int rowSize = 1;
%>

<html>
<head>
<title>History n Logs</title>

 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
  <script>
  
	 $(function() {
		    $( "#datepicker1" ).datepicker({ 
		      showOn: "button",
		      buttonImage: "images/calendar.gif",
		      buttonImageOnly: true
		    });
		  });
	 
	 
	 $(function() {
		    $( "#datepicker2" ).datepicker({ 
		      showOn: "button",
		      buttonImage: "images/calendar.gif",
		      buttonImageOnly: true
		    });
		  });
	 
  </script>

<style>
  table { 
  	text-align: left; 
  	font-size: 25px;
  	font-family: verdana;
  	background: #c0c0c0;
  }
  
  table thead tr,table tfoot tr {
  	background: #c0c0c0;
  }
  
  table tbody tr {
  	background: #f0f0f0;
  	font-size: 15px;
  }
  
  td,th {  
  	border: 1px solid white;
  	width:auto;
  	font-size: 16px;
  	font-family: sans-serif;
  	color: black;
  }
  
  .embed + img { 
  	position: relative; left: -24px; top: 0px; 
  }
  
  .highlight {
    	background-color: green;
   }
   
   label {
    font-family: Arial, Verdana;
    display: block;
    float: left;
    font-weight: bold;
    margin-right:10px;
    text-align: left;
    width: 120px;
    line-height: 25px;
    font-size: 15px;
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
    float: right;
    margin:10px 55px 10px 0;
    font-weight: normal;
    line-height: 1;
    padding: 6px 10px;
    cursor:pointer;
    color: black;
 
    text-align: center;
 
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
  
<script src="js/jquery-1.3.2.min.js"></script>

<script type="text/javascript">

 
/* function highlight(id)
{
    object = document.getElementById(id).style.backgroundColor;
    if(object == "yellow")
    {
        document.getElementById(id).style.backgroundColor = "white";
    }
    else{
        document.getElementById(id).style.backgroundColor = "yellow";
    } 
} */
	
	function exportToExcel() {

		alert("Record exported to excel successfully...!"); 
	}
	
	 $(function() {
		    $(":checkbox").change(function() {
		        $(this).closest("tr").toggleClass("highlight", this.checked) 
		    })
		})
</script>

</head>
<body>

<%--  <form action="<%=request.getContextPath()%>/FromDateToDateRecordServ" method="post"> 

<div style="text-align: right; font-size: 15px; float: left;  color: black">

From date: <input id="datepicker1" name="datepicker1" type="text"/> 

<br><br>

To date: &nbsp;&nbsp;&nbsp;&nbsp;<input id="datepicker2" name="datepicker2" type="text"/> 

<br><br>

<input	type="submit" value="View" style="text-align: right; font-size: 15px; float: left;  color: black">  
</div>
 &nbsp; &nbsp; &nbsp; &nbsp;
 <br><br><br>
 </form>  --%>
 
<!-- <form name="exportExcel" id="exportExcel" action="pages/DownloadExcelSheet.jsp" method="post">
 	
	<div style="text-decoration: none; text-align: right; color: black; font-size: 15px;"> 
		
	<input type="submit" name="ExportToExcel" class="button" value="Download Excel Sheet" />
		
	</div>
</form>  -->
	
 
 <form name="exportExcel" id="exportExcel" action="<%=request.getContextPath()%>/ExportDataToExcelServ" method="post" >  

<div style="text-decoration:none; text-align: right; color: black; font-size: 15px;">
	
<input type="submit" name="ExportToExcel" class="button" value="Export To Excel" onclick="return exportToExcel(this);"/>  

<!-- <a href="pages/ExportDataToExcel.jsp" style="text-decoration:none; text-align: right; color: black; font-size: 15px;" onclick="return exportToExcel(this);" ><b>Export to Excel</b></a> -->
		
</div>
	
</form>

	<br>
	<br>
	
	<jsp:include page="UtilityPage.jsp"></jsp:include> 
	
	<table id ="historyTable" name ="historyTable" cellspacing="1" cellpadding="0" border="0" width="100%"> 
			
			<%
				rs = metrixDataController.getHistoryDataFromTbl(MetrixDataController.Trn_TBL_USER_ACTIVITY, request.getSession());
				ArrayList<String> trnId = new ArrayList<String>();
			%>
			 
			<thead>
			<tr>
				<!-- <td width=10% align="center" ><b>Use ID</b></td> -->
				<td width=20% align="center" ><b>SL No.</b></td>
				<td width=20% align="left" ><b>Name</b></td>
				<td width=10% align="center" ><b>Team</b></td>
				<td width=20% align="left" ><b>Product</b></td>
				<td width=30% align="left" ><b>Activity</b></td>
				<!-- <td width=10% align="center" ><b>Activity Date</b></td> -->
				<td width=10% align="center" ><b>Count</b></td>
				<td width=10% align="center" ><b>Month</b></td>
				<td width=10% align="left" ><b>Comment</b></td>
				<td width=30% align="center" ><b>Date</b></td>
				<td width=30% align="center" ><b>Option</b></td>
			</tr>
			</thead>
			<%
			
			  if(rs !=null) {
                rowSize = 1 ;		//always start with 1 if refreshed
				while (rs.next()) {
			%>
			<tbody>
			<tr>
				<%-- <td align="center" ><%=rs.getString("UserName")%></td> trnId--%> 
			 	<td align="center" ><%=rowSize++%></td>
				<td align="left" ><%=rs.getString("fName") + " " + rs.getString("lName")%></td>
				<td align="center" ><%=rs.getString("teamName")%></td>
				<td align="left" ><%=rs.getString("ProductName")%></td>
				<td align="left" ><%=rs.getString("ActivityName")%></td> 
				<td align="center" ><%=rs.getInt("activityCount")%></td>
				<td align="center" ><%=rs.getString("activityMonth")%></td>
				<td align="left" ><%=rs.getString("userComment")%></td> 
				<td align="center" width=30% ><%=rs.getString("trnActivityDate")%></td>
				
				<td align="center">
				<%
				if( (userRole!=null && userRole.equals("admin")) || ( (userRole!=null && userRole.equals("SuperUser"))) ){
				%>
				
				<a href="<%=request.getContextPath()%>/DeleteRecordFromDB?id=<%=rs.getString("trnId")%>" style="text-decoration:none; text-align: right; color: #488AC7; 
						value="<%=rs.getString("trnId")%>" onclick="return confirm('Are you sure to delete this record?')">
						
						<img src="<%= request.getContextPath()%>/images/erase.png" title="Delete" alt="Delete">
				</a>
				
				<%
				}
				%>
				
				</td>
				
			</tr>
			</tbody>
			<%
				} 
			  }
			%> 
		</table>
		</body>
</html>