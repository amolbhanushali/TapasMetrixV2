<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.util.Utility"%>
<%@include file="UtilityPage.jsp" %>
<%@page import="com.dao.MetrixDataController"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/ControlUserInterface.js"></script>

<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

<title>Tapas Metrix Page</title>

 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />

 <style>
table {
	text-align: left;
	font-size: 16px;
	
	font-family: verdana;
	background: #c0c0c0;
}

table thead tr,table tfoot tr {
	background: #c0c0c0;
}

table tbody tr {
	background: #f0f0f0;
}

td,th {
	border: 1px solid white;
}

.required .red {
	color: red;
	margin-right: .25em;
}

.ui-datepicker {
	font-size: 9pt !important;
}

.userComment * {
    vertical-align: middle;
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
    float: left;
    margin:10px 55px 10px 0;
    font-weight: normal;
    line-height: 1;
    padding: 6px 10px;
    cursor:pointer;
    color: black;
 
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

<script type="text/javascript">

	function validateForm() 
	{
		if (document.getElementById("selectedProduct").value == "Select project") {
			alert("Please select a project from dropdown list ");
			document.getElementById("selectedProduct").focus(); 
			return false;
		}

		if (document.getElementById("selectedActivity").value == "Select activity") {
			alert("Please select an activity from dropdown list");
			document.getElementById("selectedActivity").focus();
			return false;
		}
		 
		if (document.form1.activityCount.value == "") 
		{
			alert("Please enter activity count, this field cann't be empty");
			document.form1.activityCount.focus();
			return false;
		}

		
		 var x = document.form1.activityCount.value;
	        if(isNaN(x)){
	              alert("Enter numeric value " + x);
	              document.form1.activityCount.focus();
	              return false; 
	             }
	        
	        if (parseInt(x) <= 0){
	                alert("it should not start with 0");
	                document.form1.activityCount.focus();
	                return false;
	           }
	        
		/* if (document.form1.userComment.value == "") 
		{
			alert("Please input some comment");
			document.form1.userComment.focus();
			return false; 
		} */
		
		 formObj.subButton.disabled = true;  
		
		return true;
	}

	function updateIt() {

		alert("Your data updated successfully");
	}
	
	function Validate()
	{
	        var x = document.form1.activityCount.value;
	        if(isNaN() || x.indexOf("0")!=-1){
	              alert("Enter numeric value " + x);
	              return false; 
	             }
	        
	        if (x.charAt(0) !="0"){
	                alert("it should start with 9 or 2 ");
	                return false;
	           }
	}
	
	function enterNumber(evt)
	{
		var myRegExp = /^[1-9][0-9]*$/;
		var y = document.getElementById("activityCount").value;
		if(!myRegExp.test(evt.value))
		{
			alert("regular expression"+ myRegExp.test(evt.value) +"  " + y);
			return false;
		}
		var y = evt.value; //document.getElementById("activityCount").value;// document.forms.activityCount.value;
		if(parseInt(y)>0)
			{
			alert("Please enter number greater then zero" + y);
			return false;
			}
	}
	
	 $(function() {
		    $( "#datepicker" ).datepicker({ 
		      showOn: "button",
		      buttonImage: "images/calendar.gif",
		      buttonImageOnly: true
		    });
		  });
	 
</script>
	
</head> 
<body >

	<form name="form1" id="login" action="<%=request.getContextPath()%>/ActivityServlet" method="post" onsubmit="return confirm('Are you sure to submit this data?')">
	
		<hr>
		<br>
		
		<!------------------- Project  :: begin -------------------->
		<%
			try {
				request.setAttribute("insertCode", insertCode);		
				rs = metrixDataController.getProductNamesFromDb(MetrixDataController.Mst_TBL_Product);
		%>

 		   <label for="selectedProduct"> Project: <span style="color: #FF0000;">*</span></label>
		    
		    <select id="selectedProduct" class="input"  name="selectedProduct" style="color:#646D7E;font-size:12pt;background:#fffff;width:200px;font-family:sans-serif; width: 300px" title="Select a project">
		    
		    <option value="Select project" >Select project</option>
 
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
		</select> 
		<!------------------- Project  :: end -------------------->
		
		<br> <br>
		
		<!------------------- Activity  :: begin -------------------->
		<%
			try {
				rs = metrixDataController.getActivityNamesFromDb(MetrixDataController.Mst_TBL_Activity, userMaster.getUserId());
			%>

  			<label for="selectedActivity"> Activity: <span style="color: #FF0000;">*</span> </label>
		    
		    <select id="selectedActivity" class="input"  name="selectedActivity" style="color:#646D7E;font-size:12pt;background:#fffff;width:200px;font-family:sans-serif; width: 300px" title="Select an activity">

			<option value="Select activity">Select activity</option>
			
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
			</select> 
		<%
			} 
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
		%> 
		
		<!------------------- Activity  :: end -------------------->	
	
		<br> <br>
		
		<!------------------- Count :: begin -------------------->
		
		<label for="activityCount"> Count: <span style="color: #FF0000;">*</span> </label>
		
		<input type="text" name="activityCount" class="input"  id="activityCount" title="Put activity count"  />
		
		<!------------------- Count :: end -------------------->
		
		<br>
	
		<!------------------- Comment :: begin -------------------->
		<p class="userComment">
		
		<label for="textarea">Comment:</label>
			
    	<textarea id="userComment" class="input"  name="userComment" rows="3" cols="20" title="Put some comment" ></textarea>
    	</p>
    	
    	<!------------------- Comment :: end -------------------->
	
		
		<!------------------- Submit button  :: begin -------------------->
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<input	type="submit" value="Update Metrics"  onclick="return validateForm(this);">  
		
		<!------------------- Submit button  :: begin -------------------->
		<%
			} 
			catch (Exception e) {
				System.out.println("DMSPage.jsp " + e.getMessage());
			}
		%>
		
	</form>
</body>
</html>