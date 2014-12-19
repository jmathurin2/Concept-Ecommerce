<%@page import="sun.security.util.Length"%>
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
<title>CheckOut</title>
</head>

<body>

<img src="J3Hbanner.png" align="middle" align="top" width="1200" height="220" />

<!-- This is the  page navigation2. -->
<center>
<div id="nav">
<a href="Index.jsp">Home</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> |<a href="Categories.jsp">Category</a> | 
</div></center>

<div class="checkoutcart">
<form method='post' action='removeFromCart.jsp'>
		<fieldset>
			<input type='hidden' name='jcartToken' value='d70af3fa312664679464289b28f93591' />
			<table border='7' width='1100'>
								
				<tbody>
					<tr><td id='jcart-empty' colspan='3'>
					
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
    //int z = 0;
   //out.print("<form action='removeFromCart.jsp'  method='post' >");
    for(int j:temp){
    	if(j>0){
    		
    	 	rs3 = st.executeQuery("select prod_name,price,image, description, prod_id from products where prod_id = '"+j+"'");
    	 	
    	 	//if(z==0){out.print("<form action='removeFromCart.jsp'  method='post' >");}
    	
    	 	while(rs3.next()){
    		String image = rs3.getString("image");
    		//System.out.println(rs3.getInt(5));
    		out.print("<tr><td><h4>" +rs3.getString("prod_name")+"</h4>"
    				+ "<img src= 'images/"+image+".jpg' width= 75 height= 100> \n"
    			 + "</td><td>" +rs3.getString(4)+ "</td><td>" 
    				+" $"+ rs3.getFloat("price")+ "</td><td>"+ "<input name = 'removefromcart' type = 'checkbox' value = '" 
   		    			 + rs3.getInt(5) +"'> Remove From Cart</td></tr>");
    		
    		totpri+=rs3.getFloat("price");
    	}
    	 	//if(z==0){out.print("<input name = 'removeSubmit' type = 'submit' value ='Remove From Cart'></form>");
    	 		//z++;}
    	rs3.close();
    	}
    	
    }    
    
%>
</td></tr>
				</tbody>
				<thead>
					<tr>
						<th colspan='3'>
							<strong id='jcart-title'>Shopping Cart</strong> (<%out.print(totitems); %> Items)
						</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan='3'>
							
							<span id='jcart-subtotal'>Subtotal: <strong>$<%out.print(totpri); %></strong></span>
						</th>
					</tr>
				</tfoot>
			</table>

			<div id='jcart-buttons'>
				
			</div>
		</fieldset>
		<input type="submit" value="Submit">
	</form>
 </div> 

<div id="pricing">
	<p id="shipping">
		<strong>Shipping</strong>: Free<span id="shipping"></span>
	</p>

	<p id="sub-total">
		<strong>Total</strong>: $<%out.print(totpri); %><span id="stotal"></span>
	</p>
</div>

<script>
  function validateOrderForm()
  { 
	
    if(document.orderform.name.value=="")
    { 
      alert("Name should not be blank."); 
      document.orderform.name.focus(); 
      return false; 
    }
     
     var e = document.orderform.email.value;
      if(e == null || e == ""){
    	 alert("Email should not be blank"); 
	      document.orderform.email.focus(); return false;
     }   
     var atpos = e.indexOf("@");
     var dotpos = e.lastIndexOf(".");
     if(atpos< 1 || dotpos<atpos+2 || dotpos+2>=e.length)
    {
      alert("Not a valid Email"); 
      document.orderform.email.focus(); return false; 
    }
     
     else if(document.orderform.city.value=="")
     {
       alert("City should not be blank"); 
       document.orderform.city.focus(); return false; 
     }
    
     else if(document.orderform.address.value=="")
     {
       alert("Address should not be blank"); 
       document.orderform.address.focus(); return false; 
     }
     else if(document.orderform.zip.value=="")
     {
       alert("Zip Code should not be blank"); 
       document.orderform.zip.focus(); return false; 
     }
     else if(isNaN(document.orderform.zip.value)){
    	 alert("Numbers only for Zip Code"); 
         document.orderform.zip.focus(); return false;
     }
     else if(document.orderform.CCNo.value=="")
     {
       alert("Credit Card number should not be blank"); 
       document.orderform.CCNo.focus(); return false; 
     }
     else if(isNaN(document.orderform.CCNo.value)){
    	 alert("Numbers only for Credit Card Number Code"); 
         document.orderform.CCNo.focus(); return false;
     }
     else if(document.orderform.CCExpiresMonth.value=="")
     {
       alert("Please select an Expiration Month for your credit card"); 
       document.orderform.CCExpiresMonth.focus(); return false; 
     }
    
     else if(document.orderform.CCExpiresYear.value=="")
     {
       alert("Please select an Expiration Year for your credit card"); 
       document.orderform.CCExpiresYear.focus(); return false; 
     }
     else if(document.orderform.country.value=="")
     {
       alert("Please select a Country"); 
       document.orderform.country.focus(); return false; 
     }
     else if(!document.orderform.billing.checked)
     {
       alert("Is shipping address same as billing?"); 
       document.orderform.CCExpiresYear.focus(); return false; 
     }

   } 

     </script>
	
