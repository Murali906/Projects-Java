package model;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.swing.JOptionPane;
import javax.servlet.http.*;

public class ValidateLogin extends HttpServlet {
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
      String n = request.getParameter("uname");
      String p = request.getParameter("pass");
      PrintWriter out = response.getWriter();
      HttpSession session = request.getSession(true);
      String username1 = null;
      String password1 = null;
      Connection conn = null;
      Statement  stmt = null;
      String entered_pass = "abc", d_user = "pqr", d_pass = "xyz";
      response.setContentType("text/html");
   try
      {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost/material_gatepass","root","Walnut01");
      //PreparedStatement st = conn.prepareStatement("select userid,password from users where userid = '"+n+"'");
      PreparedStatement st = conn.prepareStatement("SELECT PASSWORD('" + p + "') as entered_pass, userid as d_user, password as d_pass FROM users where userid = '" + n + "'");
      ResultSet rs = st.executeQuery();
      Statement stmt1 = conn.createStatement();
      ResultSet resultSet = stmt1.executeQuery("SELECT COUNT(*) FROM users where userid = '"+n+"'");
      // Get the number of rows from the result set
      resultSet.next();
	int rowcount = resultSet.getInt(1);
	if(rowcount!=0)
	{
        while(rs.next()) {
      entered_pass = rs.getString("entered_pass");
      d_user = rs.getString("d_user");
      d_pass = rs.getString("d_pass");   
    }
         //if(username1.equals(n) && password1.equals(p)){	    
	     if (entered_pass.equals(d_pass)) {   
        	System.out.println("Success");
                session.setAttribute("session_user",n);
                if(n.equals("rina"))
		{
                RequestDispatcher view = request.getRequestDispatcher("LoginSuccessAdmin.jsp");
                view.forward(request, response);
                }
                else
                {
                RequestDispatcher view = request.getRequestDispatcher("LoginSuccess.jsp");
                view.forward(request, response);
                }
              
	     } //else if - 2nd
	     else{
		System.out.println("Unsuccessful");
                JOptionPane.showMessageDialog(null, "Incorrect Username or Password.");
                RequestDispatcher view = request.getRequestDispatcher("LoginPage.jsp");
                view.forward(request, response);
	     }//close else - 2
	  }//close first if
	  else{
	   System.out.println("Unsuccessful");
           JOptionPane.showMessageDialog(null, "Incorrect Username or Password.","Error!",JOptionPane.WARNING_MESSAGE);
           RequestDispatcher view = request.getRequestDispatcher("LoginPage.jsp");
           view.forward(request, response);
	  }//close first else
          resultSet.close();
          rs.close();
          stmt.close();
          conn.close();
             
	} //close try

    catch(Exception e){
      e.printStackTrace();   
  } //close catch

 } // close dopost
} //close main
