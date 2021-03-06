<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Customer</title>
</head>
<body>
	<% 
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM Customer WHERE username = ?");
      	ps.setString(1,request.getParameter("deleteCustomerUsername"));
      	ResultSet rs = ps.executeQuery();
      	
      	if(rs.first()){
      	//query the db with input data
    		ps = conn.prepareStatement("DELETE FROM Customer WHERE username = ?");
    		ps.setString(1, request.getParameter("deleteCustomerUsername"));
    		//execute the sql query
    		int result = ps.executeUpdate();
    		
    		String s = "<form method=\"get\" action=\"./admin.jsp\">Successfully Deleted Customer<button type=\"submit\">Go back</button></form>";
         	out.print(s);
		}else{
			String s = "<form method=\"get\" action=\"./admin.jsp\">This customer does not exist<button type=\"submit\">Try again</button></form>";
	  		out.print(s);
		}
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>