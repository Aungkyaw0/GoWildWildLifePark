
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.SpeciesManager" %>
    <%@ page import = "com.csm.entity.Species" %>
    
    <%@ include file="ViewSpecies.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Diet</title>
</head>
<body>

<%
	String sID = request.getParameter("species_id");
	String sType = request.getParameter("species_type");
	String sGroup = request.getParameter("species_group");	
	String sLs = request.getParameter("species_ls");
	String sCs = request.getParameter("species_con");


	
	
/* 	out.println(dId);
	out.println(dtype);
	out.println(dfeed); */
	
	SpeciesManager dao = new SpeciesManager();
	Species sp = new Species(Integer.parseInt(sID),sType, sGroup, sLs, sCs);
	
	int rowAffected;
	try {
		rowAffected = dao.update(sp);
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



