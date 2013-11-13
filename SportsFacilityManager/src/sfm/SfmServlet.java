package sfm;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class SfmServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(SfmServlet.class.getName());

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String content = req.getParameter("Type");
        if (content == null) {
            content = "(No selection)";
        }
        if (user != null) {
            log.info("Type of user " + user.getNickname() + ": " + content);
        } else {
            log.info("Type anonymously: " + content);
        }
        resp.sendRedirect("/sfm.jsp");
    }
}