<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import= "java.util.ArrayList" %>
<%@page import= "com.mongodb.MongoClient"  %>
<%@page import= "com.mongodb.BasicDBObject" %>
<%@page import= "com.mongodb.client.MongoCursor" %>
<%@page import= "com.mongodb.client.MongoCollection" %>
<%@page import= "com.mongodb.client.MongoDatabase"%> 
<%@page import= "org.bson.Document" %>

<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="CSS/review.css" rel="stylesheet">
<script src="https://www.w3schools.com/lib/w3.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">

<!-- style for search  btn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

 
<head>
<meta charset="ISO-8859-1">

<title>MFlix</title>
<style>

.navbar {
width: 100%;
padding: 1rem 3rem;
background-color: #6c63ff !important;
display: flex;
align-items: center;
justify-content: space-between;
}

.navbar-links a {
all: unset;
cursor: pointer;
    color: white;
    padding-right: 8px;
}

.navbar-title {
color: #fff;
font-size: 18px;
font-weight: bold;
}
</style>
</head>
<body>
 
 <nav
		class="navbar"
		id="mainNav">
		
		<div class="navbar-title">Movies</div>
		<div class="navbar-links">
		<a href="index.jsp">Home</a>
			<a href="Search.jsp">Search</a>
				<a href="login.jsp">logout</a>
					
		</div>
	</nav>

<%
String defaultImg="Images/movie1.jpg";
String movietitle=request.getParameter("title");
System.out.println(movietitle);
%>

<div class="w3-display-container w3-grayscale-min"> 		



<br><br>

<h1>Review and rate the movies</h1>





<div id="form">

<div class="fish" id="fish"></div>
<div class="fish" id="fish2"></div>

<form  id="feedback" method="post" action="reviewPosting.jsp" onsubmit="reviewPosting.jsp">

<div class="formgroup" id="name-form">
    <label for="name">Your name</label>
    <input type="text" id="name" name="name" placeholder="enter your name" class="form-control"/>
</div>

<div class="formgroup" id="email-form">
    <label for="email">Your e-mail</label>
    <input type="email" id="email" name="email" placeholder="enter email" class="form-control" required/>
</div>

<div class="formgroup" id="email-form">
    <label for="email">Movie Name</label>
    <input type="text" name="moviename" placeholder="movie name" class="form-control" required/>
</div>

<div class="formgroup" id="message-form">
    <label for="message">Your Review</label>
    <textarea id="review" name="comment" class="form-control" placeholder="Write your review" required></textarea>
</div>


<%
	
	MongoClient mongoClient = new MongoClient("localhost", 27017);
	System.out.println("MongoDB Connected...");
	
	MongoDatabase db = mongoClient.getDatabase("sample_mflix");
	System.out.println("Connected Database...");
	
	MongoCollection<Document> collection = db.getCollection("comments");
	System.out.println("Collection Connected...");

	  
	   
	   String username =request.getParameter("name");
	   String email =request.getParameter("email");
	   String movieid =request.getParameter("moviename");
	   String comment =request.getParameter("comment");

	  
	   
	   Document document = new Document();
	      document.append("name", username);
	      document.append("email", email);
	      document.append("movie_id", movieid);
	      document.append("text", comment);
	      //Inserting the document into the collection
	      db.getCollection("comments").insertOne(document);
	      System.out.println("Document inserted successfully");


%>


	<input type="submit" value="Post Review!" />
</form>
</div>

</div>

</body>
<script type="text/javascript">
$('document').ready(function(){
	$('input[type="text"], input[type="email"], textarea').focus(function(){
		var background = $(this).attr('id');
		$('#' + background + '-form').addClass('formgroup-active');
		$('#' + background + '-form').removeClass('formgroup-error');
	});
	$('input[type="text"], input[type="email"], textarea').blur(function(){
		var background = $(this).attr('id');
		$('#' + background + '-form').removeClass('formgroup-active');
	});

function errorfield(field){
	$(field).addClass('formgroup-error');
	console.log(field);	
}

$("#waterform").submit(function() {
	var stopsubmit = false;

if($('#name').val() == "") {
	errorfield('#name-form');
	stopsubmit=true;
}
if($('#email').val() == "") {
	errorfield('#email-form');
	stopsubmit=true;
}
  if(stopsubmit) return false;
});
		
});
</script>
</html>