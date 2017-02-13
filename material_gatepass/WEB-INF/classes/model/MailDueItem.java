package model;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import java.util.Random;
import javax.swing.JOptionPane;
import web.*;

public class MailDueItem extends HttpServlet {
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

      HttpSession session = request.getSession(true);
      response.setContentType("text/html");
      String name = (String) session.getAttribute("session_user");  
      //SendMail send1=new SendMail();
        //  send1.mailsend(session);
    
     try
	{ 
          Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/material_gatepass","root","Walnut01");
         PreparedStatement st = con.prepareStatement("select u.userid, r.material_id, timestampdiff(day,sysdate(),returndate) as 'days_until_return' from request_pass r, users u where u.staffid=r.staffid and r.m_type='Returnable' and r.material_id IN (select material_id from approve_pass where approve_status='YES') and timestampdiff(day, sysdate(), returndate)<10");
         ResultSet rs = st.executeQuery();
      
    while(rs.next()){
           
          SendMail send=new SendMail();
          send.mailsend(rs.getString(1),rs.getString(2),rs.getInt(3));
      }
 con.close();
}
catch(Exception e)
	{
         System.out.println("Error");
	}
          JOptionPane.showMessageDialog(null, "Alerts Sent!!");
          RequestDispatcher view = request.getRequestDispatcher("LoginSuccessAdmin.jsp");
          view.forward(request, response);
   
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
} 












