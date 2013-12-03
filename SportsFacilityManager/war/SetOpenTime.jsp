<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Collections"%>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService"%>
<%@ page import="sfm.Court"%>

<html>

<body>
<a href="sfm.jsp">Home</a>
	<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		if (user != null) {
		pageContext.setAttribute("user", user);
	%>
	<p>Hello System Admin!</p>
	<%
		} else {
	%>
	<p>
	Welcome to Sports Facility Manager System! 
	<a 		href="<%=userService.createLoginURL(request.getRequestURI())%>">Sign in</a>
	</p>
	<%
		}
	%>

	<form action="/sys" method="post">
		SET OPEN TIME<br> Please choose the court and date and time:<br> 
		<select name="CourtSelected">

			<%
				ObjectifyService.register(Court.class);
				List<Court> Courts = ObjectifyService.ofy().load()
						.type(Court.class).list();
				int count = 0;

				if (Courts.isEmpty()) {
				} else {
					count = 0;
					for (Court acourt : Courts) {
						count++;
						
						pageContext.setAttribute("court_id", acourt.getId());
						pageContext.setAttribute("court", acourt.getCourt());
						
						if(((acourt.getCourt())==null) || ((acourt.getCourt()).contentEquals("")) )
						{}else{
			%>
			<option value="${court}">${court}</option>

			<%
						}	
				}
				}
			%>

<input type="datetime-local" name="slot"><br>
			
			<div>
				<input type="submit" value="Go" />
			</div>

			<%
				String CName = request.getParameter("courtname");
				if(CName==null)
					{ }
				else
				{
				out.println("Selected court  = " + CName);	
				}
				ObjectifyService.register(Court.class);
				List<Court> AllCourts = ObjectifyService.ofy().load().type(Court.class).list();
				for ( Court c : AllCourts ) 
				{	try
					{
						if(c.getCourt().equalsIgnoreCase(CName))					
					 	{
							List<String> OT = c.viewOpentimes();
							for (String t : OT)
							{
								out.println(t ); 
							}
					
					 	}
				      
				     }catch(Exception e)
				     	{	
				    	 e.printStackTrace();
				     	}
				}
			%>
			
			
	</form>
<script>
function home()
{
	window.location = '/sfm.jsp';
}
</script>
<br>
<button type="button" onclick="home()">Home</button>
<a href="<%=userService.createLogoutURL(request.getRequestURI())%>">Sign Out</a>
</body>
</html>