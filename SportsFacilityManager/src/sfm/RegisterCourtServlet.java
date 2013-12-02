package sfm;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

// Backs up CreateStream.html form submission. Trivial since there's no image uploaded, just a URL
@SuppressWarnings("serial")
public class RegisterCourtServlet extends HttpServlet {
        public void doGet(HttpServletRequest req, HttpServletResponse resp)
                        throws IOException {
                Court c = new Court(req.getParameter("CourtType"), req.getParameter("CourtNo"));
                		
                
                		
                // persist to datastore
                ofy().save().entity(c).now();
                resp.sendRedirect("/system.jsp");
        }
}