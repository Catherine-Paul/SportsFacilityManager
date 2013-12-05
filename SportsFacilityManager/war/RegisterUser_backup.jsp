<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

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

<p>Hello System Admin! 
    
        <h1>Register User</h1>

        <form name="RegisterUser" action="register" onsubmit="return validateForm()" method="get">

                FirstName* <input type="text" name="FirstName"><br> 
                <p>

                LastName* <input type="text" name="LastName"><br> 
                <p>

                UserName* <input type="text" name="UserName"><br> 
                <p>

 				Email* <input type="text" name="Email"><br> 
                <p>
                
                Mobile* <input type="text" name="Mobile"><br> 
                <p>
                
                UserType* <input type="text" name="UserType"><br> 
                <p>
                
                SkillLevel* <input type="text" name="SkillLevel"><br> 
                <p>

                <input type="submit" value="Register User">
        </form>
<button type="button" onclick="myFunction4()"><font face="Arial"> Home</font></button>
</body>
</html>