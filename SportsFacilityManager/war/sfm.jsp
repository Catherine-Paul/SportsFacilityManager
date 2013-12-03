<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

  <body>

<table align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
&nbsp;<p><font face="Arial">

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
      pageContext.setAttribute("user", user);
%>
</font></p>
<p><font face="Arial">Welcome to <b>Sports Facility Manager</b>! (<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign 
out</a>)</font><p><font face="Arial">Please select the role that you would like 
to sign in as: </font>

</p>

<form action="/sign" method="post">
<font face="Arial"><font size="3">
<input type="radio" name="Type" value="Player" checked></font>Player<br>
<font size="3">
<input type="radio" name="Type" value="Facility"></font>Facility Administrator<br>
<font size="3">
<input type="radio" name="Type" value="System"></font>System Administrator<br>
</font>
<div><font size="3" face="Arial">
	<input type="submit" value="Select" style="font-weight: 700" /></font></div>
&nbsp;</p>
<font face="Arial">
<%
    } else {
%>
</font>
<p><font face="Arial">Welcome to <b>Sports Facility Manager</b>! Please
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">sign in</a> 
to continue.</font></p>
<font face="Arial">
<%
    }
%>

</font>

</form>
 
<p>&nbsp;</p>
		</td>
	</tr>
</table>
<p>&nbsp;</p>
  
  <p>&nbsp;</p>
 
  </body>
</html>