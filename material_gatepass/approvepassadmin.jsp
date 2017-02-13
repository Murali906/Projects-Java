<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/approvepass.css" rel="stylesheet" type="text/css" media="screen, projection">

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
<body>
<div id="wrapper">

<div id="header">
<h2> Material Gate Pass System - LEOS </h2>
<img src="images/logo.png" width="100" height="100">
</div>

<div  id="content">

 <ul class="topnav">
   <li><a href="approveadmin.jsp">Back</a></li>
   <li><a href="LoginSuccessAdmin.jsp">Home</a></li>
   <li class="right"><a href="LogoutAction.jsp" onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
  </ul>

<sql:setDataSource var="material_gatepass" driver="${initParam.jdbcDriver}" url="${initParam.dbUrl}" user="${initParam.authUser}" password="${initParam.authPass}" />
  
  <sql:query dataSource="${material_gatepass}" sql="select u.firstname, u.lastname, r.material_id, r.source, r.destination, r.m_type,r.material_desc, r.currentdate, r.returndate from request_pass r, approve_pass a, users u where r.staffid IN (select u.staffid from users u, division_details d where u.divisionid=d.divisionid and d.staffid_dh IN (select u.staffid from users u where u.userid='${sessionScope.session_user}')) and r.material_id=a.material_id and r.material_id='${param.id}' and a.approve_status='PENDING' and r.staffid=u.staffid and r.m_type='Non-Returnable'" var="result" />
              
                <pre><c:forEach var="row" items="${result.rows}">
                       <b>Name of the Indentor</b> : ${row.firstname} ${row.lastname} </br>
                       <b>Material ID</b>          : ${row.material_id} </br>
                       <b>Source</b>               : ${row.source} </br>
                       <b>Destination</b>          : ${row.destination} </br>
                       <b>Material Type</b>        : ${row.m_type} </br>
                       <b>Description</b>          : ${row.material_desc} </br>
                       <b>Date of Request</b>      : ${row.currentdate} 
                 </c:forEach></pre>
     <sql:query dataSource="${material_gatepass}" sql="select u.firstname, u.lastname, r.material_id, r.source, r.destination, r.m_type,r.material_desc, r.currentdate, r.returndate from request_pass r, approve_pass a, users u where r.staffid IN (select u.staffid from users u, division_details d where u.divisionid=d.divisionid and d.staffid_dh IN (select u.staffid from users u where u.userid='${sessionScope.session_user}')) and r.material_id=a.material_id and r.material_id='${param.id}' and a.approve_status='PENDING' and r.staffid=u.staffid and r.m_type='Returnable'" var="result" />
                <pre><c:forEach var="row" items="${result.rows}">
                       <b>Name of the Indentor</b> : ${row.firstname} ${row.lastname} </br>
                       <b>Material ID</b>          : ${row.material_id} </br>
                       <b>Source</b>               : ${row.source} </br>
                       <b>Destination</b>          : ${row.destination} </br>
                       <b>Material Type</b>        : ${row.m_type} </br>
                       <b>Description</b>          : ${row.material_desc} </br>
                       <b>Date of Request</b>      : ${row.currentdate} </br>
                       <b>Date of Return</b>       : ${row.returndate}  
                 </c:forEach></pre>
<center>
<form action="sumbit.do" method=get>
  <input type="radio" id="radio01" name="radio" value="yes" />
  <label for="radio01"><span></span>Approve</label>       
  <input type="radio" id="radio02" name="radio" value="no"  /> 
  <label for="radio02"><span></span>Decline</label> </br></br>
  <input type="hidden" name="mid" value="<c:out value="${param.id}"/>" />  
  <input type="submit" name="sub" value="Submit"/>
</form>
</center>
</div>

<div id="footer">
<p>Copyright &copy; leos.gov.in</p>
</div>

</div>
</body>
</html>
