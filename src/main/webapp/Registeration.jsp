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
		<script src="https://kit.fontawesome.com/898d981ac4.js" crossorigin="anonymous"></script>
<head>

<style>
body {
  background-image: linear-gradient(hsla(290,60%,70%,0.3), pink, hsla(290,60%,70%,0.3));	
  background-repeat: no-repeat;
  background-attachment: fixed;
  height: 100%;
  margin: 0;
  display: flex;
  align-items: center;
  color: white;
  font-family: "Montserrat", sans-serif;
  font-size: 14px;
  justify-content: center;
}

a {
  color: white;
  text-decoration: none;
  font-weight: bold;
  outline: none;
  transition: all 0.2s;
}

a:hover,
a:focus {
  color: #fdc654;
  transition: all 0.2s;
}

html {
  height: 100%;
}

.login-card {
  padding: 32px 32px 0;
  box-sizing: border-box;
  text-align: center;
  width: 100%;
  display: flex;
  height: 100%;
  max-height: 740px;
  max-width: 350px;
  flex-direction: column;
}

.login-card-content {
  flex-grow: 2;
  justify-content: center;
  display: flex;
  flex-direction: column;
}

.login-card-footer {
  padding: 32px 0;
}

h2 .highlight {
  color: #fdc654;
}

h2 {
  font-size: 32px;
  margin: 0;
}

h3 {
  color: #d61e2d;
  font-size: 14px;
  line-height: 18px;
  margin: 0;
}

/* .header {
  margin-bottom: 50px;
}
 */
.logo {
  border-radius: 40px;
  width: 200px;
  height: 200px;
  display: flex;
  justify-content: center;
  margin: 0 auto 16px;
  background: rgba(255, 255, 255, 0.1);
  align-items: center;
}

button {
  background: white;
  display: block;
  color: #d61e2d;
  width: 100%;
  border: none;
  border-radius: 40px;
  padding: 12px 0;
  text-transform: uppercase;
  font-weight: bold;
  margin-bottom: 32px;
  outline: none;
}

.form-field {
  margin-bottom: 16px;
  width: 100%;
  position: relative;
}

.form-field .icon {
  position: absolute;
  background: white;
  color: #d61e2d;
  left: 0;
  top: 0;
  display: flex;
  align-items: center;
  height: 100%;
  width: 40px;
  height: 40px;
  justify-content: center;
  border-radius: 20px;
}

.form-field .icon:after {
  content: "";
  display: block;
  width: 0;
  height: 0;
  border: 12px solid transparent;
  border-left: 12px solid white;
  position: absolute;
  top: 8px;
  right: -20px;
}

.form-field input {
  border: 1px solid rgba(255, 255, 255, 0.2);
  text-align: center;
  width: 100%;
  border-radius: 16px;
  height: 36px;
  background: rgba(255, 255, 255, 0.1);
  color: white;
  outline: none;
  transition: all 0.2s;
}

.form-field input::placeholder {
  color: white;
}

.form-field input:hover,
.form-field input:focus {
  background: white;
  color: #d61e2d;
  transition: all 0.2s;
}

.form-field input:hover::placeholder {
  color: black;
}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		        
<%
	
	MongoClient mongoClient = new MongoClient("localhost", 27017);
	System.out.println("MongoDB Connected...");
	
	MongoDatabase db = mongoClient.getDatabase("sample_mflix");
	System.out.println("Connected Database...");
	
	MongoCollection<Document> collection = db.getCollection("users");
	System.out.println("Collection Connected...");

	  
	   
	   String username =request.getParameter("fullname");
	   String email =request.getParameter("email");
	   String password =request.getParameter("password");

	   Document document = new Document();
	      document.append("name", username);
	      document.append("email", email);
	      document.append("password", password);
	      //Inserting the document into the collection
	      db.getCollection("users").insertOne(document);
		  	response.sendRedirect("login.jsp");

%>
		        
		  
</body>
</html>