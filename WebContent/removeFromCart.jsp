<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*"
import = "java.lang.*" %>

<%

int userid=1; 
Connection con = null;
int ordNum=1;

session = request.getSession(true);
String user = (String)session.getAttribute("userid");
Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
        "root", "C0xQuest");

Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select user_id from user where user_name ='"+user+"' ");
while(rs.next()){		userid = rs.getInt("user_id");		}


ResultSet rs1;
rs1= st.executeQuery("select ordernum from login where userid='"+userid+"'");

while(rs1.next()){ ordNum=rs1.getInt("ordernum"); 	}

String select[] = request.getParameterValues("removefromcart");
if (select != null && select.length != 0) {
	for (int i = 0; i < select.length; i++) {
		System.out.println("inside of if to table statement" + Integer.parseInt(select[i]));
	PreparedStatement ps = con.prepareStatement("delete from orders where order_id = ? and prod_id = ?");
	ps.setInt(1, ordNum);
	ps.setInt(2, Integer.parseInt(select[i]));
	ps.executeUpdate();
}
}
	response.sendRedirect("Checkout.jsp");
	//<jsp:forward page="Categories.jsp"/>
%>

