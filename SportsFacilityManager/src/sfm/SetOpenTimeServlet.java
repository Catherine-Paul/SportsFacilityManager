package sfm;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.http.*;

import java.util.List;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

public class SetOpenTimeServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(FacilityServlet.class
			.getName());

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		// Do the db update here and then redirect to the original page for
		// confirmation
		String court = req.getParameter("CourtSelected");
		String datetime = req.getParameter("slot").toString();

		try {
			ObjectifyService.register(Court.class);
			List<Court> allcourts = OfyService.ofy().load().type(Court.class).list();
			for(Court ct:allcourts)
			{
				if(ct.getCourt().equalsIgnoreCase(court))
					{	ct.addOpentime(datetime);
					ofy().save().entity(ct).now();						
					}
				
			
			}

						
		} catch (Exception e) {
			log.warning("exception = " + e.toString());
		}

		resp.sendRedirect("/SetOpenTime.jsp?courtname=" + court + "&" + "datetime"+ datetime);
		
	}
}
