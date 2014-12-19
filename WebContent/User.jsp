<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*"
import = "java.lang.*" %>
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
<title>Welcome User</title>
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

<div class="form1" style="color:black;" align="center" >
<!-- <p style="color:blue; align=right">Administrator Control Panel</p><br /><br /><br /> -->


<%-- Welcome <%=session.getAttribute("userid")%>
<br /><br /> --%>



<%
if ((session.getAttribute("userid") == null) && (session.getAttribute("userid") == "")) 
{
	   
%>
  

<a href="Index.jsp">Please Login</a>

<% 
} 
    
else 
{
%>
<% out.print("You are logged in."); %>
Welcome <%=session.getAttribute("userid")%>
<br /><br />
<p style="color:blue; align=center"><u><b>User Information</b></u></p><br /><br /><br />

<div class="userinfopage">
<%
   String userid = (String)session.getAttribute("userid");

   String pwd = request.getParameter("password");
   Class.forName("com.mysql.jdbc.Driver");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
            "root", "C0xQuest");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where user_name='"+userid+"' ");
	int id=0;
   out.print("<form action='UserUpdate.jsp'  method='post' >");
    String firstname;
    while(rs.next())
	{	
    	id=rs.getInt(1);
    	out.println("User ID: " + rs.getInt(1)+"<br/>");
    	//out.println("<br/>");
    	out.println("<td>" +"First Name: " + "<input name='FName'  value='" +rs.getString(2)+ "' /><br/><br>");
    	out.println("Last Name: " + "<input type='text' name='LName' value='" +rs.getString(3)+ "' /><br/><br>");
    	out.println("User Name: " + "<input type='text' name='user_name' value='" +rs.getString(4)+ "' /><br/><br>");
    	out.println("Password: " + " <input type='text' name='password' value='" +rs.getString(5)+ "' /><br/><br>");
    	out.println("Email: " +    " <input type='text' name='email' value='" +rs.getString(6)+ "' /><br/><br/>");
    	
		
	}
    
%>
   <!-- <form name="form1" action="User.jsp"  method="post" onSubmit="Update"></p> -->
    <input type="Submit" value="Update" name="Submit">
</div>      
     </form><br/>
      <hr1></hr1>
     <h1><b>User Order History<b></h1>
     
<div class="userhistory">
  <%
 
     int user_id=0;
     ResultSet rs1;
     rs1=st.executeQuery("select user_id from user where user_name = '"+userid+"'");
     while(rs1.next())
     {
    	 user_id=rs1.getInt("user_id"); 
     }
     
     
     
     ResultSet ts;
        
     
     ts = st.executeQuery("select orders.order_id, products.prod_name, products.prod_type, products.description, products.price, orders.order_date, category.cat_name from orders" 
    	       +" inner join products inner join category inner join user on orders.prod_id = products.prod_id  and orders.user_id = user.user_id  and products.cat_id = category.cat_id  where orders.user_id = '"+user_id+"' and orders.IsPay = 1 ");
    	     
    	     int temp=1;
     
    
		  while(ts.next())
		  {
			  
			  if (temp == ts.getInt(1)){
				  
				  out.print("<table width='1100' height='41' border='1'>");
				  out.println("<tr><th width='150' scope='row'>" +ts.getInt(1) +"</th>"//new row
							+ "<td width='150'>"+ ts.getString(2) +"</td>"
							+ "<td width='150'>"+ ts.getString(3) +"</td>"
							+ "<td width='150'>"+ ts.getString(4) +"</td>"
							+"<td width='150'>"+ ts.getFloat(5) +"</td>"
							+"<td width='150'>"+ ts.getDate(6) +"</td>"
							+"<td width='150'>"+ ts.getString(7) +"</td></tr>");
				  out.print("</table>"); 
				  
			  }
			  else{
				  temp=ts.getInt(1);
			  
				  out.print("<table width='1100' height='41' border='1'>");
			  out.println("<br><tr><th width='150' scope='row'>Order ID</th>"
					    + "<td width='150'>Product Name</td>"
					    + "<td width='150'>Product Type</td>"
					    + "<td width='150'>Product Description</td>"
					    +"<td width='150'>Product Price</td>"
					    +"<td width='150'>Order Date</td>" 
					   + "<td width='150'>Category Name</td></tr>"
						+ "<tr><th width='150' scope='row'>" +ts.getInt(1) +"</th>"//new row
						+ "<td width='150'>"+ ts.getString(2) +"</td>"
						+ "<td width='150'>"+ ts.getString(3) +"</td>"
						+ "<td width='150'>"+ ts.getString(4) +"</td>"
						+"<td width='150'>"+ ts.getFloat(5) +"</td>"
						+"<td width='150'>"+ ts.getDate(6) +"</td>"
						+"<td width='150'>"+ ts.getString(7) +"</td></tr>");
			  
			 
			  }
			  
			  out.print("</table>");
			  /* out.println("Order ID: " + ts.getInt(1)+"<br/>");
			  out.println("Product Name: " + ts.getString(2)+"<br/>");
			  out.println("Product Type: " + ts.getString(3)+"<br/>");
			  out.println("Product Description: " + ts.getString(4)+"<br/>");
			  out.println("Product Price: " + ts.getFloat(5)+"<br/>");
			  out.println("Order Date: " + ts.getDate(6)+"<br/>");
			  out.println("Category Name: " + ts.getString(7)+"<br/>"); */
			  
		  } 
	  
  %>
     
     
<%
    }
%>


</form> </div>
</div>
</div>
<!-- </div> -->
</body>
</html>