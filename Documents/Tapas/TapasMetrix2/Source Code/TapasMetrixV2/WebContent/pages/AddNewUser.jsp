<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New User</title>

<style>

label {
    font-family: Arial, Verdana;
    text-shadow: 2px 2px 2px #ccc;
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

<script language="JavaScript" type="text/javascript">
 function CloseAndRefresh() 
  {
     opener.location.reload(true);
     self.close();
  }
</script>

</head>
<body>

<div class="container">

<form id="userform" class="rounded" method="post" action="<%=request.getContextPath()%>/AddNewUserServ" > 

<!-- <h3>New user form</h3> -->

		<div class="field">
			<label for="userId">User Id:</label>
			 <input id="userId" name="userId" type="text" class="input" /> 
			<p class="hint">Enter User Id.</p>
		</div>

<br> 
		<div class="field">
			<label for="userName">User Name :</label> 
			<input id="userName" name="userName" type="text" class="input" /> 
			<p class="hint">Enter User Name.</p>
		</div>
<br> 

		<div class="field">
			<label for="password"> Password :</label>
			 <input id="password" name="password" type="password" class="input" /> 
			<p class="hint">Enter Password.</p>
		</div> 

<br> 
		<div class="field">
			<label for="userRole">User Role : </label> 
			<input id="userRole" name="userRole" type="text" class="input" /> 
			<p class="hint">Enter User Role.</p>
		</div>

<br>
		<div class="field">
			<label for="LTEmail">L&T Email :</label> 
			<input id="LTEmail" name="LTEmail" type="text" class="input" /> 
			<p class="hint">Enter L&T Email.</p>
		</div>

<br> 
		<div class="field">
			<label for="SonyEmail">Sony Email :</label> 
			<input id="SonyEmail" name="SonyEmail" type="text" class="input" /> 
			<p class="hint">Enter Sony Email .</p>
		</div>

<br>
		<div class="field">
			<label for="userWorkLocation">Work Location :</label>
			<input id="userWorkLocation" name="userWorkLocation" type="text" class="input" /> 
			<p class="hint">Enter Work Location.</p>
		</div>
		
<br>	
		<div class="field">
			<label for="teamId">Team Id :</label>
			<input id="teamId" name="teamId" type="text" class="input" /> 
			<p class="hint">Enter Team Id.</p>
		</div>

<br> 
		<div class="field">
			<label for="firstName"> First Name :</label> 
			<input id="firstName" name="firstName" type="text" class="input" /> 
			<p class="hint">Enter First Name.</p>
		</div>

<br>
		<div class="field">
			<label for="lastName">Last Name :</label> 
			<input id="lastName" name="lastName" type="text" class="input" /> 
			<p class="hint">Enter Last Name.</p>
		</div>

<br>
		<input type="submit" name="Submit" class="button" value="Submit" align="left"  onClick="CloseAndRefresh();"/>     

</form>
</div> 
</body>
</html>