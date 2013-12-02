<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
to include your name with greetings you post.</p>
<%
    }
%>

<script>
function myFunction1()
{
	window.location = '/RegisterUser.jsp';
}
</script>

<script>
function myFunction2()
{
	window.location = '/UpdateCourts.jsp';
}
</script>

<script>
function myFunction3()
{
	window.location = '/sfm.jsp';
}
</script>

<button type="button" onclick="myFunction1()">Register User</button>
<button type="button" onclick="myFunction2()">Update Courts</button><br> 
<button type="button" onclick="myFunction3()">Home</button>
  
  </body>
</html>