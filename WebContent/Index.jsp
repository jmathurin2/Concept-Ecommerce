<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>

 <html> 
 <head>

<title>Home</title>
<link href="web.css" rel="stylesheet" type="text/css" />

<script>
  function validateForm()
  { 

    if(document.form1.Username.value=="")
    { 
      alert("User Name should not be blank.."); 
      document.form1.Username.focus(); 
      return false; 
    }
     else if(document.form1.password.value=="")
    {
      alert("Password should not be blank"); 
      document.form1.password.focus(); return false; 
    }

   } 

     </script> 

<style>  
     <%@ include file="web.css"%>  
</style>



<center>
<!-- This is the entire page background. --> 
 
 
    <!-- This is the  page banner. -->
<img src="J3Hbanner.png" align="middle" align="top" width="1200" height="220" />



<!-- This is the  page navigation2. -->
<center>
<div id="nav">
<a href="Index.jsp">Home</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> 
</div></center>

    

</head>
<body>
  <div id = "FailedLogin">
   <%
   		if(request.getParameter("FailedLogin") != null){
	%>
   		 <%=request.getParameter("FailedLogin") %>
   <% 
   }
   %>
   </div>
  <div class="form1" style="color:red;" align="center" >
    <br><br><br><br>
    <p align="center"><form name="form1" action="Login.jsp"  method="post" onSubmit="return validateForm()"></p>

    User Name:<input type="text" name="Username" value="" /><br><br>

    Password : <input type="password" name="password" value="" /><br><br>

    <input type="Submit" value="Login" name="submit">
    New User?? <a href="Register.html" style="color:blue;">Register</a><br><br><br><br><br><br><br><br><br><br><br><br><br>
        
     
    </form></div>
     
    </div>
        <!-- This is the end of the login form. -->
        
        
        
   <div id="footer"><center>
    		Copyright © J3H Ecommerce 2014, All Rights Reserved.</center>
	</div>
</body>
</html>