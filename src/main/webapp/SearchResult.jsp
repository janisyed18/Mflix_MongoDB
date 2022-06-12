<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@page import="com.mongodb.MongoClient" %>
<%@page import="com.mongodb.client.MongoDatabase" %>
<%@page import="com.mongodb.client.MongoCollection" %>
<%@page import="com.mongodb.client.FindIterable" %>
<%@page import="com.mongodb.client.MongoIterable" %>
<%@page import="com.mongodb.client.MongoCursor" %>
<%@page import="org.bson.Document" %>
<%@page import="com.mongodb.BasicDBObject" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="ISO-8859-1">
<link href="CSS/table.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/relea		ses/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/nav-bar.css" rel="stylesheet" />
<style>
<title>Sample_Mflix</title>
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
		<a href="search.jsp">Search</a>
			<a href="search.jsp">Search</a>
				<a href="search.jsp">Search</a>
					<a href="search.jsp">Search</a>
						<a href="search.jsp">Search</a>
		</div>
	</nav>

<br><br>

	<table class="content-table">
	<tr>
		<th style="background-color:#adb7f7">Title</th>
		<th style="background-color:#adb7f7">Type</th>
		<th style="background-color:#adb7f7">Plot</th>
		<th style="background-color:#adb7f7">Released Year</th>
	</tr>

<%
	MongoClient mongoClient = new MongoClient("localhost", 27017);
	System.out.println("MongoDB Connected ...");
	
	MongoDatabase db = mongoClient.getDatabase("sample_mflix");
	System.out.println("Database Connected ...");
	
	MongoCollection<Document> collection = db.getCollection("movies");
	System.out.println("Collection Connected...");
	
	Document regexQuery = new Document();
	regexQuery.append("$regex", ".*(?i)" + request.getParameter("keyword") + ".*" );
	String keyword = request.getParameter("keyword");
	
	BasicDBObject query =new BasicDBObject("title", regexQuery);
	
	FindIterable<Document> iter = collection.find(query).sort(new BasicDBObject("title", 1));	
	
	MongoCursor<Document> cursor = iter.iterator();
	
	if (!cursor.hasNext()) {
	    BasicDBObject querys = new BasicDBObject("Director",regexQuery);
	    FindIterable<Document> itere = collection.find(query).sort(new BasicDBObject("title", 1));
	    System.out.println("Movie with that Title not found ...");
%>
	    <c:redirect url="/error.jsp"/>
<%
	}
	else{
	Document result = null;
	while(cursor.hasNext()){
		result = (Document) cursor.next();

	
%>
		<tr>
			<td>
				<a href="Samp.jsp?title=<%=result.getString("title")%>">
					<%=result.getString("title") %>
				</a>
			</td>
			<td>
				<%=result.getString("type") %>
			</td>
			<td>
				<%=result.getString("fullplot") %>
			</td>
			<td>
				<%=result.getInteger("year")%>
			</td>
			</tr>
<%
	}
	}
%>

</table>
</body>
</html>