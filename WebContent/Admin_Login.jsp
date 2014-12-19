<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>

 <html> 
 <head>
<%@ page import ="java.sql.*" %>


<title>Administrator Login</title>
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
     else if(document.form1.Password.value=="")
    {
      alert("Password should not be blank"); 
      document.form1.Password.focus(); return false; 
    }

   } 

     </script> 

<style>  
     <%@ include file="web.css"%>  
</style>



<center> 
    <!-- This is the  page banner. -->
<img src="J3Hbanner.png" align="middle" align="top" width="1200" height="220" />



<!-- This is the  page navigation2. -->
<center>
<div id="nav">
<a href="Index.jsp">Home</a> |<a href="Categories.jsp">Product Categories</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> 
</div></center>

</head>
<body>

  
   
    <div class="adminloginform" style="color:red;" align="right" >
    <br><br><br><br>
    <p align="center"><form action="Admin.jsp" method="post" onSubmit="return validateForm()"></p>

    User Name:<input type="text" name="Username" value="" /><br><br>

    Password : <input type="password" name="Password" value="" /><br><br></div>

    <center><input type="Submit" value="Login"></center>
        
        
     
    </form></div>
     
    </div>
        <!-- This is the end of the login form. -->

</body>
</html>