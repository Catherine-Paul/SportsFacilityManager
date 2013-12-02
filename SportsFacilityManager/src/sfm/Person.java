package sfm;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.google.appengine.labs.repackaged.com.google.common.base.Joiner;
import com.googlecode.objectify.ObjectifyFactory;

import java.util.Date;
@Entity
public class Person implements Comparable<Person> {

        static {
                 ObjectifyService.register(Person.class);
        }
        // id is set by the datastore for us
        @Id
        public Long id;
        public String Firstname;
        public String LastName;
        public String Username;
        public String Email;
        public String Mobile;
        public String UserType;
        public String SkillLevel;
  
        // TODO: figure out why this is needed
        @SuppressWarnings("unused")
        private Person() {
        }
        
        @Override
        public String toString() {
                Joiner joiner = Joiner.on(":");
                return joiner.join(id.toString(), Firstname, LastName, Username, Email, Mobile, UserType, SkillLevel  );
         }

        public Person(String Fname,String Lname, String Uname, String mail,String Mob, String UType, String Skill)
         {
                                
                this.Firstname = Fname;
                this.LastName = Lname;
                this.Username= Uname;
                this.Email= mail;
                this.Mobile= Mob;
                this.UserType= UType;
                this.SkillLevel= Skill;
        }
        
        public String getName()
        {
        	return (Firstname);
        }
        
        public Long getId()
        {
        	return (id);
        }
        
        @Override
        public int compareTo(Person other) {
                //if (createDate.after(other.createDate)) {
                //        return 1;
                //} else if (createDate.before(other.createDate)) {
                //        return -1;
                //}
                return 0;
        }
}