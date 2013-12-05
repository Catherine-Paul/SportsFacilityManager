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
<%@ page import="sfm.Queue"%>


<!DOCTYPE html>
<html>
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
&nbsp;<p><font face="Arial">Current Queue for the Courts <b></b></font></p>

<table>
<tr>

<th>TimeSlot</th>
<th>Player1</th>
<th>Player2</th>
<th>Player3</th>
<th>Player</th>
</tr>
	
	<%
				ObjectifyService.register(Queue.class);
				List<Queue> qs = ObjectifyService.ofy().load().type(Queue.class).list();
				int counter = 0;

				if (qs.isEmpty()) 
				{	} 
				else {
					counter = 0;
					for (Queue q : qs) 
					{
						counter++;
						if(q.CourtName.contentEquals("Badminton"))
						{	
							//String tim = q.Slot;
							out.println(q.Slot + q.PlayerName);
						}
						//if(q.CourtName.contentEquals("Badminton_1"))
						//out.println(t.CourtName + t.PlayerName + t.Slot);
						//pageContext.setAttribute("court", t.CourtName);
						//pageContext.setAttribute("player", t.PlayerName);
						//pageContext.setAttribute("slot", t.Slot);
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