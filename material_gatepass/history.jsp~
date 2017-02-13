<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/itemsdue.css" rel="stylesheet" type="text/css" media="screen, projection">
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

<title>History</title>
<body>

<div id="wrapper">
<div id="header">
<h2> Material Gate Pass System - LEOS </h2>
<img src="images/logo.png" width="100" height="100">
</div>

<ul class="topnav">
  <li><a href="LoginSuccess.jsp">Back</a></li>
  <li><a href="LoginSuccess.jsp">Home</a></li>
  <li class="right"><a href="LogoutAction.jsp" onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
</ul>

<div id="content">

<sql:setDataSource var="material_gatepass" driver="${initParam.jdbcDriver}" url="${initParam.dbUrl}" user="${initParam.authUser}" password="${initParam.authPass}" />
 	<sql:query dataSource="${material_gatepass}" sql="select u.firstname, u.lastname, a.material_id, a.approval_id,a.approve_status, a.closed, r.material_desc  from users u, request_pass r, approve_pass a  where u.staffid=(select distinct d.staffid_dh from users u, approve_pass a, division_details d where a.staffid=u.staffid and u.userid= '${sessionScope.session_user}' and u.divisionid=d.divisionid) and a.staffid=(select distinct a.staffid from approve_pass a, users u where u.userid= '${sessionScope.session_user}' and a.staffid=u.staffid) and a.material_id=r.material_id and a.approve_status='YES' and a.closed='CLOSED'" var="resultcount" />
	<c:choose>
   		<c:when test="${resultcount.rowCount == 0}">
      		<h3><center> No Closed Transactions! </center></h3>
   		</c:when>
   	<c:otherwise>
  		<sql:query dataSource="${material_gatepass}" sql="select u.firstname, u.lastname, a.material_id, a.approval_id,a.approve_status, a.closed, r.material_desc  from users u, request_pass r, approve_pass a  where u.staffid=(select distinct d.staffid_dh from users u, approve_pass a, division_details d where a.staffid=u.staffid and u.userid= '${sessionScope.session_user}' and u.divisionid=d.divisionid) and a.staffid=(select distinct a.staffid from approve_pass a, users u where u.userid= '${sessionScope.session_user}' and a.staffid=u.staffid) and a.material_id=r.material_id and a.approve_status='YES' and a.closed='CLOSED'" var="result" />

 		<table class="table1" align="center">
		     <caption><h3><center> History </center></h3></caption>
       			<tr>
                	<th>Approved By</th>
                	<th>Material ID</th>
                	<th>Approval ID</th>
                	<th>Material Description</th>   
                	<th>Approval Status</th>
                	<th>Transcation Status</th>
       			</tr>
		      <c:forEach var="row" items="${result.rows}">
			       <tr>
        			<td><center>${row.firstname} ${row.lastname}</center></td> <td><center>${row.material_id}</center></td> <td><center>${row.approval_id}</center></td> <td><center>${row.material_desc}</center></td> <td><center>${row.approve_status}</center></td> <td><center>${row.closed}</center></td> 
  				</tr>
   		      </c:forEach>
 		 </table>
 	</c:otherwise>	
 	</c:choose>     
</div>

<div id="footer">
<p>Copyright &copy; leos.gov.in</p>
</div>

</div>
</body>
</html>
