<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import ="java.sql.*"
import = "java.lang.*" %><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<!-- This is the java script to use to activate the picture slide show -->
<script language="JavaScript1.1">

/*
JavaScript Image slideshow:
*/

var slideimages=new Array()
var slidelinks=new Array()
function slideshowimages(){
for (i=0;i<slideshowimages.arguments.length;i++){
slideimages[i]=new Image()
slideimages[i].src=slideshowimages.arguments[i]
}
}

function slideshowlinks(){
for (i=0;i<slideshowlinks.arguments.length;i++)
slidelinks[i]=slideshowlinks.arguments[i]
}

function gotoshow(){
if (!window.winslide||winslide.closed)
winslide=window.open(slidelinks[whichlink])
else
winslide.location=slidelinks[whichlink]
winslide.focus()
}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Categories</title>
<link href="web.css" rel="stylesheet" type="text/css" />

<center>

    <!-- This is the  page banner. -->
<img src="J3Hbanner.png" align="middle" align="top" width="1200" height="220" />



<!-- This is the  page navigation2. -->
<center>


<div id="nav">
<a href="Index.jsp">Home</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> 
</div></center>



</head>
<body>
<div class="form1" style="color:blue;" align="right" >
<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) 
{
%>
You are not logged in,
<a href="Index.jsp">Please Login</a>
<%
} 
    
else 
{
%>
</br></br></br></br>
<%-- Welcome <%=session.getAttribute("userid")%> --%>
<!-- </br>
</br>
</br>
</br> -->

<div class="selectionMGE">
<a href='Movies.jsp'>Movies</a></br>
<a href='Games.jsp'>Games</a></br>
<a href='Electronics.jsp'>Electronics</a></br>
</div>
<%
    }
%>


</form>
 </div> 

<div id="categoriesfooter"><center>
    		Copyright © J3H Ecommerce 2014, All Rights Reserved.</center>
	</div>
</body>
 <div class="categoriesslideshow">
<!-- This is code thats used to create picture slide show -->
<a href="javascript:gotoshow()"><img src="" name="slide" border=0 width=300 height=200></a>
<script>


//configure the paths of the images, plus corresponding target links
slideshowimages("images/samsung4k55.jpg","images/lastofus.jpg","images/fastandfurious.jpg",
  "images/canon.jpg","images/codadvancewarfare.jpg","images/despicableme.jpg","images/dragonageorigins.jpg",
 "images/elderscrolls.jpg","images/bloodandbone.jpg","images/frozen.jpg","images/galaxys5.jpg",
 "images/insideman.jpg","images/insidious.jpg","images/ipadair2.jpg","images/iphone6.jpg",
 "images/battlefieldbadcompany2.jpg","images/lawabidingcitizen.jpg","images/mama.jpg","images/nba2k15.jpg","images/22jumpstreet.jpg",
 "images/ShawshankRedemption.jpg","images/sonycamera.jpg","images/surfacepro3.jpg","images/thegodfather.jpg","images/thinklikeaman.jpg",
 "images/vizio85.jpg")

//configure the speed of the slideshow, in miliseconds
var slideshowspeed=5000

var whichlink=0
var whichimage=0
function slideit(){
if (!document.images)
return
document.images.slide.src=slideimages[whichimage].src
whichlink=whichimage
if (whichimage<slideimages.length-1)
whichimage++
else
whichimage=0
setTimeout("slideit()",slideshowspeed)
}
slideit()
</script>
</div>

<!--This is the small boxed shopping cart code at the top right handed side-->

<div class="sc1" class="form1" style="color:white;">
Welcome, <%=session.getAttribute("userid")%>
<form method='post' action='Checkout.jsp'>
		<fieldset>
			<input type='hidden' name='jcartToken' value='d70af3fa312664679464289b28f93591' />
			<table border='1'>
								
				<tbody>
					<tr><td id='jcart-empty' colspan='3'>
					
<%	 float totpri=0;
int totitems=0;
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
    	
    	rs3 = st.executeQuery("select prod_name,price from products where prod_id = '"+j+"'");
    	while(rs3.next()){
    		out.print("<tr><td><h4>" +rs3.getString("prod_name")+"</h4>"
        			+"</td><td>"+" $"+ rs3.getFloat("price")+"</td></tr>");
    		totpri+=rs3.getFloat("price");
    	}
    	rs3.close();
    	}
    	
    }    
	
%></td></tr>
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
				<input type='submit'  name='jcartEmpty' value='Checkout' class='jcart-button' />
			</div>
		</fieldset>
	</form>
 </div>
</html>