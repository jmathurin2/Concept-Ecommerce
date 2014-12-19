<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*"
import = "java.lang.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import ="java.sql.*" %>
<style>  
     <%@ include file="JScript.js"%>  
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="web.css" rel="stylesheet" type="text/css" />
<title>Update_P</title>
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
<p style="color:blue; align=center"><u>Update Product</u></p><br /><br /><br />
<%
//If the Update button is clicked in the user profile page, then update the user info if with any changes.
if(null != request.getParameter("Submit"))
{
	String id = request.getParameter("prod_id");
	System.out.println(id);
	//String userid = (;String)session.getAttribute("userid");
	//int id = Integer.parseInt(request.getParameter("prod_id"));
	
	String pname = request.getParameter("prod_name");
	String ptype = request.getParameter("prod_type");
	String description = request.getParameter("description");
	String price = request.getParameter("price");
	String rdate = request.getParameter("release_date");
	String image = request.getParameter("image");
	String cat_id = request.getParameter("cat_id");
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
            "root", "C0xQuest");
   
    
    PreparedStatement st1 = con.prepareStatement("update products set prod_name = '"+pname+
			"',prod_type = '"+ptype+
			"',description = '"+description+
			"',price = '"+price+
			"',release_date = '"+rdate+
			"',image = '"+image+
			"',cat_id = '"+cat_id+
			"'where  prod_id = '"+id+"'"); 
    
    
    
    
    
    
    int i = st1.executeUpdate();

    if (i > 0) 
    {
    	
    response.sendRedirect("Admin_Control_Panel.jsp");
    }

    
    
    //response.sendRedirect("Admin_Control_Panel.jsp");
     
	
}

%>
</body>
</html>