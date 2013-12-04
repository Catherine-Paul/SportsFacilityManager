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

<html>
<head>

<script>

function myFunction4()
{
	window.location = '/sfm.jsp';
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
<font face="Arial"><b>SIGN IN PLAYER</b><br>
Please choose the user to check in:<br>
<font size="3">
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
<br>
<div><input type="submit" value="Go" /></div>
</font></font>
</form>
 <font face="Arial">
 <%         
        String FName = request.getParameter("fname");
        if(FName!=null)
        out.println("Checked in Player " + FName );        
%> 
<br>
</font>
<button type="button" onclick="myFunction4()"><font size="3" face="Arial">Home</font><font size="3"></button>

<p>&nbsp;</p>
		</td>
	</tr>
</table>

</body>
</html>