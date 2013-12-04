<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
		<script>
			function myFunction1()
			{
				window.location = '/RegisterUser.jsp';
			}
		</script>
	
		<script>
			function myFunction2()
			{
				window.location = '/UpdateCourts.jsp';
			}
		</script>
	
		<script>
			function myFunction3()
			{
				window.location = '/SetOpenTime.jsp';
			}
		</script>
	
		<script>
			function myFunction4()
			{
				window.location = '/sfm.jsp';
			}
		</script>
	</head>



  <body bgcolor="#FFFFFF">


<table align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
<p>&nbsp;</p>
<p><font face="Arial">Hello <b>System Admin</b>! </font></p>

<button type="button" onclick="myFunction1()"><b><font face="Arial">Register User</font></b></button>
		</font>
&nbsp;
<button type="button" onclick="myFunction2()"><b><font face="Arial">Add Courts</font></b></button>
		</font>
&nbsp;
<button type="button" onclick="myFunction3()"><b><font face="Arial">Set Open Times</font></b></button>
<p><br> 
		</font> 
<button type="button" onclick="myFunction4()"><font face="Arial"> Home</font></button>
  


  		</font>
		</p>
		</td>
	</tr>
</table>
<p>&nbsp;</p>
  
  </body>
</html>