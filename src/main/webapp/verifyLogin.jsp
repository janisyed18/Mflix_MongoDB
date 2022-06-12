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

<%
	
	MongoClient mongoClient = new MongoClient("localhost", 27017);
	System.out.println("MongoDB Connected...");
	
	MongoDatabase db = mongoClient.getDatabase("sample_mflix");
	System.out.println("Connected Database...");
	
	MongoCollection<Document> collection = db.getCollection("users");
	System.out.println("Collection Connected...");

	  /*  long count =  mongoClient.getDatabase("sample_mflix")               
	                             .getCollection("users")
	                             .count(new Document("name", uname));
	   if(count>0){
	   //exists s
			System.out.println("MongoDB succesful...");

	   }
	   else{
		   System.out.println("MongoDB unsuccesful...");
	   } */
	   
	   String username =request.getParameter("uname");

	   BasicDBObject uname = new BasicDBObject();
	   uname.put("email", username);
	   System.out.println(username);

	   MongoCursor<Document> user = collection.find(uname).iterator();
	
	   String password =request.getParameter("psw");

	   BasicDBObject pswd = new BasicDBObject();
	   pswd.put("password", password);
	   System.out.println(password);

	   MongoCursor<Document> psw = collection.find(pswd).iterator();
	   
	   if (!user.hasNext() && !psw.hasNext() ) {
	       System.out.println("login unsuccessfull..");

	       %>

			<div>
	   			<a style="color: red;">The Username or password entered does not match. Please try again.</a>        
		        
		      </div>
	   <%
	   }//if

	   else{
		   System.out.println("MongoDB succesful..56//8.");
		  	response.sendRedirect("landingPage.jsp");
	   } 
	
%>
	      

</body>
</html>