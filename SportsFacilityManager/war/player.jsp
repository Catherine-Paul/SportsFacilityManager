<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>
<head>
<script>
function home()
{
	window.location = '/sfm.jsp';
}
function plan()
{
	window.location = '/plan.jsp';
}
function view()
{
	window.location = '/showqueue.jsp';
}
</script>
</head>
<body>

<table align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
<p><font face="Arial">
&nbsp;
&nbsp;
&nbsp;
<p>Hello Player!</p>
&nbsp;
&nbsp;
<form action="/player" method="post">

<button type="button" onclick="plan()" style="width: 85; height: 24"><font face="Arial"> Plan Visit</font></button>
<button type="button" onclick="view()" style="width: 85; height: 24"><font face="Arial"> View Queue</font></button><br><br><br>
<button type="button" onclick="home()" style="width: 85; height: 24"><font face="Arial"> Home</font></button>
</form>

		</td>
	</tr>
</table>
  
</body>
</html>