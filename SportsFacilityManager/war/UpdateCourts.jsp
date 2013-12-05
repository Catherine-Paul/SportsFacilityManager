<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>
<script>
function validateForm()
{
	var a=document.forms["UpdateCourt"]["CourtName"].value;
	if (a==null || a=="")
  	{
  		alert("Please specify a court name");
  		return false;
  	}

}
</script>
<script>
function home()
{
	window.location = '/sfm.jsp';
}
function home1()
{
	window.location = '/remove.jsp';
}
</script> 
</head>

<head>

</head>

<!--  APT: this can be static so we put in html not jsp. Note that the added stream may take a few seconds to show up, 
so the ViewAllStreams.jsp that createStreamServlet redirects to may not contain the stream that's just been added -->
<body>
<table align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
&nbsp;

<p><font face="Arial">Hello <b>System Administrator!</b> </font>


        <h1><font face="Arial" size="5">Update Court</font></h1>

        <form name="UpdateCourt" action="update"  onsubmit="return validateForm()" method="get">
		<select name="CourtAdded">
		
		<option value="Badminton">Badminton</option>
        <option value="Tennis">Tennis</option>
        <option value="BasketBall">BasketBall</option>
        </select>    

        <input type="submit" value="Add Court">
        </form>
      
<button type="button" onclick="home()">Home</button>
<button type="button" onclick="home1()">Delete Records</button>
		</td>
	</tr>
</table>
<p>&nbsp;</p>
  
  <p>&nbsp;</p>
</body>
</html>