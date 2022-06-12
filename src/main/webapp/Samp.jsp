<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mongodb.MongoClient" %>
<%@page import="com.mongodb.client.MongoDatabase" %>
<%@page import="com.mongodb.client.MongoCollection" %>
<%@page import="com.mongodb.client.FindIterable" %>
<%@page import="com.mongodb.client.MongoIterable" %>
<%@page import="com.mongodb.client.MongoCursor" %>
<%@page import="org.bson.Document" %>
<%@page import="com.mongodb.BasicDBObject" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="CSS/styles.css" />
    <link rel="stylesheet" type="text/css" href="CSS/blaber.css"/>
    <link rel="stylesheet" type="text/css" href="CSS/comments.css"/>

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
					<a href="login.jsp">Logout</a>
						
		</div>
	</nav>
  	
  <% 

String defaultImg ="img/notfound.webp";
String movieTitle= request.getParameter("title");
System.out.println(movieTitle);

		MongoClient mongoClient = new MongoClient("localhost", 27017);
		System.out.println("MongoDB Connected ...");
		
		MongoDatabase db = mongoClient.getDatabase("sample_mflix");
		System.out.println("Database Connected ...");
		
		MongoCollection<Document> collection = db.getCollection("movies");
		System.out.println("Collection Connected...");
		
		BasicDBObject query = new BasicDBObject();
		query.put("title",movieTitle);
		
		MongoCursor<Document> cursor = collection.find(query).iterator();
		
		if (!cursor.hasNext()) {
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
    <div class="container" style="height:unset">
      <div class="header-section">
        <div class="header-title"><%=result.getString("title")%></div>
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
          <form class="wrapper" action="SearchResult.jsp">
          <input class="search-input" name="keyword" placeholder="Search other movies" />
          </form>
        </div>
      </div>
      <div class="product-breadcumb"><b>Genre:</b><%
	     	    String genre = "";
	     		ArrayList<String>geners = (ArrayList<String>)result.get("genres");
	     		for(int i=0;i<geners.size();i++){
	     		    genre = geners.get(i);
	        %>
	        
            <%=genre%>,
          <%} %></div>
      <div class="product-container">
        <img
          src="<%=result.getString("poster") %>"
          class="product-img"
          alt=""
        />
        <div class="product-description-container">
          <div class="product-title">
          	     	<b>Plot:</b>
	     	<%String descriptor = result.getString("fullplot");
	     		if(descriptor != null){
	     		%>
	     		<p><%=descriptor %></p>
	     	    <%
	     		}
	     		else{
	     	    %>
	     	    <h4> Full Plot : </h4>
	     	    <p>Not Define</p>
	     	    <%
	     		}
	     		%>
          <b>Director:</b>
          	<%
	     	    String name = "";
	     		ArrayList<String> names = (ArrayList<String>)result.get("directors");
	     		for(int i=0;i<names.size();i++){
	     		    name = names.get(i);
	        %>
	            <p><%=name%>,</p>
	        <%
	     		}
	     	%>
	     	<b>Cast:</b>
	     	<%
	     	    String cast = "";
	     		ArrayList<String> casts = (ArrayList<String>)result.get("cast");
	     		for(int i=0;i<casts.size();i++){
	     		    cast = casts.get(i);
	        %>
	            <p><%=cast%>,</p>
	        <%
	     		}
	     	%>
          </div>
          <div class="product-row">
            <div class="label">Release Year:</div>
            <div class="value"><%=result.getInteger("year") %></div>
          </div>
          <div class="product-row">
            <div class="label">Type:</div>
            <div class="value"><%=result.getString("type") %></div>
          </div>
          <div class="product-row">
            <div class="label">Imdb Rating:</div>
            <div class="value"><%Document res = result.get("imdb", Document.class);%>
                 <%=res.get("rating") %></div>
          </div>
          <div class="product-row">
            <div class="label">runtime:</div>
            <div class="value"><%=result.getInteger("runtime") %> mins</div>
          </div>
          <div class="product-row">
            <div class="label">No. of Mflix comments:</div>
            <div class="value"><%=result.getInteger("num_mflix_comments") %></div>
          </div>
          <div class="product-row">
            <div class="label">Awards Won:</div>
            <div class="value"><%Document rest = result.get("awards", Document.class);%>
                 <%=rest.get("wins")%></div>
          </div>
          <div class="product-row">
            <div class="label">Award nominations:</div>
            <div class="value"><%Document rt = result.get("awards", Document.class);%>
                 <%=rt.get("nominations")%></div>
          </div>
      </div>
    </div>
    <%
    String movieT= request.getParameter("title");
    System.out.println(movieTitle);

    		MongoClient mongoClients = new MongoClient("localhost", 27017);
    		System.out.println("MongoDB Connected ...");
    		
    		MongoDatabase dbs = mongoClient.getDatabase("sample_mflix");
    		System.out.println("Database Connected ...");
    		
    		MongoCollection<Document> collections = db.getCollection("comments");
    		System.out.println("Collection Connected...");
    		
    		BasicDBObject querys = new BasicDBObject();
    		
    		//System.out.println(result.getObjectId("_id"));
    		//System.out.println(result.getInteger("num_mflix_comments"));
    		Document rres = null;
    		ArrayList<String> cts = new ArrayList<>();
    		ArrayList<String> nms = new ArrayList<>();
    		ArrayList<Date> dts = new ArrayList<>();
    		if(result.getInteger("num_mflix_comments") > 0){
    			querys.put("movie_id",result.getObjectId("_id"));
        		MongoCursor<Document> cursors = collections.find(querys).iterator();
        		while(cursors.hasNext()){
        			rres = (Document) cursors.next();
        			cts.add(rres.getString("text"));
        			nms.add(rres.getString("name"));
        			dts.add(rres.getDate("date"));
        		}
    		}
    		
    %>
    	<%
	     	    String cmnt = "";
	     		String nam = "";
	     		Date dat;
	     		for(int i=0;i<cts.size();i++){
	     			cmnt = cts.get(i);
	     			nam = nms.get(i);
	     			dat = dts.get(i);
	        	%>
       <div class="comment">
       	<section class="comments">
			<article class="comment">
      			<a class="comment-img" href="#non">
        			<img src="img/programmer.png	" alt="" width="50" height="50">
      			</a>
      			<div class="comment-body">
        			<div class="text">
        		
          			<p><%=cmnt%></p>
          			</div>
        			<p class="attribution">by <a href="#non"><%=nam%></a> at <%=dat%></p>
      			</div>
          		<%} %>
        			
    		</article>
      	</section>
       		
       </div>
       <div align ="center">
       <a href="reviewPosting.jsp">Post a comment</a>	
       </div>

       
    <%}} %>
  </body>
</html>
