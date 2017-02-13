package model;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import java.util.Random;
import javax.swing.JOptionPane;


public class RegNewItem extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) 
	throws ServletException,IOException
	{
	 response.setContentType("text/html");
	 PrintWriter out=response.getWriter();
	 HttpSession session = request.getSession(true);
	 String materialid=request.getParameter("mid");
         String description=request.getParameter("desc");
	 String source=request.getParameter("src");
         String destination=request.getParameter("dest");
	 String type=request.getParameter("type");
         String validity=request.getParameter("valid");
         String staffid=null;
         String approval_id=null;
	 String approve_status=request.getParameter("status");
         String closed=request.getParameter("closed");
	 
         Calendar calendar = Calendar.getInstance();
    	 java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());        

         try
	{ Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/material_gatepass","root","Walnut01");
         
         PreparedStatement st = con.prepareStatement("select staffid from users where userid ='" + request.getSession().getAttribute("session_user") + "'");
         ResultSet result = st.executeQuery();
         while(result.next()){
         staffid  = result.getString("staffid"); 
         }
         PreparedStatement stmt=con.prepareStatement ("insert into request_pass values(?,?,?,?,?,?,?,?)");
	 stmt.setString(1, staffid);
	 stmt.setString(2, materialid);
         stmt.setString(3, description);
	 stmt.setString(4, source);
         stmt.setString(5, destination);
	 stmt.setString(6, type);
         if (type.equals("Returnable"))
             {    stmt.setString(7,validity); }
          else
            {    stmt.setNull(7,java.sql.Types.DATE); }

         stmt.setDate(8,ourJavaDateObject);
	 stmt.executeUpdate();
         
         approval_id=generatePIN();

         PreparedStatement stmt1=con.prepareStatement ("INSERT INTO approve_pass VALUES(?,?,?,DEFAULT,DEFAULT)");
         stmt1.setString(1, approval_id);
         stmt1.setString(2, staffid);
         stmt1.setString(3, materialid);
         stmt1.executeUpdate();
         JOptionPane.showMessageDialog(null, "Item Registered!!");
         RequestDispatcher view = request.getRequestDispatcher("LoginSuccess.jsp");
         view.forward(request, response);
	 con.close();
	}
	catch(Exception e)
	{
          JOptionPane.showMessageDialog(null, e.getMessage());
          RequestDispatcher view = request.getRequestDispatcher("register.jsp");
	  view.forward(request, response);
	}
     }
    public String generatePIN() 
        {   
           int x = (int)(Math.random() * 6);
           x = x + 1;
           Random r = new Random();
           char c = (char)(r.nextInt(26) + 'A');
           String randomPIN = c + (x + "") + ( ((int)(Math.random()*100)) + "" );
          return randomPIN;
        }   
}
      
