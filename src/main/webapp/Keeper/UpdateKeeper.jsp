
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.KeeperManager" %>
    <%@ page import = "com.csm.entity.Keeper" %>
    
    <%@ include file="ViewKeeper.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Diet</title>
</head>
<body>

<%
	String kID = request.getParameter("keeper_id");
	String kName = request.getParameter("keeper_name");
	String kDOB = request.getParameter("keeper_dob");
	String kRank = request.getParameter("keeper_rank");
	
/* 	out.println(dId);
	out.println(dtype);
	out.println(dfeed); */
	
	KeeperManager dao = new KeeperManager();
	Keeper kpp = new Keeper(Integer.parseInt(kID), kName, kDOB, kRank);
	
	int rowAffected;
	try {
		rowAffected = dao.update(kpp);
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



