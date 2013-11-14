package sfm;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import java.util.List;

/**
 * This class handles all the CRUD operations related to
 * UserData entity.
 *
 */
public class UserData {

  /**
   * Create/Update the user
   */
  public static void createOrUpdateUser(String FirstName, String LastName, String UserName, String Email, String Mobile, String UserType, String SkillLevel) 
  {
    Entity User = getUser(FirstName);
  	if (User == null) {
  		User = new Entity("UserData", FirstName);
  		User.setProperty("lastname", LastName);
  		User.setProperty("username", UserName);
  		User.setProperty("email", Email);
  		User.setProperty("mobile", Mobile);
  		User.setProperty("usertype", UserType);
  		User.setProperty("skilllevel", SkillLevel);
  	} else {
  		User.setProperty("lastname", LastName);
  		User.setProperty("username", UserName);
  		User.setProperty("email", Email);
  		User.setProperty("mobile", Mobile);
  		User.setProperty("usertype", UserType);
  		User.setProperty("skilllevel", SkillLevel);
  	}
  	Util.persistEntity(User);
  }

  /**
   * Return all the users
   * @param kind : of kind product
   * @return  products
   */
  public static Iterable<Entity> getAllUsers(String kind) {
    return Util.listEntities(kind, null, null);
  }

  /**
   * Get userdata entity
   * @param name : firstname of the user
   * @return: userdata entity
   */
  public static Entity getUser(String Fname) {
  	Key key = KeyFactory.createKey("UserData",Fname);
  	return Util.findEntity(key);
  }

  /**
   * Get all items for a product
   * @param name: name of the product
   * @return list of items
   */
  
  public static List<Entity> getItems(String name) {
  	Query query = new Query();
  	Key parentKey = KeyFactory.createKey("Product", name);
  	query.setAncestor(parentKey);
  	query.addFilter(Entity.KEY_RESERVED_PROPERTY, Query.FilterOperator.GREATER_THAN, parentKey);
  		List<Entity> results = Util.getDatastoreServiceInstance()
  				.prepare(query).asList(FetchOptions.Builder.withDefaults());
  		return results;
	}
  
  /**
   * Delete product entity
   * @param productKey: product to be deleted
   * @return status string
   */
  public static String deleteProduct(String productKey)
  {
	  Key key = KeyFactory.createKey("Product",productKey);	   
	  
	  List<Entity> items = getItems(productKey);	  
	  if (!items.isEmpty()){
	      return "Cannot delete, as there are items associated with this product.";	      
	    }	    
	  Util.deleteEntity(key);
	  return "Product deleted successfully";
	  
  }
}
