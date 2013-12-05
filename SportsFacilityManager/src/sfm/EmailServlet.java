package sfm;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class EmailServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(FacilityServlet.class.getName());
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {  
    Properties props = new Properties();    
    Session session = Session.getDefaultInstance(props, null);
    
    String msgBody = "The court will be available in 8:00 minutes (7:30 PM)";

    try {
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("cthrnpaul@gmail.com", "Sports Facility Manager"));
        msg.addRecipient(Message.RecipientType.TO,
                         new InternetAddress("uZH2ejzn7imrFBzfDiRTubaESpDaQw@api.pushover.net", "Player"));
        msg.setSubject("SFM Notification");
        msg.setText(msgBody);
        Transport.send(msg);

    } catch (AddressException e) {
        // ...
    } catch (MessagingException e) {
        // ...
    }

    resp.sendRedirect("/sfm.jsp");
        
               
       
    }
}



	
	

	
	       

	        

