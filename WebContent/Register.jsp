<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import ="java.sql.*" %>
<style>  
     <%@ include file="JScript.js"%>  
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User Registration</title>
<script>
function RegistrationValidate()
{

   if( document.form1.FName.value == "" )
   {
     alert( "Please provide your First Name!" );
     document.form1.FName.focus() ;
     return false;
   }


  if( document.form1.LName.value == "" )
   {
     alert( "Please provide your Last Name!" );
     document.form1.LName.focus() ;
     return false;
   }



  if( document.form1.Username.value == "" )
   {
     alert( "Please provide your Username!" );
     document.form1.Username.focus() ;
     return false;
   }




if( document.form1.password.value == "" )
   {
     alert( "Please provide your Password!" );
     document.form1.password.focus() ;
     return false;
   }

  





   var a = document.form1.password.value;
  if ((a.length < 4) || (a.length > 8))
  {
         alert("Your Password must be 4 to 8 Character");
         document.form.password.select();
         return false;
  }




   

      var emailID = document.form1.Email.value;
      atpos = emailID.indexOf("@");
      dotpos = emailID.lastIndexOf(".");
      
if( document.form1.Email.value == "" )
{
          alert( "Please provide your Email!" );
          document.form1.Email.focus() ;
          return false;
}

      
      
if (atpos < 1 || ( dotpos - atpos < 2 )) 
{
          alert("Please enter correct email ID")
          document.form1.EMail.focus() ;
          return false;
}

      return( true );


   
   
 
}



  </script>

<link href="web.css" rel="stylesheet" type="text/css" />

<center>

    <!-- This is the  page banner. -->
<img src="webbanner.jpg" align="middle" align="top" width="600px" />



<!-- This is the  page navigation2. -->
<center>
<div id="nav">
<a href="Index.jsp">Home</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> 
</div></center>


<div class="image">
    <img src="webBackground2.jpg" align="middle" width="600px"/>



</head>
<body>
<%
    String fname = request.getParameter("FName");  
    String lname = request.getParameter("LName");  
    String user = request.getParameter("Username");    
    String pwd = request.getParameter("password");
    String email = request.getParameter("Email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
            "root", "C0xQuest");
    PreparedStatement st = con.prepareStatement("insert into user (FName, LName, user_name, password, email) values (?,?,?,?,?)");
    st.setString(1,fname);
    st.setString(2,lname);
    st.setString(3,user);
    st.setString(4,pwd);
    st.setString(5,email);
    
    //ResultSet rs;
    int i = st.executeUpdate();
    
    if (i > 0) 
    {
    	/* If user completes registration, welcome them and instruct them to login. */    	
        response.sendRedirect("Index.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } 
    else 
    {
    	/* If user registration is not complete, keep him/her on the register page till registration is completed. */
        response.sendRedirect("Register.jsp");
    }
%>


 <div id="footer"><center>
    		Copyright © J3H Ecommerce 2014, All Rights Reserved.</center>
	</div>
</body>
</html>