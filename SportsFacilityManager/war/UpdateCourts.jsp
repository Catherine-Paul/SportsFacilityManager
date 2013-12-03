<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>
<script>
function validateForm()
{
	var a=document.forms["UpdateCourt"]["CourtName"].value;
	if (a==null || a=="")
  	{
  		alert("Please specify a court name");
  		return false;
  	}

}
</script>
</head>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Update Court</title>
</head>

<!--  APT: this can be static so we put in html not jsp. Note that the added stream may take a few seconds to show up, 
so the ViewAllStreams.jsp that createStreamServlet redirects to may not contain the stream that's just been added -->
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
function home()
{
	window.location = '/sfm.jsp';
}
</script> 
        <h1>Update Court</h1>

        <form name="UpdateCourt" action="update"  onsubmit="return validateForm()" method="get">

                <input type="text" name="CourtName"><br> 
                CourtType_CourtNumber <p>

                <input type="submit" value="Register Court">
        </form>
<button type="button" onclick="home()">Home</button>
</body>
</html>