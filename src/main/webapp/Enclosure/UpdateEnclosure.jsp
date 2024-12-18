
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.EnclosureManager" %>
    <%@ page import = "com.csm.entity.Enclosure" %>
    
    <%@ include file="ViewEnclosure.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Diet</title>
</head>
<body>

<%
	String eID = request.getParameter("enclosure_id");
	String eType = request.getParameter("enclosure_type");
	String eLocation = request.getParameter("enclosure_location");
	
	
/* 	out.println(dId);
	out.println(dtype);
	out.println(dfeed); */
	
	EnclosureManager dao = new EnclosureManager();
	Enclosure c = new Enclosure(Integer.parseInt(eID),eType, eLocation);
	
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



