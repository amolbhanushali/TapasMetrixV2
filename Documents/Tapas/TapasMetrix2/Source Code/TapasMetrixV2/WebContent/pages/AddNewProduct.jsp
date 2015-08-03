<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new product</title>

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
    
#productform {
 
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
<form action="<%=request.getContextPath()%>/AddNewProductServ" method="post" id="productform" class="rounded" method="post">

	<!-- <h3>New Product form</h3> -->

		<div class="field">
			<label for="productId">Product Id:</label>
			 <input id="productId" name="productId" type="text" class="input" /> 
			<p class="hint">Enter Product Id.</p>
		</div>
		
<br> 
		<div class="field">
			<label for="productName">Product Name :</label> 
			<input id="productName" name="productName" type="text" class="input" />
			<p class="hint">Enter Product Name.</p>
		</div>
		
<br>
		<div class="field">
			<label for="productDesc"> Product Description :</label>
			 <input id="productDesc" name="productDesc" type="text" class="input" /> 
			<p class="hint">Enter Product Description.</p>
		</div>
		
<br> 
		<div class="field">
			<label for="productPlatform">Product Platform   </label> 
			<input id="productPlatform" name="productPlatform" type="text" class="input" /> 
			<p class="hint">Enter Product Platform.</p>
		</div>
		
<br> 
		<div class="field">
			<label for="releasePhase">Release Phase : </label> 
			<input id="releasePhase" name="releasePhase" type="text" class="input" /> 
			<p class="hint">Enter Release Phase.</p>
		</div>
		
		<br>
		
		<input type="submit" name="Submit" class="button" value="Submit" align="middle"  onClick="CloseAndRefresh();"/>    
</form>
</div>
</body>
</html>