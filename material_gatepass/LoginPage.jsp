<html>
<head>
<title>Material GatePass Login </title>
<link href="css/LoginPage.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
</head>
<body>

<div class="header">
<h2> Material Gate Pass System - LEOS </h2>
<img src="images/logo.png" width="100" height="100">
</div>

<div class="row">
<div class="col-3 col-s-3 menu height">
<ul>
<li>
<div>
   <form action="ValidateLogin" method="post">
    <input type="text" id="fname" name="uname" placeholder="Username">
    <input type="password" id="lname" name="pass" placeholder="Password">
    <input type="submit" value="Login"  >
   </form>
</li>
<li><a href="requestregister.jsp"/>New User? Request Register </a></li>
<li>About Us</li>
<li>Contact Us</li>
</ul>
</div>

<div class="col-6 col-s-9">
<center>
<p>

<p>
<img src="images/inventory.png" width="450" height="350"/>
</center>
</div>

<div class="col-5 col-s-12">
<div class="aside">
<h2>Register</h2>
<p>Registration of Material</p>
<h2>Approval</h2>
<p>Hierarchical approval of the gate pass</p>
<h2>Dispatch</h2>
<p>Entry/Exit of the material through the security desk</p>
<h2>Alerts</h2>
<p>Alerts/Report generation for Returnable material.<br>Transaction closed for the Non-returnable items</p>
</div>
</div>
</div>

<div class="footer">
<p>Copyright &copy; leos.gov.in</p>
</div>

</body>
</html>
