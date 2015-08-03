<%@page import="com.dao.MetrixDataController"%>
<%@include file="UtilityPage.jsp" %>
<html>
<head>
<title>Change Password Page</title>

<style>

label {
    font-family: Arial, Verdana;
    text-shadow: 2px 2px 2px #ccc;
    display:inline-block;
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
    
#passwordChange {
 
    width: 500px;
    padding: 20px;
    background: #f0f0f0;
    overflow:auto;
 
    /* Border style */
    border: 1px solid #cccccc;
    -moz-border-radius: 7px;
    -webkit-border-radius: 7px;
    border-radius: 20px; 
 
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
	
	#overlay_form {
		position: absolute;
		border: 5px solid gray;
		padding: 10px;
		background: white;
		width: 270px;
		height: 190px;
	}
	#pop {
		display: block;
		border: 1px solid gray;
		width: 65px;
		text-align: center;
		padding: 6px;
		border-radius: 5px;
		text-decoration: none;
		margin: 0 auto;
	}
</style>

<script type="text/javascript"> 

function validateForm() 
{
	if (document.pwdChange.currentpassword.value == "") 
	{
		alert("Please enter currentpassword, this field cann't be empty");
		document.pwdChange.currentpassword.focus();
		return false;
	}

	if (document.pwdChange.newpassword.value == "") 
	{
		alert("Please enter new password, this field cann't be empty");
		document.pwdChange.newpassword.focus();
		return false;
	}
   	alert("Password changed successfully");
	self.close();
	return true;
}	

</script>


</head>
<body>

	<form name="pwdChange" id="passwordChange" class="rounded" action="<%=request.getContextPath()%>/ChangePasswordServ" method="post" >
	
	<%=capitalUserName  + " you can change passsord for your login."%> <br> <br>
	
	<div class="field" style="white-space: nowrap;">
			<label for="currentpassword">Current password: </label>
			 <input id="currentpassword" name="currentpassword" type="password" class="input" /> 
			<p class="hint">Enter Current Password.</p>
		</div> 
		
		<br>
		
	<div class="field">
			<label for="newpassword">New password:</label>
			 <input id="newpassword" name="newpassword" type="password" class="input" /> 
			<p class="hint">Enter New Password.</p>
		</div> 		
	
	<br> <br>
	 
	<input type="submit" name="Submit" class="button" value="Submit" onclick="return validateForm(this);"/>  
</form> 
</body>
</html>