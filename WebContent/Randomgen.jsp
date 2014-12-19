<%@ page import ="java.sql.*"
import = "java.lang.*" %>
<%@page import="java.util.Random"%>

<%
Random rand = new Random();
int randnum = rand.nextInt(90000) + 100000;

int userid=0; 
Connection con = null;
session = request.getSession(true);
String user = (String)session.getAttribute("userid");
Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root", "C0xQuest");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select user_id from user where user_name ='"+user+"' ");
while(rs.next()){	userid = rs.getInt("user_id");	}
	

PreparedStatement ps = con.prepareStatement("insert into login values(?,?,now())");
ps.setInt(1, userid);
ps.setInt(2, randnum);

ps.executeUpdate();

response.sendRedirect("Categories.jsp");
%>