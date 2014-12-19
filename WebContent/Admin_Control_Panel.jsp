<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
<!-- We are using html5 -->
<!DOCTYPE html>
<html>
<head>
<%@ page import ="java.sql.*" %>
<style>  
     <%@ include file="JScript.js"%>  
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Control Panel</title>
<link href="web.css" rel="stylesheet" type="text/css" />
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
 
<div class="updateproductpage" style="color:red;" align="center" >
<!-- <p style="color:blue; align=right">Administrator Control Panel</p><br /><br /><br /> -->



<form method="post" action="Admin.jsp">

<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) 
{
%>
You are not logged in as Administration,
<a href="Admin_Login.jsp">Please Login</a>
<%
} 
    
else 
{
%>
Welcome, <%=session.getAttribute("userid")%>
<br /><br />

<p style="color:blue; align=center"><u>Administrator Control Panel</u></p><br /><br />

<a href='Search_Product.html'>Search Product</a></br><br>
<a href='Add_Product.html'>Add Product</a><br /><br>
<a href='Update_Product.html'>Update Product</a><br /><br>
<a href='Search_User.html'>Search User</a></br><br>
<a href='Register.html'>Add User</a><br /><br>
<a href='Get_Delete _User.html'>Delete User</a><br />





<%
    }
%>


</form> 
</div>
</div>
<!-- </div> -->
 <div id="footer"><center>
    		Copyright © J3H Ecommerce 2014, All Rights Reserved.</center>
	</div>
</body>
</html>