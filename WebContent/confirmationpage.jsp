<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*"
import = "java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
	PreparedStatement ps = con.prepareStatement("update orders set IsPay = 1 where order_id = '"+ ordNum +"'");
	ps.execute();
		%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="web.css" rel="stylesheet" type="text/css" />

<title>Confirmation Page</title>
 <!-- This is the  page banner. -->
<img src="J3Hbanner.png" align="middle" align="top" width="1200" height="220" />

<!-- This is the  page navigation2. -->
<center>
<div id="nav">
<a href="Categories.jsp">Home</a> | <a href="User.jsp">Edit Profile</a> | <a href="Logout.jsp">Logout</a> | <a href="Admin_Login.jsp">Admin Login</a> 
</div></center>

</head>
<body>
<div class="picture1">
<h1><div class="conwords">Your Purchased Item(s) Has Been Confirmed!! Please Come Again!!</div></h1>
<img src="confimedshopcardpicture.png" height="500" width="600">
</div>

<div class="picture2">
<img src="confirmationshopcartpic2.png" height="500" width="800">
</div>
</body>


<div class="slideshow1">
<!-- This is code thats used to create picture slide show -->
<a href="javascript:gotoshow()"><img src="" name="slide" border=0 width=300 height=250></a>
<script>


//configure the paths of the images, plus corresponding target links
slideshowimages("22jumpstreet.jpg","battlefieldbadcompany2.jpg","bloodandbone.jpg",
 "canon.jpg","codadvancewarfare.jpg","despicableme.jpg","dragonageorigins.jpg",
 "elderscrolls.jpg","fastandfurious.jpg","frozen.jpg","galaxys5.jpg",
 "insideman.jpg","insidious.jpg","ipadair2.jpg","iphone6.jpg",
 "lastofus.jpg","lawabidingcitizen.jpg","mama.jpg","nba2k15.jpg","samsung4k55.jpg",
 "ShawshankRedemption.jpg","sonycamera.jpg","surfacepro3.jpg","thegodfather.jpg","thinklikeaman.jpg",
 "vizio85.jpg")

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

<div class="btcat">
<a href="Categories.jsp"> Back To Categories</a>
</div>
</html>