<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script>
function showme(){
var s = document.form1.type;
var h = document.form1.valid;
if( s.selectedIndex == 1 ) {
h.style.visibility="visible";
}else{
h.style.visibility="hidden";
}
}
</script>
<link href="css/register.css" rel="stylesheet" type="text/css" media="screen, projection">
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
 <title>Register Item</title>
<div class="header">
<h2> Material Gate Pass System - LEOS </h2>
<img src="images/logo.png" width="100" height="100">
</div>
<ul class="topnav">
   <li><a href="LoginSuccess.jsp">Back</a></li>
   <li><a href="LoginSuccess.jsp">Home</a></li>
   <li class="right"><a href="LogoutAction.jsp" onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
  </ul>
 <center>
 <h2>Registration Form</h2>
 </center>
 <form action="register" name="form1" method="POST">
 <center><input type="text" id="nam" name="nam" placeholder="Enter your name" required ></br>
 <input type="text" id="mid" name="mid" placeholder="Material ID" required ></br>
 <textarea name="desc" placeholder="Enter item description..." required></textarea>
 <br>
 <br>
 <select id="src" name="src" placeholder="Source">
     <option value="null" >  Source   </option>
     <option value="LEOS">LEOS</option>
     <option value="ISTRAC">ISTRAC</option>
     <option value="ISAC">ISAC</option>
   </select>
 <br>
 <br>
  <select id="dest" name="dest" placeholder="Destination">
     <option value="null" >  Destination   </option>
     <option value="LEOS">LEOS</option>
     <option value="ISTRAC">ISTRAC</option>
     <option value="ISAC">ISAC</option>
   </select> 
<br>
<br>
 <select id="type" name="type" onchange="showme()" placeholder="Material Type">
    <option value="null" >  Material Type   </option>
    <option value="Returnable">Returnable</option>
    <option value="Non-Returnable">Non-Returnable</option>
  </select><br/><br/>
<input type ="text" name="valid" id="valid" style="position:relative;visibility:hidden; width:50%; padding: 10px 10px;" placeholder="Enter the date of return (yyyy-mm-dd)" >
<br/>
<br/>

<input type="submit" value="Register Item">
<input type="reset" value="Reset">  
</center>
</form>


<div class="footer">
<p>Copyright &copy; leos.gov.in</p>
</div>
</body>
</html>
