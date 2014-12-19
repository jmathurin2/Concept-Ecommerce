<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import ="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Electronics</title>
<link href="web.css" rel="stylesheet" type="text/css" />

<center>

 
 
    <!-- This is the  page banner. -->
<img src="J3Hbanner.png" align="middle" align="top" width="1200" height="220" />



<!-- This is the  page navigation2. -->
<center>
<div id="nav">
<a href="Categories.jsp">Home</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> 
</div></center>


</head>
<body>
    <!-- <div id = "container"> -->

<div class="form1" style= "color:black;" align="center" >

<div class="electronicscart">
<table width="740px" border="1" cellspacing="0" cellpadding="8"> 
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
            "root", "C0xQuest");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from products where cat_id = 3");
	
    out.print("<form action='ShoppingCart.jsp'  method='post' >");
    while(rs.next())
	{
    	String image = rs.getString(7);
    	out.println("<tr><td width='78%'> <h2>" + rs.getString(2) + "</h2> \n "+ "<img src= 'images/"+image+".jpg' width= 200 height= 150> \n"+ rs.getString(6) 
				+ "</td> <td width='200px'>"+ rs.getString(4) 
				+"</td> <td width='78%'>"+ rs.getString(3) 
				+"</td> <td width='78%'>"+" $"+ rs.getFloat(5)
				+"</td> <td width='78%'> <input name = 'addtocart' type = 'checkbox' value = '" + rs.getInt(1) +"'>Add to cart</button></td> </tr>");	
	}
    out.print("<br><input type='submit' name= 'subElectronics' value='Add To Cart'></form>");   
%>
</table>
 </div>
 </div>
<!-- </div> -->
</div>
</body>
<div id="electronicsfooter"><center>
    		Copyright © J3H Ecommerce 2014, All Rights Reserved.</center>
	</div>
</html>