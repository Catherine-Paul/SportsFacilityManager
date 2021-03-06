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
public class Table implements Comparable<Table> {

        static {
                 ObjectifyService.register(Table.class);
        }
        // id is set by the datastore for us
        @Id
        public Long id;
        public String TableName;
        public String CourtName;
        public String PlayerName;
        public String Slot;
        //public List<String> opentimes = new ArrayList<String>();
        
       
        // TODO: figure out why this is needed
        @SuppressWarnings("unused")
        private Table() {
        }
        
        @Override
        public String toString() {
                Joiner joiner = Joiner.on(":");
                return joiner.join(id.toString(), TableName );
         }

        public Table(String CourtN, String SlotN, String PlayerN)
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
		public int compareTo(Table o) {
			// TODO Auto-generated method stub
			return 0;
		}
}