package sfm;


import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.google.appengine.labs.repackaged.com.google.common.base.Joiner;
import com.googlecode.objectify.ObjectifyFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;
@Entity
public class Court implements Comparable<Court> {

        static {
                 ObjectifyService.register(Court.class);
        }
        // id is set by the datastore for us
        @Id
        public Long id;
        public String CourtName;
        public List<String> opentimes = new ArrayList<String>();
        
       
        // TODO: figure out why this is needed
        @SuppressWarnings("unused")
        private Court() {
        }
        
        @Override
        public String toString() {
                Joiner joiner = Joiner.on(":");
                return joiner.join(id.toString(), CourtName );
         }

        public Court(String Name)
         {
                                
                this.CourtName=Name;
                
         }
        public void addOpentime(String datetime)
        {
        	this.opentimes.add(datetime);
        }
        
        public List<String> viewOpentimes()
        {
        	return this.opentimes;
        }
        public String getCourt()
        {	
        	return this.CourtName;
        }
        
        public Long getId()
        {
        	return (id);
        }
        
        @Override
        public int compareTo(Court other) {
                //if (createDate.after(other.createDate)) {
                //        return 1;
                //} else if (createDate.before(other.createDate)) {
                //        return -1;
                //}
                return 0;
        }
}