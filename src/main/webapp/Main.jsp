<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.csm.dao.Login"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Main.css">

<title></title>
</head>
<body>
	<%
	int status = 0;

	//Retrieve the loginStatus from the session
	Integer loginStatus = (Integer) session.getAttribute("loginStatus");
	if (loginStatus != null) {
		status = loginStatus;
	}
	if (status == 0) {
	%>
	<nav>
		<div id="logo">
			<img src="Logo.png" alt="GWWP" class="center" id="logo">
		</div>
		<ul id="contact" class="menu">
			<li id="last" class="last"><a href="#"> Contact</a></li>
		</ul>
	</nav>
	<div class="container">
		<h1>Login Form</h1>
		<form action="Login.jsp" target="_top">
			<label for="kName">Keeper Name </label> <input type="text"
				name="kName" placeholder="Enter keeper name">
			<button type="submit">Login</button>
		</form>
	</div>

	<%
	} else if (status == 1) {
	%>

	<nav>
		<div id="logo">
			<img src="Logo.png" alt="GWWP" class="center" id="logo">
		</div>
		<label for="drop" class="toggle">Menu</label> <input type="checkbox"
			id="drop" />
		<ul class="menu">
			<li><a href="#">Home</a></li>
			<li><label for="drop-1" class="toggle">Animal</label> <a
				href="#"> Animal </a> <input type="checkbox" id=drop-1>
				<ul>
					<li><a href="Animal\Animal.jsp">ADD</a></li>
					<li><a href="Animal\ViewAnimal.jsp?Rank=Senior"> VIEW </a></li>
				</ul></li>
			<li><label for="drop-2" class="toggle">Enclosure</label> <a
				href="#"> Enclosure </a> <input type="checkbox" id=drop-2>
				<ul>
					<li><a href="Enclosure\Enclosure.jsp">ADD</a></li>
					<li><a href="Enclosure\ViewEnclosure.jsp?Rank=Senior"> VIEW </a></li>
				</ul></li>
			<li><label for="drop-3" class="toggle">Keeper</label> <a
				href="#"> Keeper </a> <input type="checkbox" id=drop-3>
				<ul>
					<li><a href="Keeper\Keeper.jsp">ADD</a></li>
					<li><a href="Keeper\ViewKeeper.jsp?Rank=Senior"> VIEW </a></li>
				</ul></li>
			<li><label for="drop-4" class="toggle">Species</label> <a
				href="#">Species</a> <input type="checkbox" id=drop-4>
				<ul>
					<li><a href="Species\Species.jsp">ADD</a></li>
					<li><a href="Species\ViewSpecies.jsp?Rank=Senior"> VIEW </a></li>
				</ul></li>
			<li><label for="drop-5" class="toggle">Diet</label> <a href="#">Diet</a>
				<input type="checkbox" id=drop-5>
				<ul>
					<li><a href="Diet\Diet.jsp"> ADD</a></li>
					<li><a href="Diet\ViewDiet.jsp?Rank=Senior"> VIEW </a></li>
					<li></li>
				</ul></li>
			<li><label for="drop-6" class="toggle">Keeper Record</label> <a
				href="#">Keeper Record</a> <input type="checkbox" id=drop-6>
				<ul>
					<li><a href="Report\Report1.jsp"> Report1</a></li>
					<li><a href="Report\Report2.jsp"> Report2 </a></li>
				</ul></li>
		</ul>
		<ul id="contact" class="menu">
			<li id="last" class="last"><a href="#"> Contact</a></li>
		</ul>
		<ul id="logout" class="menu">
			<li id="logout" class="last">
				<form action="LogOut.jsp">
					<button type="submit">Logout</button>
				</form>
			</li>
		</ul>
	</nav>
	<div id="txt">

		<h1>Welcome To Go Wild WildLife Park</h1>
		<h2>Discover the animals world !!!!!!</h2>
		<p>
			<b>Over 2000 animals with new challenges and excitement.Just
				enjoy the moment.</b>
		</p>
	</div>

	<%
	} else if (status == 2) {
	%>

	<nav>
		<div id="logo">
			<img src="Logo.png" alt="GWWP" class="center" id="logo">
		</div>
		<label for="drop" class="toggle">Menu</label> <input type="checkbox"
			id="drop" />
		<ul class="menu">
			<li><a href="#">Home</a></li>
			<li><label for="drop-1" class="toggle">Animal</label> <a
				href="#"> Animal </a> <input type="checkbox" id=drop-1>
				<ul>
					<li><a href="Animal\ViewAnimal.jsp?Rank=Standard"> VIEW </a></li>
				</ul></li>
			<li><label for="drop-2" class="toggle">Enclosure</label> <a
				href="#"> Enclosure </a> <input type="checkbox" id=drop-2>
				<ul>
					<li><a href="Enclosure\ViewEnclosure.jsp?Rank=Standard"> VIEW </a></li>
				</ul></li>
			<li><label for="drop-3" class="toggle">Keeper</label> <a
				href="#"> Keeper </a> <input type="checkbox" id=drop-3>
				<ul>
					<li><a href="Keeper\ViewKeeper.jsp?Rank=Standard"> VIEW </a></li>
				</ul></li>
			<li><label for="drop-4" class="toggle">Species</label> <a
				href="#">Species</a> <input type="checkbox" id=drop-4>
				<ul>
					<li><a href="Species\ViewSpecies.jsp?Rank=Standard"> VIEW </a></li>
				</ul></li>
			<li><label for="drop-5" class="toggle">Diet</label> <a href="#">Diet</a>
				<input type="checkbox" id=drop-5>
				<ul>
					<li><a href="Diet\ViewDiet.jsp?Rank=Standard"> VIEW </a></li>
					<li></li>
				</ul></li>
			<li><label for="drop-6" class="toggle">Keeper Record</label> <a
				href="#">Keeper Record</a> <input type="checkbox" id=drop-6>
				<ul>
					<li><a href="Report\Report1.jsp"> Report1</a></li>
					<li><a href="Report\Report2.jsp"> Report2 </a></li>
				</ul></li>
		</ul>
		<ul id="contact" class="menu">
			<li id="last" class="last"><a href="#"> Contact</a></li>
		</ul>
		<ul id="logout" class="menu">
			<li id="logout" class="last">
				<form action="LogOut.jsp">
					<button type="submit">Logout</button>
				</form>
			</li>
		</ul>
	</nav>
	<div id="txt">

		<h1>Welcome To Go Wild WildLife Park</h1>
		<h2>Discover the animals world !!!!!!</h2>
		<p>
			<b>Over 2000 animals with new challenges and excitement.Just
				enjoy the moment.</b>
		</p>
	</div>

	<%
	} else if (status == 3) {
	%>
	<nav>
		<div id="logo">
			<img src="Logo.png" alt="GWWP" class="center" id="logo">
		</div>
		<label for="drop" class="toggle">Menu</label> <input type="checkbox"
			id="drop" />
		<ul class="menu">
			<li><a href="#">Home</a></li>
			
			<li><label for="drop-1" class="toggle">Animal</label> <a
				href="#"> Animal </a> <input type="checkbox" id=drop-1>
				<ul>
					<li><a href="Animal\ViewAnimal.jsp?Rank=Junior"> VIEW </a></li>
				</ul></li>
				
			<li><label for="drop-2" class="toggle">Enclosure</label> <a
				href="#"> Enclosure </a> <input type="checkbox" id=drop-2>
				<ul>
					<li><a href="Enclosure\ViewEnclosure.jsp?Rank=Junior">
							VIEW </a></li>
				</ul></li>
				
			<li><label for="drop-4" class="toggle">Species</label> <a
				href="#">Species</a> <input type="checkbox" id=drop-4>
				<ul>
					<li><a href="Species\ViewSpecies.jsp?Rank=Junior"> VIEW </a></li>
				</ul></li>
				
			<li><label for="drop-5" class="toggle">Diet</label> <a href="#">Diet</a>
				<input type="checkbox" id=drop-5>
				<ul>
					<li><a href="Diet\ViewDiet.jsp?Rank=Junior"> VIEW </a></li>
					<li></li>
				</ul></li>

		</ul>
		<ul id="contact" class="menu">
			<li id="last" class="last"><a href="#"> Contact</a></li>
		</ul>
		<ul id="logout" class="menu">
			<li id="logout" class="last">
				<form action="LogOut.jsp">
					<button type="submit">Logout</button>
				</form>
			</li>
		</ul>
	</nav>
	<div id="txt">

		<h1>Welcome To Go Wild WildLife Park</h1>
		<h2>Discover the animals world !!!!!!</h2>
		<p>
			<b>Over 2000 animals with new challenges and excitement.Just
				enjoy the moment.</b>
		</p>
	</div>
	<%
	}
	%>


</body>
</html>