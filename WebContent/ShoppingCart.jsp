
<%@ page import ="java.sql.*"
import = "java.lang.*" %>

<!--This is the small boxed shopping cart code at the top right handed side-->
<div class="sc1">
<form method='post' action='checkout.jsp'>
		<fieldset>
			<input type='hidden' name='jcartToken' value='d70af3fa312664679464289b28f93591' />
			<table border='1'>
				<thead>
					<tr>
						<th colspan='3'>
							<strong id='jcart-title'>Shopping Cart</strong> (0 Items)
						</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan='3'>
							
							<span id='jcart-subtotal'>Subtotal: <strong>$0.00</strong></span>
						</th>
					</tr>
				</tfoot>
				<tbody>
					<tr><td id='jcart-empty' colspan='3'>Your cart is empty!</td></tr>
				</tbody>
			</table>

			<div id='jcart-buttons'>
				<input type='submit'  name='jcartUpdateCart' value='update' class='jcart-button' />
				<input type='submit'  name='jcartEmpty' value='empty' class='jcart-button' />
                <p><input type="submit" id="submit-order" value="Submit" class="btn" /></p>
			</div>
		</fieldset>
	</form>
</div>
<br>
<br>
<br>

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
	
	String select[] = request.getParameterValues("addtocart"); 
	if (select != null && select.length != 0) {
	for (int i = 0; i < select.length; i++) {
		PreparedStatement ps = con.prepareStatement("insert into orders values(?,?,?,1,now(),0)");
		ps.setInt(1, ordNum);
		ps.setInt(2, userid);
		ps.setInt(3, Integer.parseInt(select[i]));
		ps.execute();
	}
	}
	
	response.sendRedirect("Categories.jsp");
%>

<link href="webcssexample.css" rel="stylesheet" type="text/css">
</head>
<%-- 
<%@ page import ="java.sql.*"
import = "java.lang.*" %>
<%! int userid; %>
<%
	
	session = request.getSession(true);
	String user = (String)session.getAttribute("userid");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce",
	        "root", "C0xQuest");
	
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select user_id from user where user_name ='"+user+"' ");
	
	
	while(rs.next()){
		userid = rs.getInt("user_id");
		
	}
	
if(null != request.getParameter("sub")){
    
	
	String one = request.getParameter("Fast and Furious");
	String two = request.getParameter("Blood and Bone");
	String three = request.getParameter("Frozen");
	String four = request.getParameter("The Shawshank Redemption");
	String five = request.getParameter("The Godfather");
	String six = request.getParameter("Mama");
	String seven = request.getParameter("Law AbidingCitizen");
	String eight = request.getParameter("Inside Man");
	String nine = request.getParameter("22 Jump Street");
	String ten = request.getParameter("Think Like A Man");
	String eleven = request.getParameter("Despicable Me");
	String twelve = request.getParameter("Insidous");
	
		
	if (one != null)
	{
		int prod1 = Integer.parseInt(request.getParameter("Fast and Furious"));
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,2,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Fast and Furious")));
		ps.execute();
		
	}
	if (two != null)
	{
		System.out.print(two);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,1,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Blood and Bone")));
		ps.execute();
	}
	if (three != null){
		System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,11,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Frozen")));
		ps.execute();
	}
	if (four != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,3,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("The Shawshank Redemption")));
		ps.execute();
	}
	if (five != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,4,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("The Godfather")));
		ps.execute();
	}
	if (six != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,5,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Mama")));
		ps.execute();
	}
	if (seven != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,6,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Law Abiding Citizen")));
		ps.execute();
	}
	if (eight != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,7,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Inside Man")));
		ps.execute();
	}
	if (nine != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,8,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("22 Jump Street")));
		ps.execute();
	}
	if (ten != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,9,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Think Like A Man")));
		ps.execute();
	}
	if (eleven != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,10,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Despicable Me")));
		ps.execute();
	}
	if (twelve != null){
		//System.out.print(three);
		PreparedStatement ps = con.prepareStatement("insert into orders values(1,?,12,1)");
		ps.setInt(1, userid);
		//ps.setInt(2, Integer.parseInt(request.getParameter("Insidous")));
		ps.execute();
	}	
    
     
    response.sendRedirect("Movies.jsp");
}
%>
--%>