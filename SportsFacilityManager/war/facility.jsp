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
<%@ page import="sfm.Queue"%>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>
<head>
<script>

function myFunction3()
{
	window.location = '/showqueue.jsp';
}
</script>
<script>

function myFunction4()
{
	window.location = '/sfm.jsp';
}
function myFunction5()
{
	window.location = '/email.jsp';
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
&nbsp;<p>&nbsp;</p>
<p><font face="Arial">Hello <b>Facility Administrator</b>! 



</font>

</p>

<font face="Arial">

</font>

<form action="/fac" method="post">
<font face="Arial"><b>CHECK IN PLAYER</b><br>
<font face="Arial"size="3">Please choose the court, time slot and user to check in player:<br></font>
<font size="3">

<select name="CourtSelect">
		
		<option value="Badminton">Badminton</option>
        <option value="Tennis">Tennis</option>
        <option value="BasketBall">BasketBall</option>
</select>  

<input type="datetime-local" name="slot"><br>	

<select name="Player">
<font face="Arial">
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
		pageContext.setAttribute("person_fname",aperson.Username);
		%>
		
		<option value="${person_fname}">${person_fname}</option>
		
		<%
		}
	}
%>
</font>
</font>
</font>
<br>
<div><input type="submit" value="Go" /></div>
</font></font>
</form>
 <font face="Arial">
 <%         
        String FName = request.getParameter("uname");
 		String CName = request.getParameter("cname");
 		String TimeSlot = request.getParameter("tslot");
        if(FName!=null)
        out.println("Checked in Player " + FName ); 
        
        
		ObjectifyService.register(Queue.class);
		List<Queue> ques = ObjectifyService.ofy().load().type(Queue.class).list();
		int cnt = 0;

		if (ques.isEmpty()) {	} 
		else {
			count = 0;
			for (Queue q : ques) 
			{
				count++;
				out.println(q.CourtName);
			}	
		}
%>

<br>
</font>
<button type="button" onclick="myFunction3()"><font size="3" face="Arial">View Queue</font><font size="3"></button>

<button type="button" onclick="myFunction4()"><font size="3" face="Arial">Home</font><font size="3"></button>

<button type="button" onclick="myFunction5()"><font face="Arial"> <font size="3">Email</font></font></button>

<p>&nbsp;</p>
		</td>
	</tr>
</table>

</body>
</html>