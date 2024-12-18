
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
	<%@ page import = "java.sql.*" %>
	<%@ page import = "com.csm.dao.AnimalManager"%>
	<%@ page import = "com.csm.entity.Animal" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report 1</title>
</head>

<style>
  body {
    font-family: 'Helvetica Neue', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }
#logo {
	display: block;
	padding: 0 30px;
	align-content: center;
	float: left;
	font-size:20px;
	line-height: 60px;
	image-orientation: 20px;
	margin-top: 3px;
	margin-bottom: 3px;
	margin-left: -10px;
	border-radius: 13%;
}
nav { 
	margin:0;
	padding: 0;
	background-color: #005580;
}
nav:after {
	content:"";
	display:table;
	clear:both;
}
nav ul {
	float: right;
	text-align: center;
	padding:0;
	margin:0;
	margin-top: 3px;
	margin-right: 10px;
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
  h1 {
    color: #005580;
    text-align: center;
    padding: 20px 0;
  }

  table {
    border-collapse: collapse;
    width: 80%;
    margin: 30px auto;
    background-color: #fff;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
  }

  th, td {
    padding: 12px;
    text-align: center;
  }

  th {
    background-color: #005580;
    color: #fff;
  }

  tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #e6e6e6;
}

tr.even {
  background-color: #f8f8f8;
}

tr.even:hover {
  background-color: #bfe6ff;
}
  #home{
    display: block;
    width: 120px;
    margin: 20px auto;
    text-align: center;
    border: none;
    border-radius: 5px;
    padding: 12px;
    text-decoration: none;
    color: #fff;
    background-color: #005580;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s ease;
  }

  #home:hover {
    background-color: #ff8080;
  }
</style>
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
<%
	try{
		
		AnimalManager aMgr = new AnimalManager();
		ArrayList<Animal> animalArr = aMgr.fetchDaveOrTemi();
%>
	<center><div>
	<h1>Report 1</h1>	
	<table>
		<tr>
			<th>Animal ID</th>
			<th>Animal Name</th>
			<th>Gender</th>
			<th>Arrived Year</th>
			<th>Keepers ID</th>
			<th>Keepers Name</th>
		</tr>
	<%	
		for (Animal a : animalArr){
	%>
		<tr>
			<td> <%= a.getAnimal_ID() %></td>
			<td> <%= a.getAnimal_Name() %></td>
			<td> <%= a.getAnimal_Gender() %> </td>
			<td> <%= a.getArrive_Year() %> </td>
			<td> <%= a.getKeeper_ID() %> </td>
			<td> <%= a.getKeeper_Name() %> </td>
		</tr>
		<%
			}
		%>
</table>
<a href="../Main.jsp" id="home">Home</a>

</div></center>
<%
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>

</body>
</html>