<form name = "orderform" action="OrderForm.jsp" onsubmit= "return validateOrderForm()" method="post" id="checkout-order-form">
	<h2>Personal Information</h2>
		<fieldset id="fieldset-billing">
			<legend>Billing</legend>
				
<div>
	<label for="name">Name:</label>
	<input type="text" name="name" id="name" data-type="string" data-message="This field may not be empty" />
</div><br>

<div>
	<label for="email">Email:</label>
	<input type="text" name="email" id="email" data-type="expression" data-message="Not a valid email address" />
</div><br>

<div>
	<label for="city">City:</label>
	<input type="text" name="city" id="city" data-type="string" data-message="This field may not be empty" />
</div><br>

<div>
	<label for="address">Address:</label>
	<input type="text" name="address" id="address" data-type="string" data-message="This field may not be empty" />
</div><br>

<div>
	<label for="zip">ZIP Code:</label>
	<input type="text" name="zip" id="zip" data-type="string" data-message="This field may not be empty" />
</div><br>

<div>
	<tr> 
    <td height="22" align="right" valign="middle">Credit Card Number:</td>
    <td colspan="2" align="left"><input name="CCNo" type="text" value="" size="19" maxlength="40"></td>
  </tr>
  <tr> 
    <td height="22" align="right" valign="middle">Expire Date:</td>
    <td colspan="2" align="left">
      <SELECT NAME="CCExpiresMonth" >
        <OPTION VALUE="" SELECTED>--Month--
        <OPTION VALUE="01">January (01)
        <OPTION VALUE="02">February (02)
        <OPTION VALUE="03">March (03)
        <OPTION VALUE="04">April (04)
        <OPTION VALUE="05">May (05)
        <OPTION VALUE="06">June (06)
        <OPTION VALUE="07">July (07)
        <OPTION VALUE="08">August (08)
        <OPTION VALUE="09">September (09)
        <OPTION VALUE="10">October (10)
        <OPTION VALUE="11">November (11)
        <OPTION VALUE="12">December (12)
      </SELECT> /
      <SELECT NAME="CCExpiresYear">
        <OPTION VALUE="" SELECTED>--Year--
        <OPTION VALUE="14">2014
        <OPTION VALUE="15">2015
        <OPTION VALUE="16">2016
        <OPTION VALUE="17">2017
        <OPTION VALUE="18">2018
        <OPTION VALUE="19">2019
        <OPTION VALUE="20">2020
        <OPTION VALUE="21">2021
              
      </SELECT>
    </td>
  </tr>
  <tr> 
    <td height="22" colspan="3" align="left" valign="middle">&nbsp;</td>
</div>

<div>
	<label for="country">Country</label>
		<select name="country" id="country" data-type="string" data-message="This field may not be empty">
			<option value="">Select</option>
			<option value="">USA</option>
			<option value="IT">Austria</option>
			<option value="IT">Belize</option>
			<option value="IT">Brazil</option>
			<option value="IT">Italy</option>
		</select>
</div>
</fieldset>

<div id="shipping-same">Same as Billing <input name = "billing" type="checkbox" id="same-as-billing" value=""/></div>

<fieldset id="fieldset-shipping">
<legend>Shipping</legend>
	<!-- Same fields as billing -->
</fieldset></div>

<p><input type="submit" id="submit-order" value="Submit Order" class="btn" /></p>

</form>
</body>
</html>

