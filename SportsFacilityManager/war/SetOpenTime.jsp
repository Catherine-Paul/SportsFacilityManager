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
&nbsp;<p><font face="Arial">

</font></p>
<p>Hello System Administrator<font size="4">!</font></p>
<p>&nbsp;</p>
<form action="/sys" method="post">
<b><font size="5">Set Open Time</font></b><p><b><br> 
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

</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<form>
			<br>
			<b>Please choose date and time:</b> 
			<input type="datetime-local" name="slot"><br>			
			<input type="submit" value="Set" />
			
</form>
<p>
	
			<%
				String CName = request.getParameter("courtname");
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
						if (c.getCourt().contentEquals(CName)) {
							out.println("in if loop");
							x=c.getCourt();
							out.println(x);
							OT = c.viewOpentimes();
							for (String t : OT) {
								out.println(t.toString());
							}

						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>
		
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