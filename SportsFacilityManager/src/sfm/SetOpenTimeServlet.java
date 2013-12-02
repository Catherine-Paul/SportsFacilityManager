package sfm;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class SetOpenTimeServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(FacilityServlet.class.getName());

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        // Do the db update here and then redirect to the original page for confirmation
        String court = req.getParameter("CourtSelected");
        resp.sendRedirect("/SetOpenTime.jsp?cname=" + court);
    }
}
