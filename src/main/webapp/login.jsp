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
<meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link href="CSS/login.css" rel="stylesheet">	
<title>Login</title>
</head>
<body>

  <div class="container">
      <div class="login">
         <div class="container">
              <h1>Log in</h1>
              <form  method="get" action="verifyLogin.jsp" onsubmit="verifyLogin.jsp">
              <input type="email" name="uname" placeholder="User Name" required>
              <input type="password"  name ="psw" placeholder="Password" required><br>
              <input type="checkbox"><span>Remember me</span>
              <a href="forgotpwd.jsp">Forgot password?</a>
              <button>log in</button>
              <div class="clearfix"></div> 
              </form>
         </div>
      </div>
      <div class="register">
          <div class="container">
              <i class="fas fa-user-plus fa-5x"></i>
              <h1>Hello!</h1>
              <p>Enter your personal details and start journey with us</p>
              <a href="Signup.jsp">
              		<button>Register <i class="fas fa-arrow-circle-right"></i></button>
              </a>
          </div>
      </div>  
    </div>

  </body>
     
</body>
</html>