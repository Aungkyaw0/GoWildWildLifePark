<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.csm.DBManager" %>
<%@ page import = "com.csm.dao.DietManager" %>
<%@ page import = "com.csm.entity.Diet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Diet</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: url('../Back2.jpg') no-repeat center fixed;     
  background-size: cover;
	word-wrap:break-word !important;
	font-family: 'Open Sans', sans-serif;
	}
#logo {
	display: block;
	padding: 0 30px;
	align-content: center;
	float: left;
	font-size:20px;
	line-height: 60px;
	image-orientation: 20px;
	margin-top: 1px;
	margin-bottom: 1px;
	margin-left: -10px;
	border-radius: 13%;
}
nav { 
	margin:0;
	padding: 0;
	background-color: #424242;
}
nav:after {
	content:"";
	display:table;
	clear:both;
}
nav ul {
	float: right;
	padding:0;
	margin:0;
	list-style: none;
	position: relative;
	}
nav a {
	display:block;
	padding:14px 20px;	
	color:#FFF;
	font-size:17px;
	text-decoration:none;
}
nav ul li:hover { background: #000000; }
img{
	align-content: center;
	border-radius: 8px;
	width: 250px;
}
.center{
	display: flex;
	justify-content: center;
	margin-left: -10px;
}
/*FORM*/
.container {
	margin: 50px auto;
	margin-top: 100px;
	max-width: 400px;
	background-color: skyblue;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0,0,0,0.2);
	color: floralwhite;
}
h1 {
	text-align: center;
}
form {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: left;
}
input {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
}
button:hover {
	background-color: #45a049;
}
</style>
<script>
function confirmUpdate() {
    var result = confirm("Are you sure you want to update the record?");
    if (result) {
        // User clicked OK, submit the form
        document.getElementById("updateForm").submit();
    } else {
        // User clicked Cancel, go back to ViewDiet.jsp
        window.location.href = "ViewDiet.jsp";
    }
}
</script>
</head>
<body>
<nav>
		<div id="logo">
		<img src="..\Logo.png" alt="GWWP" class="center" id="logo">
		</div>
		<ul class="menu">
			<li><a href="..\Main.jsp">Home</a></li>
		</ul>
		<ul id="contact" class="menu">
			<li id="last" class="last"><a href="#"> Contact</a></li>
		</ul>
	</nav>
<div class="container">
    <h2 class="center">Edit form for Diet</h2>

    <%
        String sId = request.getParameter("DietID");
        if (sId == null) {
            out.println("Diet ID is not found");
        } else {
            int id = Integer.parseInt(sId);
            DietManager dao = new DietManager();
            try {
                Diet c = dao.getById(id);
    %>

    <form id="updateForm" method="POST" action="UpdateDiet.jsp">
        <input type="hidden" name="diet_id" value="<%= c.getDiet_ID() %>">
        <label for="diet_type">Diet Type</label>
        <input type="text" name="diet_type" id="diet_type" value="<%= c.getDiet_Type() %>" required>
        <label for="diet_feed">Number of feed per day</label>
        <input type="number" name="diet_feed" id="diet_feed" value="<%= c.getQuantity_Of_Feed_Per_Day() %>" required>
        <input type="button" value="Update" onclick="confirmUpdate()">
    </form>

    <%
        } catch (ClassNotFoundException ex) {
            out.println(ex.getMessage());
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }
    %>

</div>

</body>
</html>