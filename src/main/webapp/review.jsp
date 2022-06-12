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
<script src="https://www.w3schools.com/lib/w3.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">

<!-- style for search  btn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  
<head>
<style>

body {  
  background-color: white; 
  background-image: linear-gradient(hsla(290,60%,70%,0.3), pink, hsla(290,60%,70%,0.3));	
}


/* navbar style */

nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 50px;
  display: inline-flex;
  background: #5747e1;
  color: white;
  box-shadow: 1px 3px 4px #E6E6E6;
  align-items: center;
}

.navigation {
  display: inline-flex;
  align-items: center;
  margin: 0 25px;
}

.brand {
  flex: 1;
  margin: 0 25px;
}

.menu {
  display: flex;
  list-style:none;
  margin-right: 25px;
}

.menu li a {
  color: inherit;
  text-decoration: none;
  margin: 0 15px;
}

.menu li a:hover {
  text-decoration: underline;
}

.search {
  position: relative;
  padding-bottom: 15px;
  bottom: -7px;
}

.search-input::placeholder {
  color: white;
  opacity: 0.8;
}

.search-input {
  height: 0px;
  border:none;
  position: absolute;
  left: -200px;
  visibility: hidden;
  opacity: 0;
  top: 40px;
  background: #5747e1;
  color: white;
  padding: 6px;
  font-size: 12px;
  outline: none;
  width: 220px;
  transition: 80ms all ease-in;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  box-shadow: none;
}

.search-button {
  background:transparent;
  color: white;
  cursor: pointer;
  font-size: 14px;
  padding-top: 4px;
}

.search-button:hover + .search-input, .search-input:hover, .search:hover .search-input {
  visibility: visible !important;
  opacity: 1 !important;
  z-index: 9 !important;
  box-shadow: 1px 3px 4px #E6E6E6;
  height: 25px !important;
}

/* review */
table, th {
  border: 1px solid white;
  border-collapse: collapse;
}
th {
  background-color: #96D4D4;
}



table.center {
  margin-left: auto; 
  margin-right: auto;
  width: 80%;
}

input.review-imput{
	width : 100%;
}
/* star raing component  */

.star-rating {
  border:solid 1px #ccc;
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

/* explanation */

article {
  background-color:#ffe;
  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
  color:#006;
  font-family:cursive;
  font-style:italic;
  margin:4em;
  max-width:30em;
  padding:2em;
}

/* review page */
#feedback {
  max-width: 60%;
  width: 100%;
  margin: 10px auto;
  padding: 20px;
  border: solid 1px #f1f1f1;
  background: #fbfbfb;
  box-shadow: #e6e6e6 0 0 4px ;
  border-radius: 0.25rem;
}

@media (max-width: 720px) {
  #feedback{
    max-width: 90%;
  }
}

@media (max-width: 500px) {
  #feedback{
    padding: 10px;
  }
}


}
.pinfo {
 margin: 8px auto;
 font-weight: bold;
 line-height: 1.5;
 color: #0d0d0d;
}
.form-group {
  margin-bottom: 1rem;
}
  
.form-control {
  display: block;
  width: 100%;
  padding: 0.5rem 0.75rem;
  font-size: 1rem;
  line-height: 1.25;
  font-weight: bold;
  color: #6C6262;
  background-color: #fff;
  background-image: none;
  -webkit-background-clip: padding-box;
          background-clip: padding-box;
  border: 1px solid rgba(0, 0, 0, 0.15);
  border-radius: 0.25rem;
  -webkit-transition: border-color ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
  transition: border-color ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
  -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
}

.form-control::-ms-expand {
  background-color: transparent;
  border: 0;
}

.form-control:focus {
  color: #696060;
  background-color: #fff;
  border-color: #5cb3fd;
  outline: none;
}

.form-control::-webkit-input-placeholder {
  color: #F34949;
  opacity: 1;
}

.form-control::-moz-placeholder {
  color: brown;
  opacity: 1;
}

.form-control:-ms-input-placeholder {
  color: blue;
  opacity: 1;
}

.form-control::placeholder {
  color: white;
  opacity: 1;
}

.form-control:disabled, .form-control[readonly] {
  background-color: red;
  opacity: 1;
}

