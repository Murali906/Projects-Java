package model;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import java.util.Random;
import javax.swing.JOptionPane;


public class update extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) 
	throws ServletException,IOException
	{
	 response.setContentType("text/html");
	 PrintWriter out=response.getWriter();
	 HttpSession session = request.getSession(true);
         
	 String mid=request.getParameter("mid");
         String sid=request.getParameter("sid");
         String aid=request.getParameter("aid");
         String status=null; 
	 
	 
         Calendar calendar = Calendar.getInstance();
    	 java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());        
try
	{ Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/material_gatepass","root","Walnut01");
          Statement stmt=null;
          PreparedStatement st = con.prepareStatement("select a.approve_status from approve_pass a where a.material_id='"+mid+"';");
          ResultSet result = st.executeQuery();
          while(result.next())
          status = result.getString(1);

          if(status.equals("YES"))
           {   stmt = con.createStatement();
               String sql = "update approve_pass set closed='CLOSED' where material_id='"+mid+"'";
               stmt.executeUpdate(sql);
               JOptionPane.showMessageDialog(null, "Transaction Closed");
               RequestDispatcher view = request.getRequestDispatcher("update.jsp");
	       view.forward(request, response);
     
          }
      else
      {        
               JOptionPane.showMessageDialog(null, "Material Not Approved, Transaction not closed!");
               RequestDispatcher view = request.getRequestDispatcher("update.jsp");
	       view.forward(request, response);
      }

}
catch(Exception e)
	{
          JOptionPane.showMessageDialog(null, e.getMessage());
          RequestDispatcher view = request.getRequestDispatcher("update.jsp");
	  view.forward(request, response);
	}
  }
}

      
