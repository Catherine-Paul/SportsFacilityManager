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
<%@ page import="sfm.Person"%>

<html>

  <body>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
      pageContext.setAttribute("user", user);
%>
<p>Hello Facility Admin! (You can
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




<form action="/fac" method="post">
SIGN IN PLAYER<br>
Please choose the user to check in:<br>
<select name="Player">

<%
ObjectifyService.register(Person.class);
List<Person> Persons = ObjectifyService.ofy().load().type(Person.class).list();
int count = 0;

if (Persons.isEmpty()) {
    }
else {
	count=0;
	for (Person aperson : Persons)
		{
		count++;
		pageContext.setAttribute("person_id",aperson.getId());
		pageContext.setAttribute("person_fname",aperson.getName());
		%>
		<option value="${person_fname}">${person_fname}</option>
		<%
		}
	}
%>


<br>
<div><input type="submit" value="Go" /></div>
</form>
 <%         
        String FName = request.getParameter("fname");
        out.println("Selected name = " + FName );        
%> 
  </body>
</html>