<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService"%>
<%@ page import="sfm.Court"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService"%>
<%@ page import="sfm.Court"%>
<%@ page import="sfm.Table"%>



<!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>
<head>
<script>
		function home() {
			window.location = '/sfm.jsp';
		}
</script>
<style>
table
{
border-collapse:collapse;
}
table, td, th
{
border:1px solid black;
}
</style>
</head>

<body>
<table align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
&nbsp;<p><font face="Arial">Hello <b>Player</b>!</font></p>

<table>
<tr>
<th>Court</th>
<th>TimeSlot</th>
<th>Player</th>
</tr>
	<%
				ObjectifyService.register(Table.class);
				List<Table> Tables = ObjectifyService.ofy().load().type(Table.class).list();
				UserService userServ = UserServiceFactory.getUserService();
		    	String username = userServ.getCurrentUser().getNickname();
				int counter = 0;

				if (Tables.isEmpty()) 
				{	} 
				else {
					counter = 0;
					for (Table t : Tables) 
					{
						counter++;
						//if(t.CourtName.contentEquals("Badminton_1"))
						//out.println(t.CourtName + t.PlayerName + t.Slot);
						pageContext.setAttribute("court", t.CourtName);
						pageContext.setAttribute("player", t.PlayerName);
						pageContext.setAttribute("slot", t.Slot);
						%>
						<tr>
						<td>${court}</td>
						<td>${slot}</td>
						<td>${player}</td>
						</tr>
						<%
						
						//out.println(t.PlayerName);
						//out.println(t.Slot);
						}
					}
						
	%>
	

<br>
</table>

<button type="button" onclick="home()"><font face="Arial" size="3">Home</font></td></button>
</body>
</html>