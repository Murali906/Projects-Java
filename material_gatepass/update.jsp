<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/update.css" rel="stylesheet" type="text/css" media="screen, projection">
<%
response.setHeader("Cache-Control","no-cache"); //forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility

String username = (String) session.getAttribute("session_user");
if (null == username) {
	request.setAttribute("Error", "Session has ended.  Please login.");
	RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
	rd.forward(request, response);
}
%>

<html>
<body>
 <title>Close Transactions</title>
<div id="wrapper">
<div id="header">
<h2> Material Gate Pass System - LEOS </h2>
<img src="images/logo.png" width="100" height="100">
</div>
<div id="content">
<ul class="topnav">
   <li><a href="LoginSuccessAdmin.jsp">Back</a></li>
   <li><a href="LoginSuccessAdmin.jsp">Home</a></li>
   <li class="right"><a href="LogoutAction.jsp" onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
  </ul>
 <center>
 <h2>Enter Details of the Transaction to be Closed</h2>
 </center>
 <form action="update" name="form1" method="POST">
 <center><input type="text" id="mid" name="mid" placeholder="Enter Material ID" required ></br>
 <input type="text" id="aid" name="mid" placeholder="Enter Approval ID" required ></br>
 <input type="text" id="sid" name="mid" placeholder="Enter Staff ID" required ></br>
 <br>

<input type="submit" value="Close Transaction">

</center>
</form>
</div>
<div id="footer">
<p>Copyright &copy; leos.gov.in</p>
</div>
</div>
</body>
</html>
