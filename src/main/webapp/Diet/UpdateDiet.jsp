
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.DietManager" %>
    <%@ page import = "com.csm.entity.Diet" %>
    
    <%@ include file="ViewDiet.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Diet</title>
</head>
 
<body>

<%
	String dId = request.getParameter("diet_id");
	String dtype = request.getParameter("diet_type");
	String dfeed = request.getParameter("diet_feed");
	
	
 	/* out.println(dId);
	out.println(dtype);
	out.println(dfeed);  */
	
	DietManager dao = new DietManager();
	Diet c = new Diet(Integer.parseInt(dId),dtype, Integer.parseInt(dfeed));
	
	int rowAffected;
	try {
		rowAffected = dao.update(c);
		if(rowAffected == 1){
			%>
			 <script>
			        function goBackAndReload() {
			            window.history.go(-2);
			            window.location.reload();
			        }
			        goBackAndReload();   		
			 </script>
			<%
		}	
	}catch (ClassNotFoundException ex){
		out.println(ex.getMessage());
	}catch (SQLException e){
		out.println(e.getMessage());
	}
%>

</body>
</html>



