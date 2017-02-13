<html>
<head>
<title>Successful Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/loginsuccess.css" rel="stylesheet" type="text/css" media="screen, projection">
</head>
<%
response.setDateHeader("Expires", 0); 
String username = (String) session.getAttribute("session_user");
if (null == username) {
	request.setAttribute("Error", "Session has ended.  Please login.");
	RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
	rd.forward(request, response);
}
%>


<body>
 <div id="wrapper">

   <div id="header">
     <h2> Material Gate Pass System - LEOS </h2>
     <img src="images/logo.png" width="100" height="100">
   </div>


   <div id="content">        
 	   
         <ul class="topnav">
	  	<li><a href="historyadmin.jsp">History</a></li>
                <li><a href="update.jsp">Update Transactions</a></li>
                <li><a href="itemsdue.do">Alerts for Due Items</a></li>
  		<li class="right"><a href="LogoutAction.jsp" onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
	 </ul>
         </br>       
        <h1><i><b><font color="purple"><pre> Welcome ${sessionScope.session_user}!</pre></font></i></b><h1><br>

 	<ul class="image">
        <li class="image" >
	<a href="registeradmin.jsp"> <b>Register New Item</b><img src="images/register.png" alt="Register Material"/></a>
	</li>
	
	<li class="image">
	<a href="approveadmin.jsp"><b>Approve Items</b><img src="images/approved.jpg" alt="approval"/></a>
	</li>
       
	<li class="image">
	<a href="alertadmin.jsp"><b>Alerts</b><img src="images/alerts1.png" alt="alerts"/></a>
	</li>
        
        <li class="image">
	<a href="itemsdueadmin.jsp"><b>Items Due</b><img src="images/material_register.png" alt="Due Material" /></a>
        </li>
	</ul>
 </div>
 <div id="footer">
 <p>Copyright &copy; leos.gov.in</p>
 </div><!-- /end .footer -->
</div>	
</body>
</html>
</html>
