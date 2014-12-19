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
<title>Admin</title>
<script>
  function validateForm()
  { 

    if(document.form1.Username.value=="")
    { 
      alert("User Name should not be blank.."); 
      document.frm.Username.focus(); 
      return false; 
    }
    else if(document.form1.Password.value=="")
    {
      alert("Password should not be blank"); 
      document.form1.Password.focus(); return false; 
    }

   } 

     </script>
</head>
<body>
<%
    String userid = request.getParameter("Username");    
    String pwd = request.getParameter("Password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
            "root", "C0xQuest");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Admin where Username='" + userid + "' and Password='" + pwd + "'");
   
    if (rs.next()) 
    {
        session.setAttribute("userid", userid);
        response.sendRedirect("Admin_Control_Panel.jsp");
        //response.sendRedirect("Product_Categories.jsp");
        
    } 
    else 
    {
    	response.sendRedirect("Admin_Login.jsp");
        out.println("Invalid password <a href='Admin_Login.jsp'>try again</a>");
    }
%>
</body>
</html>