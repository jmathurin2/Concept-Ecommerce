<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*"
import = "java.lang.*" %>

<% float totpri=0;
	int totitems=0;%>
	
	
	



<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<link href="web.css" rel="stylesheet" type="text/css" />
<title>Order Form</title>
</head>

<body>
<div class="orderformcart">
<form action="confirmationpage.jsp" method="post" id="checkout-order-form">
<h1>Your Order</h1>
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
	
	
	ResultSet rs2;
	rs2 = st.executeQuery("select prod_id from orders where order_id='"+ordNum+"'");
	int [] temp=new int [20];
	int i=0;
    while(rs2.next())
	{	
    	temp[i]=rs2.getInt("prod_id");
    	totitems++;
    	i++;
	}
    ResultSet rs3;
   
    for(int j:temp){
    	if(j>0){
    		
    	 	rs3 = st.executeQuery("select prod_name,price,image from products where prod_id = '"+j+"'");
    	while(rs3.next()){
    		out.print("<h4>" +rs3.getString("prod_name")+"</h4>"
        			+" \t"+" $"+ rs3.getFloat("price"));
    		totpri+=rs3.getFloat("price");
    	}
    	rs3.close();
    	}
    	
    }%>
<table id="checkout-cart" class="shopping-cart">
	<thead>
		<tr>
			<th scope="col">Item</th>
			<th scope="col">Qty:<%out.print(" " + totitems); %></th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>

<div id="pricing">
	<p id="shipping">
		<strong>Shipping</strong>: Free <span id="shipping"></span>
	</p>

	<p id="sub-total">
		<strong>Total: $<%out.print(totpri); %></strong> <span id="stotal"></span>
	</p>
</div>

<div id="user-details">
	<h2>Your Data</h2>
		<div id="user-details-content"></div>
</div>

<div>
	<label for="name">Name:</label>
	<%out.print(request.getParameter("name"));%>
</div><br>

<div>
	<label for="email">Email:</label>
	<%out.print(request.getParameter("email"));%>
</div><br>

<div>
	<label for="city">City:</label>
	<%out.print(request.getParameter("city"));%>
</div><br>

<div>
	<label for="address">Address:</label>
	<%out.print(request.getParameter("address"));%>
</div><br>

<div>
	<label for="zip">ZIP Code:</label>
	<%out.print(request.getParameter("zip"));%>
</div><br>

<form id="paypal-form" action="" method="post">
	<input type="hidden" name="cmd" value="_cart" />
	<input type="hidden" name="upload" value="1" />
	<input type="hidden" name="business" value="" />

	<input type="hidden" name="currency_code" value="" />
	<input type="submit" id="paypal-btn" class="btn" value="Confirm Order" />
</form></div>




</body>
</div>

</html>
