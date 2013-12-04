package sfm;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class PlayerServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(PlayerServlet.class.getName());

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
    	String court = req.getParameter("CourtSelected");
    	String slot = req.getParameter("SlotSelected");
    	String user = req.getParameter("Player");      
    	
    	if(court!=null)
    		if(slot!=null)
    			if(user!=null)
    			{
    				Table t = new Table(court, slot, user);
    				ofy().save().entity(t).now();
    			}
        resp.sendRedirect("/plan.jsp?courtselected=" + court + "&" 	+ "slotselected=" + slot + "&" + "user=" + user);
    }
}