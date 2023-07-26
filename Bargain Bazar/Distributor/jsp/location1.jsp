<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*"%> 
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("All Search"))
	{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor", "distributor");
		Statement smt=conn.createStatement();
		ResultSet rs=smt.executeQuery("select * from location");
		%>
		<table border=2>
		<tr>
			<th>ID</th>
			<th>City</th>
			<th>Street</th>
		</tr>
		<%
		while(rs.next())
		{
		%>
			<tr>
				<th><%=rs.getString(1)%></th>
				<th><%=rs.getString(2)%></th>
				<th><%=rs.getString(3)%></th>
			</tr>
	    <%}%>
	    </table>
    <%}
	catch(Exception e)
	{
		out.println(e.toString());
	}//end of Allsearch
	
}
	if(btnval.equalsIgnoreCase("Search"))
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor", "distributor");
			Statement smt=conn.createStatement();
			String t1=request.getParameter("t1");
			ResultSet rs=smt.executeQuery("select * from location where id='"+t1+"'");
			%>
			<table border=2>
			<tr>
				<th>ID</th>
				<th>City</th>
				<th>Street</th>
			</tr>
			<%
			while(rs.next())
			{
			%>
				<tr>
					<th><%=rs.getString(1)%></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3)%></th>
				</tr>
		    <%}%>
		    <input type=button value="Print" onclick="window.print()">
		    </table>
	    <%}
		catch(Exception e)
		{
			out.println(e.toString());
		}//end of search
		
	}

	if(btnval.equalsIgnoreCase("update"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor", "distributor");
			PreparedStatement psmt=conn.prepareStatement("update location set city=?,street=? where id=?");
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t1);
			psmt.executeQuery();
			out.println("<script>alert('Record Updated......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor", "distributor");
			PreparedStatement psmt=conn.prepareStatement("insert into location values(?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	if(btnval.equalsIgnoreCase("delete"))
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor", "distributor");
			PreparedStatement psmt=conn.prepareStatement("delete from location");
			psmt.executeQuery();
			out.println("<script>alert('Record Deleted......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
%>

</body>
</html>