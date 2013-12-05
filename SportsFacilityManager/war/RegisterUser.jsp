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

function myFunction4()
{
	window.location = '/sfm.jsp';
}

function validateForm()
{
	var a=document.forms["RegisterUser"]["FirstName"].value;
	if (a==null || a=="")
  	{
  		alert("First Name must be filled out");
  		return false;
  	}
	
	var b=document.forms["RegisterUser"]["LastName"].value;
	if (b==null || b=="")
  	{
  		alert("Last Name must be filled out");
  		return false;
  	}
	
	var c=document.forms["RegisterUser"]["UserName"].value;
	if (c==null || c=="")
  	{
  		alert("User Name must be filled out");
  		return false;
  	}
	
	var d=document.forms["RegisterUser"]["Email"].value;
	if (d==null || d=="")
  	{
  		alert("Email must be filled out");
  		return false;
  	}
	
	var e=document.forms["RegisterUser"]["Mobile"].value;
	if (e==null || e=="")
  	{
  		alert("Mobile must be filled out");
  		return false;
  	}
	
	var f=document.forms["RegisterUser"]["UserType"].value;
	if (f==null || f=="")
  	{
  		alert("User Type must be filled out");
  		return false;
  	}
	
	var g=document.forms["RegisterUser"]["SkillLevel"].value;
	if (g==null || g=="")
  	{
  		alert("Skill Level must be filled out");
  		return false;
  	}
	
}
</script>
</head>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Register User</title>
</head>

<!--  APT: this can be static so we put in html not jsp. Note that the added stream may take a few seconds to show up, 
so the ViewAllStreams.jsp that createStreamServlet redirects to may not contain the stream that's just been added -->
<body>

<p>&nbsp;</p>
<table align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
&nbsp;
           
        <p><font face="Arial" size="3">Hello <b>System Administrator! </b></font>
    
        <h1><font face="Arial" size="5"><b>Register User</b></font></h1>

        <form name="RegisterUser" action="register" onsubmit="return validateForm()" method="get">

                <font face="Arial" size="3">FirstName* <input type="text" name="FirstName"></font><br> 
                <p>

                <font face="Arial" size="3">LastName* <input type="text" name="LastName"></font><br> 
                <p>

                <font face="Arial" size="3">UserName* <input type="text" name="UserName"></font><br> 
                <p>

 				<font face="Arial" size="3">Email* <input type="text" name="Email"></font><br> 
                <p>
                
                <font face="Arial" size="3">Mobile* <input type="text" name="Mobile"></font><br> 
                <p>
                
                <font face="Arial" size="3">UserType* <select type="text" name="UserType"></font><br> 
		
				<option value="Player"><font face="Arial" size="3">Player<br></font></option>
        		<option value="Facility Administrator"><font face="Arial" size="3">Facility Administrator<br></font></option>
        		<option value="System Administrator"><font face="Arial" size="3">System Administrator<br></font></option>
        		</select> 
        		<p>
                                               
                <font face="Arial" size="3">SkillLevel* <input type="text" name="SkillLevel"></font><br> 
                <p>

                <font face="Arial" size="3"><input type="submit" value="Register User"></font>
       
				<button type="button" onclick="myFunction4()"><font face="Arial" size="3"> Home</font></button>
		 </form>
		</td>
	</tr>
</table>
<p>&nbsp;</p>
  
  <p>&nbsp;<p>&nbsp;<p>&nbsp;<p>&nbsp;
</body>
</html>