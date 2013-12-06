package sfm;


import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.google.appengine.labs.repackaged.com.google.common.base.Joiner;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.query.annotation.List;

import java.util.ArrayList;
import java.util.Date;

@Entity
public class Queryq implements Comparable<Queryq> {
	@Id
    public Long id;
	@Index
    public String QueueName;
	@Index
    public String CourtName;
	@Index
    public String PlayerName;
	@Index
    public String Slot;
    	 
    static {
        ObjectifyService.register(Queryq.class);
}
  
        
       
        // TODO: figure out why this is needed
        @SuppressWarnings("unused")
        private Queryq() {
        }
        
        @Override
        public String toString() {
                Joiner joiner = Joiner.on(":");
                return joiner.join(id.toString(), CourtName );
         }

        public Queryq(String CourtN, String SlotN, String PlayerN)
         {
                                
                this.CourtName=CourtN;
                this.PlayerName=PlayerN;
                this.Slot=SlotN;
         }
        
        
        
        public String getCourtName()
        {	
        	return this.CourtName;
        }
        
        public String getSlot()
        {	
        	return this.Slot;
        }
        public String getPlayerName()
        {	
        	return this.PlayerName;
        }
        public Long getId()
        {
        	return (id);
        }
        
	
		@Override
		public int compareTo(Queryq o) {
			// TODO Auto-generated method stub
			return 0;
		}
}