<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.dao.AnimalManager"%>
    <%@ page import = "com.csm.entity.Animal" %>
    <%@ page import = "com.csm.DBManager" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Animal Action</title>	
	</head>
	<style>
	body {
	margin: 0;
	padding: 0;
	background: url('../Back.jpg') no-repeat center fixed;     
 	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	}
	
    .successed_message {
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
    .failed_message{
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
	<script>
		function showSuccessMessage() {
			var messageDiv = document.createElement("div");
			messageDiv.className = "successed_message";
			messageDiv.innerHTML = "<h1>Data is successfully Inserted to Database</h1><button onclick=\"redirectToMainPage()\">HOME</button>";
			document.body.appendChild(messageDiv);
		}
		function showFailMessage(invalidField) {
		    var messageDiv = document.createElement("div");
			messageDiv.className = "failed_message";
			messageDiv.innerHTML = "<h1>Data insertion failed due to invalid " + invalidField + "</h1><button onclick=\"redirectToMainPage()\">Try Again</button>";
			document.body.appendChild(messageDiv);
			}
	    function redirectToMainPage() {
	        window.location.href = "../Main.jsp"; 
		}
	</script>
		<%
		try
		{
			String aName = request.getParameter("name");
			String aGender = request.getParameter("gender");
			int aYear = Integer.parseInt(request.getParameter("year"));
			int kID = Integer.parseInt(request.getParameter("kID"));
			int eID = Integer.parseInt(request.getParameter("eID"));
			int dID = Integer.parseInt(request.getParameter("dID"));
			int sID = Integer.parseInt(request.getParameter("sID"));
			DBManager dbM = new DBManager();
			dbM.getConnection();
			Animal a = new Animal(aName, aGender, aYear, kID, eID, dID, sID);
			AnimalManager anM = new AnimalManager();
			int Affect = -1;
			int isValid = -1;
			Affect = anM.insertAnimal(a);
			if(Affect == 1){
				%>
				<script>
				showSuccessMessage();
				</script>
				<%
			}else if(Affect == -1){
				%>
				<script>
					showFailMessage("<%= anM.errorText %>");
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


