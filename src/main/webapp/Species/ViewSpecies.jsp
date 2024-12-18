<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.csm.dao.SpeciesManager" %>
<%@ page import="com.csm.entity.Species" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Species Lists</title>
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
  #home {
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
 #delete, #edit{
    display: block;
    width: 70px;
    margin: 0 auto;
    margin-top: -10px;
    margin-bottom: -10px;
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
  #delete:hover, #edit:hover {
  	    background-color: red;
  }
</style>
</head>
<script>
  function confirmDelete(sID) {
       return confirm("Are you sure you want to delete Species ID " + sID + "?");
  }
</script>
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
<h1>Species Lists</h1>
<%
  try {
    DBManager dbMgr = new DBManager();
    dbMgr.getConnection();

    SpeciesManager eMgr = new SpeciesManager();
    ArrayList<Species> arrSpecies = eMgr.fetchSpecies();
	String ranking = request.getParameter("Rank");

%>
<table>
<%
	if(ranking != null && ranking.equals("Senior")){
		%>
			 <tr>
			    <th>Species ID</th>
			    <th>Species Type</th>
			  	<th>Species Group</th>
			  	<th>Species Life Style</th>
			  	<th>Species Conservation Status</th>  
			  	<th>Edit Species</th>
			  	<th>Delete Species</th>
			</tr>
		
		<% 
		for (Species species : arrSpecies) {
			  %>
			  	<tr>
				    <td><%= species.getSpecies_ID() %></td>
				    <td><%= species.getSpecies_Type() %></td>
					<td><%= species.getSpecies_Group() %></td>
					<td><%= species.getSpecies_LifeStyle() %></td>
					<td><%= species.getConservation_Status() %></td>    
				    <td><a href="EditSpecies.jsp?SpeciesID=<%= species.getSpecies_ID() %>" id="edit">Edit</a></td>    
				  	<td><a href="../Delete.jsp?InpID=<%= species.getSpecies_ID() %>&tableName=Species&cName=Species_ID" id="delete" onclick="return confirmDelete('<%= species.getSpecies_ID() %>');">Delete</a></td>  
				</tr>
			  <%
		    }
		}else if(ranking != null && ranking.equals("Standard")){
		%>
		<tr>
  				<th>Species ID</th>
			    <th>Species Type</th>
			  	<th>Species Group</th>
			  	<th>Species Life Style</th>
			  	<th>Species Conservation Status</th>  
			  	<th>Edit Species</th>
	  	</tr>
		<% 
	    for (Species species : arrSpecies) {
	  %>
	  	<tr>
		    <td><%= species.getSpecies_ID() %></td>
		    <td><%= species.getSpecies_Type() %></td>
			<td><%= species.getSpecies_Group() %></td>
			<td><%= species.getSpecies_LifeStyle() %></td>
			<td><%= species.getConservation_Status() %></td>    
		    <td><a href="EditSpecies.jsp?SpeciesID=<%= species.getSpecies_ID() %>" id="edit">Edit</a></td>    
		</tr>
	  <%
    }
	}else if(ranking != null && ranking.equals("Junior")){
		%>
		<tr>
				<th>Species ID</th>
			    <th>Species Type</th>
			  	<th>Species Group</th>
			  	<th>Species Life Style</th>
			  	<th>Species Conservation Status</th>  
	  	</tr>
	
	<% 
	for (Species species : arrSpecies) {
		  %>
		  	<tr>
			    <td><%= species.getSpecies_ID() %></td>
			    <td><%= species.getSpecies_Type() %></td>
				<td><%= species.getSpecies_Group() %></td>
				<td><%= species.getSpecies_LifeStyle() %></td>
				<td><%= species.getConservation_Status() %></td>    
			</tr>
		  <%
	    }
	}
  %>
  
</table>
<a href="../Main.jsp" id="home">Home</a>
<%
  
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  } catch (SQLException e) {
    e.printStackTrace();
  }
%>

</body>
</html>