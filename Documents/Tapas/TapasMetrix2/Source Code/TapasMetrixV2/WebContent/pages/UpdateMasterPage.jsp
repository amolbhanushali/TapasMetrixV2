<html lang="en">
<head>
<meta charset="utf-8" />

<title>Admin Page</title>

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
    float: left;
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

<script> 

function showDiv() {
	
	document.getElementById(addUser).style.display = "pages/AddNewUser.jsp";
}

function goclicky(meh) {

	var x = screen.width / 2 - 600 / 2;
	var y = screen.height / 2 - 300 / 2;
	
	window.open(meh.href, 'sharegplus', 'height=200,width=600,left=' + x + ',top=' + y);
}

function openWin()
{
	myWindow=window.open('','','width=200,height=100');
	myWindow.document.write("<p>This is 'myWindow'</p>");
	myWindow.focus();
}

function displayForm(c){ 
    if(c.id == "userform"){ 
        document.getElementById("userform").style.visibility='visible'; 
        document.getElementById("form2").style.visibility='hidden'; 
    } 
    else if(c.value =="2"){ 
        document.getElementById("form1").style.visibility='hidden'; 
        document.getElementById("form2").style.visibility='visible'; 
    } 
    else{ 
    } 
 
}     

$(document).ready(function () {
	
	// User
    $('#showhidetarget').hide();

    $('a#showhidetrigger').click(function () {
        $('#showhidetarget').toggle(400);
    });
    
    // Product
    $('#showhidetarget1').hide();

    $('a#showhidetrigger1').click(function () {
        $('#showhidetarget1').toggle(400);
    });
    
    /// Activity
    $('#showhidetarget2').hide();

    $('a#showhidetrigger2').click(function () {
        $('#showhidetarget2').toggle(400);
    });
});

</script>

<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>

<script>
 
	$("buttonid").click(function () {
		$("divid").toggle();
	});
</script>

</head>
<body>

	<a id="showhidetrigger" href="UpdateUserData.jsp" style="text-decoration:none; text-align: center; color: black" 
	onclick="goclicky(this); return false; window.close();" target="_blank">
  
    <label for="addNewUser">Update user</label>
    </a>
    
    <br><br>
    
    <a id="showhidetrigger1" href="UpdateProductData.jsp" style="text-decoration:none; text-align: right; color: black" 
    onclick="goclicky(this); return false; window.close();" target="_blank">
     
    <label for="addNewUser">Update product</label>
    </a>

	<br><br>
	
    <a id="showhidetrigger2" href="UpdateActivityData.jsp" style="text-decoration:none; text-align: right; color: black"
    onclick="goclicky(this); return false; window.close();" target="_blank">
    
      <label for="addNewUser">Update activity</label>
    </a>
    
    

</body>
</html>