<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.swing.*"%>
<%
    String btnval=request.getParameter("b1");
	String id=request.getParameter("t1");
	String pwd=request.getParameter("t2");
    if(btnval.equalsIgnoreCase("login"))
    {
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor","distributor");
    		Statement smt=conn.createStatement();
    		ResultSet rs=smt.executeQuery("select * from login");
    		int f=0;
    		while(rs.next())
    		{
    			
    		       if(rs.getString(1).equals(id))
    		       {
    		    	   if(rs.getString(2).equalsIgnoreCase(pwd))
    		    	   {
    		    		  f=1;
    		    		  break;
    		    	   }
    		       }
    		 }	
    		if(f==1)
    		{
    			 out.println("<script>window.open('menu.html')</script>");
    		}
    		else
    			 out.println("<script>alert('Login Denies....')</script>");
    	}
    	catch(Exception e)
        {
        	out.println(e.toString());
        }
    }//End of Allsearch
  %>  		       
</body>
</html>