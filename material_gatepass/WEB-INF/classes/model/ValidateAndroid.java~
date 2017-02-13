package model;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class ValidateLogin
 */

public class ValidateAndroid extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
    */
    public ValidateAndroid() {
        super();
        // TODO Auto-generated constructor stub
    }

/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{ 	try{
         doProcess(request,response);
    }
    catch(SQLException e){
    e.printStackTrace();
    }
}
 @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  try{
      doProcess(request,response);
      }
  catch(SQLException e){
      e.printStackTrace();
  }
 }
 private void doProcess(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException , SQLException{
  	String entered_pass = null;
	String d_user = null;
	String d_pass = null;
    Connection conn = null;
    Statement  stmt = null;
    response.setContentType("text/html");
    ObjectOutputStream out = new ObjectOutputStream(response.getOutputStream());
    Enumeration paramNames = request.getParameterNames();
    String params[]= new String[2];
    int i=0;
     while(paramNames.hasMoreElements()) {
       String paramName = (String)paramNames.nextElement();
       System.out.println(paramName );
       String[] paramValues = request.getParameterValues(paramName);
       params[i] = paramValues[0];
       System.out.println(params[i]);
       i++;
     }
     try{
        Class.forName("com.mysql.jdbc.Driver");
        //conn = DriverManager.getConnection("jdbc:mysql://172.16.50.68:3306/test","test","leosisro$");
        System.out.println("Set connection : URL : jdbc:mysql://172.16.50.70:3306/material_gatepass");
        conn = DriverManager.getConnection("jdbc:mysql://172.16.50.70:3306/material_gatepass","root","Walnut01");
        System.out.println("Create statement");
        PreparedStatement st = conn.prepareStatement("SELECT PASSWORD('" + params[1] + "') as entered_pass, userid as d_user, password as d_pass FROM users where userid = '" + params[0] + "'");

    	ResultSet result = st.executeQuery();
	    System.out.println("Do database process.");
		Statement stmt1 = conn.createStatement();
		ResultSet resultSet = stmt1.executeQuery("SELECT COUNT(*) FROM users where userid = '"+params[0]+"'");
		// Get the number of rows from the result set
		resultSet.next();
		int rowcount = resultSet.getInt(1);
		if(rowcount!=0)
		{
     		while(result.next()){
     		    entered_pass = result.getString("entered_pass");
   		        d_user = result.getString("d_user");
   		        d_pass = result.getString("d_pass"); ;
		    }
     		
     		 
     		if (entered_pass.equals(d_pass)) {	    
		    	System.out.println("Success");
				out.writeObject("Success");
			 }
			else{
				System.out.println("Unsuccessful");
				out.writeObject("Wrong username or Password");
		     }
		 }
		 else{
		  System.out.println("Unsuccessful");
		  out.writeObject("Wrong Username!!!");
	     }
		}
        catch(Exception e){
            e.printStackTrace();
		}
        finally{
            if(stmt != null){
                stmt.close();
            }
            if(conn != null){
                conn.close();
            }
        }
   }
}
