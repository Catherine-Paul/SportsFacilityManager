<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.Collections"%>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService"%>
<%@ page import="sfm.Court"%>
<%@ page import="sfm.Table"%>
<%@ page import="sfm.Queue"%>
<%@ page import="sfm.Queryq"%>
<%@ page import="com.googlecode.objectify.ObjectifyFactory"%>
<%@ page import="com.googlecode.objectify.Key"%>
<%@ page import="com.googlecode.objectify.annotation.Entity"%>
<%@ page import="com.googlecode.objectify.query.annotation.List"%>
<%@ page import="com.googlecode.objectify.cmd.Query"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Date"%>

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
<style >
table.table2
{
border-collapse:collapse;
}
table.table2, td, th
{
border:1px solid black;
}
</style >
</head>

<body>


<table  class="table1" align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
&nbsp;<p><font face="Arial">Current Queue for the Courts <b></b></font></p>

<table>
<tr>
<th>Time Slot</th>
<th>Player</th>
</tr>

					<%
						ObjectifyService.register(Queryq.class);
							Query <Queryq> q = ObjectifyService.ofy().load().type(Queryq.class).filter("CourtName", "Badminton");
							HashSet<String> T = new HashSet<String>();
							HashSet<String> P = new HashSet<String>();
							for(Queryq qr:q)
								
							{
								T.add(qr.Slot);
								
							}
							for(String t:T)
							{				
								//out.println("<td>" + t.toString() + "</td>");
								
												
								Query <Queryq> qf = q.filter("Slot", t.toString());
								for(Queryq Q:qf)
									
								{
									P.add(Q.PlayerName);
														
								}
								
							for (String p : P) {
								pageContext.setAttribute("t", t.toString());
								pageContext.setAttribute("player", p.toString());
					%>
					<tr>
						<td> ${t}</td>
						<td> ${player}</td>
					</tr>
					<%
						}

						}

						//q=q.filter("PlayerName", "cthrnpaul");

						//for (Queryq que: q) {
						//Query <Queryq> qt = q.filter("TimeSlot", que.Slot);
						//for(Queryq qr:qt)
						//{
						//	out.println(que.toString());}
						//Query <Queryq> qt = q.filter("TimeSlot", "2013-12-05T13:00");

						//for(Queryq qr:qt)
						//{
						//out.println(qr.Slot);}
					%>

				</table>

<button type="button" onclick="home()"><font face="Arial" size="3">Home</font></button></td>
</tr>
</table>
</body>
</html>