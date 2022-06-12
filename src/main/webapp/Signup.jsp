<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import= "java.util.ArrayList" %>
<%@page import= "com.mongodb.MongoClient"  %>
<%@page import= "com.mongodb.BasicDBObject" %>
<%@page import= "com.mongodb.client.MongoCursor" %>
<%@page import= "com.mongodb.client.MongoCollection" %>
<%@page import= "com.mongodb.client.MongoDatabase"%> 
<%@page import= "org.bson.Document" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="CSS/SignUp.css" rel="stylesheet">
 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">

<title>Signup</title>
</head>
<body>
 
  <div class="container">
    <div class="box-1">
      <div class="logo-box">
        <img src="img/mflixlogo.jpg" alt="mflix logo">
      </div>
      <h1>
        Create your account
      </h1>
      <h6>Already registered? <a href="login.jsp"><span>Sign in</span></a> </h6>
      <div class="footer">
        <span id="footer"><a href="#">Conditions of Use</a></span>
        <span id="footer"><a href="#">Privacy Notice</a></span>
        <span id="footer"><a href="#">Help</a></span><br />
        <div class="footer-end">
          <span id="footer-end">Mflix.com All Rights Reserved</span>
        </div>
      </div>

    </div>
    <div class="box-2">
      <form  method="get" action="Registeration.jsp"onsubmit="Registeration.jsp">
        <div class="input-container">
          <input class="input-box" type="text" name="fullname" placeholder="FULL NAME" required>
        </div>
        <div class="input-container">
          <input class="input-box" type="email" name="email" placeholder="EMAIL" required>
        </div>
        <div class="input-container">
          <input class="input-box" type="password" name="password" placeholder="PASSWORD" maxLength="32" required>
        </div>
        <div class="input-container">
          <input class="input-box" type="password" name="password" placeholder="RE-ENTER PASSWORD" maxLength="32" required>
        </div>
        <div id="submit-container">
          <input id="submit" type="submit" value="Create your account">
        </div>
        <p>By creating an account you agree to Mflix's Policies, <a href="#">Condition of Use</a> and <a href="#">Privacy Notice</a></p>
      </form>
      
    </div>
  </div>
</body>
</body>
</html>