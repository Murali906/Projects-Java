<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/approve_css.css" rel="stylesheet" type="text/css" media="screen, projection">

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

  <ul class="topnav">
  <li><a href="LoginSuccessAdmin.jsp">Back</a></li>
  <li><a href="LoginSuccessAdmin.jsp">Home</a></li>
  <li class="right"><a href="LogoutAction.jsp" onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
  </ul>

 <div id="content">
 <sql:setDataSource var="material_gatepass" driver="${initParam.jdbcDriver}" url="${initParam.dbUrl}" user="${initParam.authUser}" password="${initParam.authPass}" />

    <sql:query dataSource="${material_gatepass}" sql="select r.material_id, r.m_type, r.currentdate, r.material_desc, u.firstname, u.lastname from request_pass r, approve_pass a, users u where r.staffid IN (select u.staffid from users u, division_details d where u.divisionid=d.divisionid and d.staffid_dh IN (select u.staffid from users u where u.userid='${sessionScope.session_user}'))and r.material_id=a.material_id and a.approve_status='PENDING' and u.staffid=r.staffid;" var="resultcount"/>
 <c:choose>
   <c:when test="${resultcount.rowCount == 0}">
      <h2><center> No Approvals </center></h2>
   </c:when>

 <c:otherwise>
   <sql:query dataSource="${material_gatepass}" sql="select r.material_id, r.m_type, r.currentdate, r.material_desc, u.firstname, u.lastname from request_pass r, approve_pass a, users u where r.staffid IN (select u.staffid from users u, division_details d where u.divisionid=d.divisionid and d.staffid_dh IN (select u.staffid from users u where u.userid='${sessionScope.session_user}'))and r.material_id=a.material_id and a.approve_status='PENDING' and u.staffid=r.staffid;" var="result" />
              
                 <table width = "500" cellspacing = "1" cellpadding = "2" align = "center">
                   <caption><h3><center> Approvals to be Made </center></h3></caption>
                   <tr>
                       <th>Name of the Indentor</th>
                       <th>Material ID</th>
                       <th>Material Type</th>
                       <th>Description</th> 
                       <th>Date of Request</th>
                       <th>Take Action</th>
                   </tr>                  
                   <c:forEach var="row" items="${result.rows}">
                     <tr>
        <td><center>${row.firstname} ${row.lastname}</center></td> <td><center>${row.material_id}</center></td> <td><center>${row.m_type}</center></td> <td><center>${row.material_desc}</center></td> <td><center>${row.currentdate}</center></td> <td><center><a href="<c:url value="/approveadmin.do"><c:param name="id" value="${row.material_id}"/></c:url>">View</a></center></td>  
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
