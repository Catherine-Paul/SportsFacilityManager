<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>
</head>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Register User</title>
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
    
        <h1>Register User</h1>

        <form name="RegisterUser" action="register" method="get">

                <input type="text" name="FirstName"><br> 
                FirstName <p>

                <input type="text" name="LastName"><br> 
                LastName<p>

                <input type="text" name="UserName"><br> 
                UserName<p>

 				<input type="text" name="Email"><br> 
                Email<p>
                
                <input type="text" name="Mobile"><br> 
                Mobile<p>
                
                <input type="text" name="UserType"><br> 
                UserType<p>
                
                <input type="text" name="SkillLevel"><br> 
                SkillLevel<p>

                <input type="submit" value="Register User">
        </form>

</body>
</html>