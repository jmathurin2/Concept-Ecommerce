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
<title>Update</title>
<center>

    <!-- This is the  page banner. -->
<img src="J3Hbanner.png" align="middle" align="top" width="1200" height="220" />



<!-- This is the  page navigation2. -->
<center>
<div id="nav">
<a href="Index.jsp">Home</a> |<a href="Categories.jsp">Product Categories</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> 
</div></center>

<body>
<div class="updateproductpage" style="color:red;" align="center" >
<p style="color:blue; align=center"><u>Update Product</u></p><br /><br /><br />
<%
//If the Update button is clicked in the user profile page, then update the user info if with any changes.

	String id = request.getParameter("prod_id");
	
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
    
    
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from products where prod_id='"+id+"' ");
	
   //out.print("<form action='UpdateProduct.jsp'  method='post' >");
    
    
    /* Statement st = con.createStatement();
    ResultSet rs; */
    //rs = st.executeQuery("select * from products where prod_id='"+id+"' ");
    //rs = st.executeQuery("update products set  where prod_id='"+id+"' ");
    
    
    
  // if(null != request.getParameter("Submit"))
   //{ 
    out.print("<form action='Update_Product.jsp'  method='post' >");
    
    while(rs.next())
	{
    	out.println("Product ID: " + " <input name='prod_id' value='" +rs.getInt(1)+ "' /><br/> ");
    	out.println("Product Name: " + " <input name='prod_name' value='" +rs.getString(2)+ "' /><br/> ");
    	out.println("Product Type: " + "<input name='prod_type'  value='" +rs.getString(3)+ "' /><br/>");
    	out.println("Description: " + "<input name='description'  value='" +rs.getString(4)+ "' /><br/>");
    	out.println("Product Price: " + "<input name='price'  value='" +rs.getFloat(5)+ "' /><br/>");
    	out.println("Release Date: " + "<input name='release_date'  value='" +rs.getString(6)+ "' /><br/>");
    	out.println("Image Name: " + "<input name='image'  value='" +rs.getString(7)+ "' /><br/>");
    	out.println("Category ID: " + "<input name='cat_id'  value='" +rs.getInt(8)+ "' /><br/><br/>");
    	   
	}
  
    %>
    
    <input type="Submit" value="Update" name="Submit">
    
  
</form> 
</div>
</div>
<!-- </div> -->

</body>
</html>