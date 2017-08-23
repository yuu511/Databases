import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the video and bookstore database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 * Please make sure that the methods are not prone to SQL Injection
 */
public class StoreApplication {

	/**
	 * Return a list of phone numbers of customers, given a first name and
	 * last name.
	 */
	public List<String> getCustomerPhoneFromFirstLastName(Connection connection,
			String firstName, String lastName) {
		List<String> result = new ArrayList<String>();
		String query = "SELECT phone FROM dv_address WHERE address_id = (SELECT address_id FROM mg_customers WHERE first_name = '"+firstName+"' AND last_name = '"+ lastName +"')";
		try (Statement stmt = connection.createStatement()){
		  ResultSet rs = stmt.executeQuery(query);
		  while (rs.next()){
		  	result.add(rs.getString("phone"));
		  }
	     } catch (SQLException e) {
	    	System.out.print ("error at getCustomerPhone");
	    	System.exit(1);
	     }
	      System.out.println(result.size());
		return result;
	}

	/**
	 * Return list of film titles whose length is is equal to or greater
	 * than the minimum length, and less than or equal to the maximum
	 * length.
	 */
	public List<String> getFilmTitlesBasedOnLengthRange(Connection connection,
			int minLength, int maxLength) {
		List<String> result = new LinkedList<String>();
		String query = "SELECT a.title FROM dv_film a WHERE length >="+minLength+" AND length <="+maxLength+"";
        try (Statement stmt = connection.createStatement()){
		  ResultSet rs = stmt.executeQuery(query);
		  while (rs.next()){
		  	result.add(rs.getString("title"));
		  }
	     } catch (SQLException e) {
	    	System.out.print ("error at getCustomerPhone");
	    	System.exit(1);
	     }
	      System.out.println(result.size());

		return result;
	}

	/**
	 * Return the number of customers that live in a given district and
	 * have the given active status.
	 */
	public final int countCustomersInDistrict(Connection connection,
			String districtName, boolean active) {
		int result = -1;
		String query ="SELECT count(a) FROM mg_customers a, dv_address b WHERE a.address_id = b.address_id AND b.district ="+districtName+" AND a.active = "+active+"";
        try (Statement stmt = connection.createStatement()){
		  ResultSet rs = stmt.executeQuery(query);
		  while (rs.next()){
		  	result= rs.getInt(1);
		  }
	     } catch (SQLException e) {
	    	System.out.print ("error at getCustomerPhone");
	    	System.exit(1);
	     }
	      System.out.println(result);
		return result;
	}

	/**
	 * Add a film to the inventory, given its title, description,
	 * length, and rating.
	 *
	 * Your query will need to cast the rating parameter to the
	 * enumerared type mpaa_rating. Whereas an uncast parameter is
	 * simply a question mark, casting would look like ?::mpaa_rating 
	 */
	public void insertFilmIntoInventory(Connection connection, String
			title, String description, int length, String rating)
	{

	}

	/**
	 * Constructor
	 */
	public StoreApplication()
	{}

};
