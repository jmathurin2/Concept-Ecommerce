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
<title>Add Product</title>
<link href="web.css" rel="stylesheet" type="text/css" />

<center>
<!-- This is the entire page background. -->
 <img src="background3.jpg" align="middle" align="middle" width="1000px" height="0px" />
 
 
    <!-- This is the  page banner. -->
<img src="J3Hbanner.png" align="middle" align="top" width="1200" height="220" />



<!-- This is the  page navigation2. -->
<center>
<div id="nav">
<a href="Index.jsp">Home</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> 
</div></center>
</head>
<body>


<%
String userid = (String)session.getAttribute("userid");

    String pname = request.getParameter("prod_name");  
    String ptype = request.getParameter("prod_type");  
    String desc = request.getParameter("description"); 
    String price = request.getParameter("price");
    //float price = request.getParameter("price");
    String rdate = request.getParameter("release_date");
    String image = request.getParameter("image");
    String catid = request.getParameter("cat_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
            "root", "C0xQuest");
    PreparedStatement st = con.prepareStatement("insert into products (prod_name, prod_type, description, price, release_date, image, cat_id) values (?,?,?,?,?,?,?)");
    st.setString(1,pname);
    st.setString(2,ptype);
    st.setString(3,desc);
    st.setString(4, price);
    st.setString(5,rdate);
    st.setString(6,image);
    st.setString(7, catid);
    //ResultSet rs;
    int i = st.executeUpdate();
    
    if (i > 0) 
    {
    	
    	//out.println(request.getAttribute("You are now Register, Please login now!!!"));
        response.sendRedirect("Admin_Control_Panel.jsp");
               
        
        out.print("Product was Added!!"+"<a href='Categories.jsp'>Click here to view the products.</a>");
        
    } 
    
    
    else 
    {
    	/* If user registration is not complete, keep him/her on the register page till registration is completed. */
        response.sendRedirect("Add_Product.html");
    }
%>


 <div id="footer"><center>
    		Copyright © J3H Ecommerce 2014, All Rights Reserved.</center>
	</div>

</body>
</html>