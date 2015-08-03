<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register User Page</title>

<script language="JavaScript" type="text/javascript">
 function CloseAndRefresh() 
  {
     opener.location.reload(true);
     self.close();
  }
</script>

</head>
<body>

<form name="form1" id="login" action="RegsiterUserServ" method="post" >

Enter your username : <input id="username" name="username" type="text"/> <br> <br>

Enter your password : <input id="password" name="password" type="password"/> <br> <br>
  
<input type="submit" value="Register" onClick="CloseAndRefresh();" />  
 </form> 
</body>
</html>