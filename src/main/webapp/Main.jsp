<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="Main.css">
	<title></title>
</head>
<body>
	<nav>
		<div id="logo">
		<img src="Logo.png" alt="GWWP" class="center" id="logo">
		</div>
		<label for="drop" class="toggle">Menu</label>
		   <input type="checkbox" id="drop" />
		<ul class="menu">		
			<li><a href="#">Home</a></li>
			<li>
				<label for="drop-1" class="toggle">Animal</label>
				<a href="#"> Animal </a>
				<input type="checkbox" id=drop-1>
				<ul>
					<li><a href="Animal\Animal.jsp">ADD</a></li>
					<li><a href="Animal\ViewAnimal.jsp"> VIEW </a></li>
				</ul>
			</li>
			<li>
				<label for="drop-2" class="toggle">Enclosure</label>
				<a href="#"> Enclosure </a>
				<input type="checkbox" id=drop-2>
				<ul>
					<li><a href="Enclosure\Enclosure.jsp">ADD</a></li>
					<li><a href="Enclosure\ViewEnclosure.jsp"> VIEW </a></li>
				</ul>
			</li>
			<li>
				<label for="drop-3" class="toggle">Keeper</label>
				<a href="#"> Keeper </a>
				<input type="checkbox" id=drop-3>
				<ul>
					<li><a href="Keeper\Keeper.jsp">ADD</a></li>
					<li><a href="Keeper\ViewKeeper.jsp"> VIEW </a></li>
				</ul>
			</li>
			<li>
				<label for="drop-4" class="toggle">Species</label>
				<a href="#">Species</a>
				<input type="checkbox" id=drop-4>
				<ul>
					<li><a href="Species\Species.jsp">ADD</a></li>
					<li><a href="Species\ViewSpecies.jsp"> VIEW </a></li>
				</ul>
			</li>
			<li>
				<label for="drop-5" class="toggle">Diet</label>
				<a href="#">Diet</a>
				<input type="checkbox" id=drop-5>
				<ul>
					<li><a href="Diet\Diet.jsp"> ADD</a></li>
					<li><a href="Diet\ViewDiet.jsp"> VIEW </a></li>
					<li></li>
				</ul>
			</li>
		
	</nav>
<div id="txt">
	
  <h1>Welcome To Go Wild WildLife Park</h1>
  <h2>Discover the animals world !!!!!!</h2>
  <p><b>Over 2000 animals with new challenges and excitement.Just enjoy the moment.</b></p>
</div>
</body>
</html>