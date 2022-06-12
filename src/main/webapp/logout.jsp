<%@ page language="java" 
    contentType="text/html; 
    charset=windows-1256"
     pageEncoding="windows-1256" 
     import="com.mongodb.BasicDBObject"
     import="com.mongodb.DB"
     import="com.mongodb.DBCollection"
     import="com.mongodb.DBCursor"
     import="com.mongodb.MongoClient"
     import="java.net.UnknownHostException"
	 import="com.sun.org.apache.bcel.internal.generic.NEW"
	 import="com.mongodb.DBObject"
	 import="com.mongodb.Mongo"
	 import=" java.text.DateFormat"
	 import=" java.text.NumberFormat"
	 import=" java.text.SimpleDateFormat"
	 import=" java.util.Date"
	 import="java.util.Locale"
      %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Session</title>
</head>
<body>
<form>
<% 


Mongo mg = new Mongo("Localhost",27017);
DB db = mg.getDB("sample_mflix");
DBCollection collection = db.getCollection("session");
BasicDBObject doc = new BasicDBObject();
DBCursor cursor = collection.find();
doc = new BasicDBObject();

DateFormat formatter = new SimpleDateFormat();
out.println(formatter.format(new Date(session.getCreationTime())));
out.println(formatter.format(new Date(session.getLastAccessedTime())));
out.println(session.getId());
out.println(session.getAttribute("userid"));
			doc.append("Name",session.getAttribute("userid"));
			doc.append("time",formatter.format(new Date(session.getCreationTime())));
			doc.append("last_accessed",formatter.format(new Date(session.getLastAccessedTime())));
			doc.append("history",session.getAttribute("history"));
			doc.append("ID",session.getId());
			String browser=request.getHeader("user-agent");
			String browsername = "";
			String browserversion = "";
			String[] otherBrowsers={"Firefox","Chrome","Chrome","Safari"};
			    if(browser != null )
			    {
					for(int i=0;i<otherBrowsers.length;i++)
					{
						if(browser.contains(otherBrowsers[i]))
						{
							browsername=otherBrowsers[i];
							break;
						}
			    	}	
				}
			    else{
			        String tempStr = browser.substring(browser.indexOf("MSIE"),browser.length());
			            browsername    = "IE";
			        browserversion = tempStr.substring(4,tempStr.indexOf(";"));
			    	}
			
			
			
			
			doc.append("Browser",browsername);
			doc.append("IP",request.getRemoteAddr());
			
			
			System.out.println("hi---------");
			collection.insert(doc);
			session.setAttribute("history",null);
			session.setAttribute("userid",null);
			//request.setHeader("user-agent",null);
			mg.close();
			response.sendRedirect("user_form.jsp");

%>

</form>
</body>
</html>