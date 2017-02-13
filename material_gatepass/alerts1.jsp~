<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style type="text/css" media="screen, projection">
.header {
    background-color: black;
    text-align: center;
    color: white;
    padding: 15px;
}
</style>


<html>
  <title>Alerts</title>

<div class="header">
<h2> Material Gate Pass System - LEOS </h2>
<img src="images/ISRO_Logo.jpg" width="100" height="100">
</div>

<body>
  <sql:setDataSource var="material_gatepass" driver="${initParam.jdbcDriver}" url="${initParam.dbUrl}" user="${initParam.authUser}" password="${initParam.authPass}" />
    <sql:query dataSource="${material_gatepass}" sql="select u.firstname, a.material_id, a.approval_id from users u, approve_pass a  where u.staffid=(select distinct d.staffid_dh from users u, approve_pass a, division_details d where a.approve_status='yes' and a.staffid=u.staffid and u.userid= '${sessionScope.session_user}' and u.divisionid=d.divisionid) and a.staffid=(select distinct a.staffid from approve_pass a, users u where u.userid= '${sessionScope.session_user}' and a.staffid=u.staffid)" var="result" />

 <table border="1" cellpadding="5" align="center">
    <caption><h2>Notifications!!</h2></caption>
       <tr>
                <th>Firstname</th>
                <th>Material ID</th>
                <th>Approval ID</th>
       </tr>
      <c:forEach var="row" items="${result.rows}">
       
       <tr>
        <td>${row.firstname}</td> <td>${row.material_id}</td> <td>${row.approval_id}</td> 
      </tr>
    </c:forEach>
  </table>
<!--<div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of users</h2></caption>
           
            <td>
             <c:forEach items="${AlertList}" var="List">
             <c:out value="${List}" /> 
             </c:forEach>
            </td>
        </table>
    </div>
-->
</body>
