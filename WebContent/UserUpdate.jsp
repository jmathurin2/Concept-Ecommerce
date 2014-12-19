<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*"
import = "java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//If the Update button is clicked in the user profile page, then update the user info if with any changes.
if(null != request.getParameter("Submit"))
{
String fname = request.getParameter("FName");
String lname = request.getParameter("LName");
String Uname = request.getParameter("user_name");
String pw = request.getParameter("password");
String email = request.getParameter("email");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
        "root", "C0xQuest");

PreparedStatement st = con.prepareStatement("update user set FName = '"+fname+
											"',LName = '"+lname+
											"',user_name = '"+Uname+
											"',password = '"+pw+
											"',email = '"+email+
											"'where  user_name = '"+Uname+"'"); 
/* st.setString(1,fname);
st.setString(2,lname);
st.setString(3,Uname);
st.setString(4,pw);
st.setString(5,email); */


int i = st.executeUpdate();

if (i > 0) 
{
response.sendRedirect("User.jsp");
}

}
%>
</body>
</html>