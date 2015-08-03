<%@page import="com.bean.UserMaster"%>
<%@page import="com.util.Utility"%>
<%@page import="com.dao.MetrixDataController"%>

<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8" />

<title>Login Tapas Metrix</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />

<script type="text/javascript" src="js/ControlUserInterface.js"></script>

<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />


<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">

<script type="text/javascript"> 

	function validateForm() {

		var username = document.form1.user.value;
		var password = document.form1.pass.value;

		if (username == "") {
			alert("User Name should not blank");
			document.form1.username.focus();
			return false;
		}
		if (password == "") {
			alert("Password should not blank");
			document.form1.password.focus();
			return false;
		}
	}

	function dataSavedIntoDB() {
		alert("Your Welcome ");
	}

	function goclicky(meh) {

		var x = screen.width / 2 - 700 / 2;
		var y = screen.height / 2 - 450 / 2;
		window.open(meh.href, 'sharegplus', 'height=200,width=600,left=' + x + ',top=' + y);
	}
	
 	 window.history.forward();
	
	function noBack() {
		
		window.history.forward();
	}  
	
</script>

</head>

<body onload="noBack();">

        <div class="container" align="center"> 
          
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                    
                        <div id="Login" class="animate form" >
                        
                            <form  action="<%= request.getContextPath()%>/UserLoginServ" method="post" name="form1" > 
                            
                                <h1>Login Page</h1> 
                                
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > <b>Your username </b></label>
                                    <span style="color: #FF0000;">*</span>
                                    <input id="username" name="username" required="required" type="text"  onkeypress="checkCapsLock(event);">
                                </p> 
                                
                                <br><br>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> <b>Your password </b> </label>
                                    <span style="color: #FF0000;">*</span>
                                    <input id="password" name="password" required="required" type="password" onKeyPress="checkCapsLock( event )"/> 
                                </p>
                                
                                <p class="login button" align="center">  
                                    <input type="submit" value="Login"/>  
								</p>
								
								
								<div style="text-align: left; float: left">
								
								</div>
                            </form>
                           
                        </div> 
                    </div> 
                </div>  
            </section>
        </div>

	<script>
		document.getElementById("username").focus(); 
	</script>


			<%
			UserMaster userMaster = new UserMaster();
			
			if(userMaster.getUserName() != null) {
				
				session.invalidate();

				System.out.print("Inside invalidate   "); 
				
				response.sendRedirect("index.jsp"); 
			}
			%>
			
</body>
</html>