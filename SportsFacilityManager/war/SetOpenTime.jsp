<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="sfm.Court"%>

<html>

  <body>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
      pageContext.setAttribute("user", user);
%>
<p>Hello System Admin! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    } else {
%>
<p>Welcome to Sports Facility Manager System!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
</p>
<%
    }
%>




<form action="/sys" method="post">
SET OPEN TIME<br>
Please choose the court:<br>
<select name="CourtSelected">

<%
ObjectifyService.register(Court.class);
List<Court> Courts = ObjectifyService.ofy().load().type(Court.class).list();
int count = 0;

if (Courts.isEmpty()) {
    }
else {
	count=0;
	for (Court acourt : Courts)
		{
		count++;
		pageContext.setAttribute("court_id",acourt.getId());
		pageContext.setAttribute("court",acourt.getCourt());
		%>
		<option value="${court}">${court}</option>
		<%
		}
	}
%>


<br>
Select Open Slot(date and time): <input type="datetime-local" name="slot">
<div><input type="submit" value="Go" /></div>
</form>
 <%         
        String CName = request.getParameter("cname");
        out.println("Selected court = " + CName );
        
%> 


  </body>
</html>