<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.csm.DBManager" %>    
<%@ page import="com.csm.dao.Login" %>    
<%@ page import="com.csm.entity.Keeper" %>    
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>

<%
	
	String KeeperName = request.getParameter("kName");
	Login kLogin = new Login();
	Keeper kp = kLogin.keeperLogin(KeeperName);
	if(kp == null){
		out.print("Keeper Name Not Found");
	}else{
		if(kp.getKeeper_Rank().equals("Senior")){
			out.print("Senior");
		session.setAttribute("loginStatus", 1);
        response.sendRedirect("Main.jsp");
		}
		else if(kp.getKeeper_Rank().equals("Standard")){
			session.setAttribute("loginStatus", 2);
	    	response.sendRedirect("Main.jsp");
		}else if(kp.getKeeper_Rank().equals("Junior")){
			session.setAttribute("loginStatus", 3);
        	response.sendRedirect("Main.jsp");
		}
	}
%>

</body>
</html>