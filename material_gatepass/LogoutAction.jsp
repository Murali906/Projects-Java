<%
response.setHeader("Cache-Control","no-cache"); //forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
session.removeAttribute("session_user");
session.invalidate();
RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
rd.forward(request, response);
%>
