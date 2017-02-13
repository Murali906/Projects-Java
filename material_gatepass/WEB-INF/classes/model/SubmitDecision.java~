package model;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import java.util.Random;
import javax.swing.JOptionPane;

public class SubmitDecision extends HttpServlet {
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

      String mid=request.getParameter("mid");
      String decision=request.getParameter("radio");
      HttpSession session = request.getSession(true);
      response.setContentType("text/html");
      String user = (String) request.getSession().getAttribute("session_user");
     try
	{ Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/material_gatepass","root","Walnut01");
          Statement stmt=null;
          if(decision.equals("yes"))
          {    
               stmt = con.createStatement();
               String sql = "update approve_pass set approve_status='YES' where material_id='"+mid+"'";
               stmt.executeUpdate(sql);
               JOptionPane.showMessageDialog(null, "Aprroved");
               if(user.equals("rina"))
               {RequestDispatcher view = request.getRequestDispatcher("approveadmin.jsp");
	       view.forward(request, response);
               }
               else
                {RequestDispatcher view = request.getRequestDispatcher("approve.jsp");
	       view.forward(request, response);
               }
           }

          else
          {    stmt = con.createStatement();
               String sql = "update approve_pass set approve_status='NO' where material_id='"+mid+"'";
               stmt.executeUpdate(sql);
               JOptionPane.showMessageDialog(null, "Declined");
               if(user.equals("rina"))
               {RequestDispatcher view = request.getRequestDispatcher("approveadmin.jsp");
	       view.forward(request, response);
               }
               else
                {RequestDispatcher view = request.getRequestDispatcher("approve.jsp");
	       view.forward(request, response);
               }
           }
 con.close();
}
catch(Exception e)
	{
          
        }
}
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException{
   try {
     doPost(request,response);
   }
  catch(Exception e)
	{
          System.out.println(e.getMessage());
	}
 
}
} //close main
