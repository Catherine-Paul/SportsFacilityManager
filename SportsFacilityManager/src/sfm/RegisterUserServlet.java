package sfm;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

// Backs up CreateStream.html form submission. Trivial since there's no image uploaded, just a URL
@SuppressWarnings("serial")
public class RegisterUserServlet extends HttpServlet {
        public void doGet(HttpServletRequest req, HttpServletResponse resp)
                        throws IOException {
                Person s = new Person(req.getParameter("FirstName"), req.getParameter("LastName"), req.getParameter("UserName"), req.getParameter("Email"), req.getParameter("Mobile"), req.getParameter("UserType"), req.getParameter("SkillLevel"));
                		
                
                		
                // persist to datastore
                ofy().save().entity(s).now();
                resp.sendRedirect("/system.jsp");
        }
}