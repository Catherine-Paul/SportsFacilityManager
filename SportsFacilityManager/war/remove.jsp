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
<%@ page import="sfm.Person"%>
<%@ page import="sfm.Table"%>
<%@ page import="sfm.Queue"%>
<%@ page import="sfm.Queryq"%>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>
<body>
<table align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
&nbsp;<p><font face="Arial">

</font></p>
<p>Deleted All<font size="4">!</font></p>
<p>&nbsp;</p>

<%
				ObjectifyService.register(Court.class);
				List<Court> Courts = ObjectifyService.ofy().load().type(Court.class).list();
								
				for(Court c: Courts)
				{ObjectifyService.ofy().delete().entity(c).now();}
				
				ObjectifyService.register(Person.class);
				List<Person> Persons = ObjectifyService.ofy().load().type(Person.class).list();
								
				for(Person p: Persons)
				{ObjectifyService.ofy().delete().entity(p).now();}
				
				ObjectifyService.register(Table.class);
				List<Table> Tables = ObjectifyService.ofy().load().type(Table.class).list();
								
				for(Table t: Tables)
				{ObjectifyService.ofy().delete().entity(t).now();}
				
				ObjectifyService.register(Queue.class);
				List<Queue> Queues = ObjectifyService.ofy().load().type(Queue.class).list();
								
				for(Queue q:  Queues)
				{ObjectifyService.ofy().delete().entity(q).now();}
				
				ObjectifyService.register(Queryq.class);
				List<Queryq> Queryqs = ObjectifyService.ofy().load().type(Queryq.class).list();
								
				for(Queryq qs:  Queryqs)
				{ObjectifyService.ofy().delete().entity(qs).now();}
				
				
				
%>
	
		
<script>
		function home() {
			window.location = '/sfm.jsp';
		}
</script>
<br>
<button type="button" onclick="home()">Home</button>

</body>
</html>