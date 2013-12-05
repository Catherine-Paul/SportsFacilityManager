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

<html>
<head>
	<script>
		function home() {
			window.location = '/sfm.jsp';
		}
	</script>
	
	<script>
		function show() {
			window.location = '/show.jsp';
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
&nbsp;<p><font face="Arial">Hello <b>Player</b>!</font></p>


<form action="/player" method="post">
	<p><font face="Arial"><b><br> 
	</b>Please choose the court:<br>
	<font size="3">
	<select name="CourtSelected">

		<%
				ObjectifyService.register(Court.class);
				List<Court> Courts = ObjectifyService.ofy().load().type(Court.class).list();
				int count = 0;

				if (Courts.isEmpty()) {	} 
				else {
					count = 0;
					for (Court acourt : Courts) 
					{
						count++;
						pageContext.setAttribute("court_id", acourt.getId());
						pageContext.setAttribute("court", acourt.getCourt());
						if (((acourt.getCourt()) == null) || ((acourt.getCourt()).contentEquals(""))) {
						} else {
		%>
			<option value="${court}">${court}<br></option>

		<%
				}
					}
				}
		%>
		</select>
		
	&nbsp; </font> &nbsp;
	
	<font size="3"><input type="submit" value="View Open Times" /></font></font></p>
	<p><font face="Arial"><br></font>



<font face="Arial"><font size="3">
Please choose the time slot:
<br>
<select name="SlotSelected">

<%
    	UserService userService = UserServiceFactory.getUserService();
    	User user = userService.getCurrentUser();
    	if (user != null) {
      	pageContext.setAttribute("user", user.getNickname());}

				String CName = request.getParameter("courtselected");
				if (CName == null) {
					
					out.println("Selected court  = null");
				} else {
					out.println("Selected court  = " + CName);
					pageContext.setAttribute("courtsel", CName);
				}
								
				ObjectifyService.register(Court.class);
				List<Court> AllCourts = ObjectifyService.ofy().load().type(Court.class).list();
				List<String> OT = new ArrayList<String>();
				String x;
				for (Court c : AllCourts) {
					try {
						if (c.getCourt().contentEquals(CName)) 
						{		
							OT = c.viewOpentimes();
							for (String t : OT) 
							
							{
								
								x= t.toString();
								
								out.println(x);
								
							}

						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
	%>
			
	</select>
	
	<font size="3"><input type="submit" value="Select the Time Slot" /></font>
	</font> </font>		
</form>



	<br>
	<button type="button" onclick="show()">
		<font face="Arial" size="3">View Sign Up Sheet</font>
	</button>
	

	<br>
	<button type="button" onclick="home()">
		<font face="Arial" size="3">Home</font>
	</button>
</body>
</html>