.form-control:disabled {
  cursor: not-allowed;
}

select.form-control:not([size]):not([multiple]) {
  height: calc(2.25rem + 2px);
}

select.form-control:focus::-ms-value {
  color: green;
  background-color: #fff;
}

.form-control-file,
.form-control-range {
  display: block;
}

.input-group {
  position: relative;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  width: 100%;
}

.input-group .form-control {
  position: relative;
  z-index: 2;
  -webkit-box-flex: 1;
  -webkit-flex: 1 1 auto;
      -ms-flex: 1 1 auto;
          flex: 1 1 auto;
  width: 1%;
  margin-bottom: 0;
}

.input-group .form-control:focus, .input-group .form-control:active, .input-group .form-control:hover {
  z-index: 3;
}

.input-group-addon,
.input-group-btn,
.input-group .form-control {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.input-group-addon:not(:first-child):not(:last-child),
.input-group-btn:not(:first-child):not(:last-child),
.input-group .form-control:not(:first-child):not(:last-child) {
  border-radius: 0;
}

.input-group-addon,
.input-group-btn {
  white-space: nowrap;
  vertical-align: middle;
}

.input-group-addon {
  width: 45px;
  padding: 0.5rem 0.75rem;
  margin-bottom: 0;
  font-size: 1rem;
  font-weight: normal;
  line-height: 1.25;
  color: #2e2e2e;
  text-align: center;
  background-color: #eceeef;
  border: 1px solid rgba(0, 0, 0, 0.15);
  border-radius: 0.25rem;
}

.input-group-addon.form-control-sm,
.input-group-sm > .input-group-addon,
.input-group-sm > .input-group-btn > .input-group-addon.btn {
  padding: 0.25rem 0.5rem;
  font-size: 0.875rem;
  border-radius: 0.2rem;
}

.input-group-addon.form-control-lg,
.input-group-lg > .input-group-addon,
.input-group-lg > .input-group-btn > .input-group-addon.btn {
  padding: 0.75rem 1.5rem;
  font-size: 1.25rem;
  border-radius: 0.3rem;
}

.input-group-addon input[type="radio"],
.input-group-addon input[type="checkbox"] {
  margin-top: 0;
}

.input-group .form-control:not(:last-child),
.input-group-addon:not(:last-child),
.input-group-btn:not(:last-child) > .btn,
.input-group-btn:not(:last-child) > .btn-group > .btn,
.input-group-btn:not(:last-child) > .dropdown-toggle,
.input-group-btn:not(:first-child) > .btn:not(:last-child):not(.dropdown-toggle),
.input-group-btn:not(:first-child) > .btn-group:not(:last-child) > .btn {
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
}

.input-group-addon:not(:last-child) {
  border-right: 0;
}

.input-group .form-control:not(:first-child),
.input-group-addon:not(:first-child),
.input-group-btn:not(:first-child) > .btn,
.input-group-btn:not(:first-child) > .btn-group > .btn,
.input-group-btn:not(:first-child) > .dropdown-toggle,
.input-group-btn:not(:last-child) > .btn:not(:first-child),
.input-group-btn:not(:last-child) > .btn-group:not(:first-child) > .btn {
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}

.form-control + .input-group-addon:not(:first-child) {
  border-left: 0;
}

.btn {
  display: inline-block;
  font-weight: normal;
  line-height: 1.25;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  border: 1px solid transparent;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  border-radius: 0.25rem;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.btn:focus, .btn:hover {
  text-decoration: none;
}

.btn:focus, .btn.focus {
  outline: 0;
  -webkit-box-shadow: 0 0 0 2px rgba(2, 117, 216, 0.25);
          box-shadow: 0 0 0 2px rgba(2, 117, 216, 0.25);
}

.btn.disabled, .btn:disabled {
  cursor: not-allowed;
  opacity: .65;
}

.btn:active, .btn.active {
  background-image: none;
}

a.btn.disabled,
fieldset[disabled] a.btn {
  pointer-events: none;
}

.btn-primary {
  color: #fff;
  background-color: #0275d8;
  border-color: #0275d8;
}

.btn-primary:hover {
  color: #fff;
  background-color: #025aa5;
  border-color: #01549b;
}

.btn-primary:focus, .btn-primary.focus {
  -webkit-box-shadow: 0 0 0 2px rgba(2, 117, 216, 0.5);
          box-shadow: 0 0 0 2px rgba(2, 117, 216, 0.5);
}

.btn-primary.disabled, .btn-primary:disabled {
  background-color: #0275d8;
  border-color: #0275d8;
}

.btn-primary:active, .btn-primary.active,
.show > .btn-primary.dropdown-toggle {
  color: #fff;
  background-color: #025aa5;
  background-image: none;
  border-color: #01549b;
}


</style>
<meta charset="ISO-8859-1">
<title>MFlix</title>
</head>
<body>

<%
String defaultImg="Images/movie1.jpg";
String movietitle=request.getParameter("title");
System.out.println(movietitle);
%>

<div class="w3-display-container w3-grayscale-min"> 		

<nav>
    <div class="brand">
      <h3>MFLIX</h3>
    </div>
    <div class="navigation">
      <ul class="menu">
        <li><a href="mainscreen.jsp"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="reviews.jsp"><i class="fa fa-pencil"></i>  Write a review</a></li>
      </ul>
      <div class="search">
        <div class="search-content">
          <button class="search-button"><i class="fa fa-search"></i></button>
			<form action="Search.jsp">
               <input type="text"
                   placeholder=" Search movies"   class="search-input"
                   name="keyword">
           </form>
         </div>
      </div>
    </div>
</nav>	

<br><br>

<h1>Review and rate the movies</h1>
<!-- <div class = " reviews">
	
	<p>To begin writing a review, please enter your name below: </p>
	<br><br>
	
	<table class ="center">
		<tr>
		   <th>
		   		<form>
		              <input type="text"
		                  placeholder="Enter a name"   class="review-imput"
		                  name="keyword" >
		       </form>
		   </th>
		   <th><a href="mainscreen.jsp">Write a review</a></th>
		 </tr>
	</table>
	<br>
	<p>Your overall rating:</p>
		
	<div class="star-rating">
	  <input type="radio" id="5-stars" name="rating" value="5" />
	  <label for="5-stars" class="star">&#9733;</label>
	  <input type="radio" id="4-stars" name="rating" value="4" />
	  <label for="4-stars" class="star">&#9733;</label>
	  <input type="radio" id="3-stars" name="rating" value="3" />
	  <label for="3-stars" class="star">&#9733;</label>
	  <input type="radio" id="2-stars" name="rating" value="2" />
	  <label for="2-stars" class="star">&#9733;</label>
	  <input type="radio" id="1-star" name="rating" value="1" />
	  <label for="1-star" class="star">&#9733;</label>
	</div>

</div>
 -->

<form  id="feedback" method="get" action="reviewposting.jsp" onsubmit="reviewposting.jsp">

  <div class="pinfo">Your personal info</div>
  
<div class="form-group">
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="fa fa-user"></i></span>
  <input  name="name" placeholder="Jjknkohn Doe" class="form-control"  type="text">
  
    </div>
  </div>
</div>

<div class="form-group">
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
    <input name="email" type="email" class="form-control" placeholder="enter email" required>
    
     </div>
  </div>
</div>

<div class="form-group">
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="fa fa-film"></i></span>
  <input  name="moviename" placeholder="movie name" class="form-control"  type="text">
    </div>
  </div>
</div>
<!-- 
 <div class="pinfo">Rate our overall services.</div>
  

<div class="form-group">
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="fa fa-heart"></i></span>
   <select class="form-control" id="rate">
      <option value="1star">1</option>
      <option value="2stars">2</option>
      <option value="3stars">3</option>
      <option value="4stars">4</option>
      <option value="5stars">5</option>
    </select>
    </div>
  </div>
</div> -->

 <div class="pinfo">Write your feedback.</div>
  

<div class="form-group">
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
	  <textarea class="form-control" id="review" name="comment" rows="3"></textarea>
 
    </div>
  </div>
</div>

 <button type="submit" class="btn btn-primary">Submit</button>


</form>
</div>
</body>
</html>