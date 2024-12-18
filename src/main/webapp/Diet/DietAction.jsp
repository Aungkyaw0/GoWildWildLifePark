<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.dao.DietManager"%>
    <%@ page import = "com.csm.entity.Diet" %>
    <%@ page import = "com.csm.DBManager" %>
           
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>	
	</head>
	<style>
	body {
	margin: 0;
	padding: 0;
	background: url('../Back.jpg') no-repeat center fixed;     
 	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	}
    .message {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 20px;
        background-color: #ff9f45;
        color: white;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        text-align: center;
    }
    button{
			background-color: #4CAF50;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			width: 100%;
		}
</style>
	<body>
		<%
		try
		{
			String dt = request.getParameter("type");
			int df = Integer.parseInt(request.getParameter("feed")); 
			DBManager dbM = new DBManager();
			dbM.getConnection();
			Diet d = new Diet(dt, df);
			DietManager dietM = new DietManager();
			int Affect = -1;
			Affect = dietM.insertDiet(d);
			if(Affect == 1){
				%>
				<script>
				    function showMessage() {
				        var messageDiv = document.createElement("div");
				        messageDiv.className = "message";
				        messageDiv.innerHTML = "<h1>Data is successfully Inserted to Database</h1><button onclick=\"redirectToMainPage()\">HOME</button>";
				        document.body.appendChild(messageDiv);
				    }
				    
				    function redirectToMainPage() {
				        window.location.href = "../Main.jsp"; // Replace with your URL
				    }
				    showMessage();
				</script>
				<%
			}		
		}catch (ClassNotFoundException e){
			e.printStackTrace();
			out.print("Not SQL");
		}catch (SQLException e){
			e.printStackTrace();
			out.print("Definitely SQL");
		}
		%>
	</body>
</html>


