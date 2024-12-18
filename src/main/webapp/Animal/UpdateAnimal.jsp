
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.AnimalManager" %>
    <%@ page import = "com.csm.entity.Animal" %>
    
    <%@ include file="ViewAnimal.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Diet</title>
</head>
<body>

<%
	String aID = request.getParameter("animal_id");
	String aName = request.getParameter("animal_name");
	String aGender = request.getParameter("animal_gender");	
	String aAY = request.getParameter("arrive_year");
	String kID = request.getParameter("keeper_id");
	String eID = request.getParameter("enclosure_id");
	String dID = request.getParameter("diet_id");
	String sID = request.getParameter("species_id");


	
	
/* 	out.println(dId);
	out.println(dtype);
	out.println(dfeed); */
	
	AnimalManager dao = new AnimalManager();
	Animal sp = new Animal(Integer.parseInt(aID), aName, aGender,Integer.parseInt(aAY), Integer.parseInt(kID), Integer.parseInt(eID), Integer.parseInt(dID),Integer.parseInt(sID));
	
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



