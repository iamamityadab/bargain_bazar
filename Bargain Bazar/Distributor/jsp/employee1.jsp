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
		ResultSet rs=smt.executeQuery("select * from employee");
		%>
		<table border=2>
		<tr>
			<th>ID</th>
			<th>Fnm</th>
			<th>Lnm</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Job ID</th>
			<th>Location ID</th>
		</tr>
		<%
		while(rs.next())
		{
		%>
			<tr>
				<th><%=rs.getString(1)%></th>
				<th><%=rs.getString(2)%></th>
				<th><%=rs.getString(3)%></th>
				<th><%=rs.getString(4)%></th>
				<th><%=rs.getString(5)%></th>
				<th><%=rs.getString(6)%></th>
				<th><%=rs.getString(7)%></th>
			</tr>
	    <%}%>
	    </table>
    <%}
	catch(Exception e)
	{
		out.println(e.toString());
	}//end of Allsearch
	
}
	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor", "distributor");
			PreparedStatement psmt=conn.prepareStatement("insert into employee values(?,?,?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
			psmt.setString(6,t6);
			psmt.setString(7,t7);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	if(btnval.equalsIgnoreCase("Search"))
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor", "distributor");
			Statement smt=conn.createStatement();
			String t1=request.getParameter("t1");
			ResultSet rs=smt.executeQuery("select * from employee where id='"+t1+"'");
			%>
			<table border=2>
			<tr>
				<th>ID</th>
				<th>Fnm</th>
				<th>Lnm</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Job ID</th>
				<th>Location ID</th>
			</tr>
			<%
			while(rs.next())
			{
			%>
				<tr>
					<th><%=rs.getString(1)%></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3)%></th>
					<th><%=rs.getString(4)%></th>
					<th><%=rs.getString(5)%></th>
					<th><%=rs.getString(6)%></th>
					<th><%=rs.getString(7)%></th>
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
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "distributor", "distributor");
			PreparedStatement psmt=conn.prepareStatement("update employee set fnm=?,lnm=?,email=?,phone=?,job_id=?,location_id=? where id=?");
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.setString(5,t6);
			psmt.setString(6,t7);
			psmt.setString(7,t1);
			psmt.executeQuery();
			out.println("<script>alert('Record Updated......')</script>");
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
			PreparedStatement psmt=conn.prepareStatement("delete from employee");
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