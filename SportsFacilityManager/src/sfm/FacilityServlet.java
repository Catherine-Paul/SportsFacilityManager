package sfm;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class FacilityServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(FacilityServlet.class.getName());

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        // Do the db update here and then redirect to the original page for confirmation
        String player = req.getParameter("Player");
        String courtsel = req.getParameter("CourtSelect");
        String timeslot = req.getParameter("slot");
        //Queue q = new Queue(courtsel,timeslot,player);
        Queryq q = new Queryq(courtsel,timeslot,player);
        ofy().save().entity(q).now();
        
        
        resp.sendRedirect("/facility.jsp?uname=" + player + "&" 	+ "cname=" + courtsel + "&" + "tslot=" + timeslot);
               
       
    }
}
