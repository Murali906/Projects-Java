package model;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import javax.swing.JOptionPane;


public class RequestRegister extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) 
	throws ServletException,IOException
	{
	 response.setContentType("text/html");
	 PrintWriter out=response.getWriter();
	 String name=request.getParameter("nam");
         String sid=request.getParameter("sid");
	 String eid=request.getParameter("eid");
         String phno=request.getParameter("no");
	 String deptid=request.getParameter("did");
         String desig=request.getParameter("desg");
         String branch=request.getParameter("branch");
      
         Calendar calendar = Calendar.getInstance();
    	 java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());        

         try
	{ Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/material_gatepass","root","Walnut01");
        
         PreparedStatement stmt=con.prepareStatement ("insert into newuser values(?,?,?,?,?,?,?,?)");
	 stmt.setString(1, name);
	 stmt.setString(2, sid);
         stmt.setString(3, eid);
	 stmt.setString(4, phno);
         stmt.setString(5, deptid);
	 stmt.setString(6, desig);
         stmt.setString(7, branch);
         stmt.setDate(8,ourJavaDateObject);
	 stmt.executeUpdate();
         
         JOptionPane.showMessageDialog(null, "Your request for registration as new user is complete! Contact Admin to receive Login Credentials!");
         RequestDispatcher view = request.getRequestDispatcher("LoginPage.jsp");
         view.forward(request, response);
	 con.close();
	}
	catch(Exception e)
	{
          JOptionPane.showMessageDialog(null, e.getMessage());
          RequestDispatcher view = request.getRequestDispatcher("requestregister.jsp");
	  view.forward(request, response);
	}
     }
}
      
