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
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/fontawesome.css"
      integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7"
      crossorigin="anonymous"
    />
<link href="CSS/new.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<title>Insert title here</title>
</head>

	
<body>
    <div class="wrapper">
  <h1 align= "center">Search results</h1>
  
    <div class="container">
      <div class="header-section">
        <div class="header-title">Mflix</div>
        <div class="search-section">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="search-icon-svg"
            viewBox="0 0 512 512"
          >
            <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
            <path
              d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"
            />
          </svg>
          <form class="wrapper" action="rush.jsp">
          <input class="search-input" name="keyword" placeholder="Search other movies" />
          </form>
        </div>
      </div>
      <div class="product-breadcumb">Explore Movies</div>
      <div class="popular-products-container">
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
      <div class="popular-card">
      <a href="Samp.jsp?title=<%=result.getString("title")%>">
          <img
            src="<%=result.getString("poster") %>"
            alt=""
            class="popular-product-img"
          /></a>
          <div class="popular-product-description">
            <div class="product-title"><%=result.getString("title") %></div>
            <div class="product-description"><%=result.getString("type") %></div>
          </div>
        </div>
      
        




 <%}} %>
   </div>
        </div>
        </div>
</body>
</html>