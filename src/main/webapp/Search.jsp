<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="CSS/Searchp.css" rel="stylesheet">
<title>Search Page</title>
<script>
  function isEmpty(){
	  let search = document.getElementById("search").value;
	  if (search != ""){
		  document.getElementById("btnSubmit").removeAttribute("disabled"); 
	  }
  }
</script>
</head>
<body>


	<div  class="container">
	<h1>Popular movies</h1>
		<form class="wrapper" action="rush.jsp">
		<section class="searchbar">
			<div class="searchArea">		    
				<input type="search" id="search" name="keyword" placeholder="Enter Movie name to search" class="search" onkeyup="isEmpty()">		    	
				<button class="searchBtn"  id="btnSubmit" type="submit" disabled>Search</button>
				<div id="curtain"></div>
			</div>
			<div class="content">
			</div>
		</section>
	</form>
	<div class="flex-container">
    	<div class="items">
    
		    <a href = "Samp.jsp?title=Harry Potter and the Chamber of Secrets">
		    	<img class="image" src="https://wallpapercave.com/wp/wp5692227.jpg" alt="Harry Potter and the Chamber of Secrets" />
		    </a>
		    <a href = "Samp.jsp?title=Avatar">
		    <img class="image" src="https://images2.alphacoders.com/767/thumb-1920-76752.jpg" alt="Avatar" />
		    </a>
		    <a href = "Samp.jsp?title=Spider-Man">
		    <img class="image" src="https://c4.wallpaperflare.com/wallpaper/219/459/678/goblin-green-maguire-tobey-wallpaper-preview.jpg" alt="Spider-Man" />
		    </a>
		    <a href = "Samp.jsp?title=Avengers: Age of Ultron">
		    <img class="image" src="https://wallpapercave.com/wp/wp1818455.jpg" alt="Avengers: Age of Ultron" />
		    </a>
		    <a href = "Samp.jsp?title=The Dark Knight">
		    <img class="image" src=https://wallpapercave.com/dwp1x/51BnItI.jpg alt="The Dark Knight" />
		    </a>
		    <a href = "Samp.jsp?title=The Godfather">
		    <img class="image" src="https://c4.wallpaperflare.com/wallpaper/874/376/908/the-godfather-movies-vito-corleone-wallpaper-preview.jpg" alt="The Godfather" />
		    </a>
		    <a href = "Samp.jsp?title=Se7en">
		    <img class="image" src="https://wallpaperaccess.com/full/2011279.jpg" alt="Se7en" />
		    </a>

		  </div>  		  
</div>
 
</div>
</body>
</html>