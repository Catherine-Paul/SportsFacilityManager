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

<html>
<body>
<table align="center" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font face="Arial" size="5">
		SPORTS FACILITY MANAGER</font></b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA">
&nbsp;<p>&nbsp;</p>
<p>Hello Player<font size="4">!</font></p>
<p>&nbsp;</p>
<form action="/player" method="post">
<font size="5"><b>Plan Visit</b></font><p><b><br> 
</b>Please choose the court and date and time:<br>
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
</p>



<p>
<select name="SlotSelected">
<%
				String CName = request.getParameter("courtselected");
				if (CName == null) {
				} else {
					out.println("Selected court  = " + CName);
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
							for (String t : OT) {
								
								x= t.toString();
								pageContext.setAttribute("x", x);
								
								%>
								<option value="${x}">${x}<br></option>	
								<%
								
							}

						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>
			
	</select>		
	<form>
								
			<input type="submit" value="View Open Times" /><br>
					
			
	</form>
	<script>
		function home() {
			window.location = '/sfm.jsp';
		}
	</script>
	<br>
	<button type="button" onclick="home()">Home</button>
</body>
</html>
