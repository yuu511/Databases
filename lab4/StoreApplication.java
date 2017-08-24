/*Elijah Cordova 1425119*/
/*Lab 4 StoreApplication.java*/

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
		try {
		  PreparedStatement stmt = connection.prepareStatement("SELECT phone FROM dv_address WHERE address_id = (SELECT address_id FROM mg_customers WHERE first_name= ? AND last_name = ?)");
		  stmt.setString(1, firstName);
		  stmt.setString(2, lastName);
		  ResultSet rs = stmt.executeQuery();
		  while (rs.next()){
		  	result.add(rs.getString("phone"));
		  }
		   rs.close();
		   stmt.close();
	     } catch (SQLException e) {
	    		System.err.println("Query failed in getCustomerPhoneFromFirstLastName()");
				System.err.println("Message from Postgres: " + e.getMessage());
				System.exit(-1);
	     }
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
        try {
		  PreparedStatement stmt = connection.prepareStatement("SELECT a.title FROM dv_film a WHERE length >= ? AND length <= ?");
		  stmt.setInt(1, minLength);
		  stmt.setInt(2, maxLength);
		  ResultSet rs = stmt.executeQuery();
		   while (rs.next()){
		  	result.add(rs.getString(1));
		  }
		  	rs.close();
		  	stmt.close();
		  } catch (SQLException e) {
	    	System.err.println("Query failed in getFilmTitlesBasedOnLengthRange()");
			System.err.println("Message from Postgres: " + e.getMessage());
			System.exit(-1);
	     }
		return result;
	}

	/**
	 * Return the number of customers that live in a given district and
	 * have the given active status.
	 */
	public final int countCustomersInDistrict(Connection connection,
			String districtName, boolean active) {
		int result = -1;
        try {
		PreparedStatement stmt = connection.prepareStatement("SELECT count(a) FROM mg_customers a, dv_address b WHERE a.address_id = b.address_id AND b.district = ? AND a.active = ?;");
		  stmt.setString(1, districtName);
		  stmt.setBoolean(2, active);
		  ResultSet rs = stmt.executeQuery();
		   while (rs.next()){
		  	result = (rs.getInt(1));
		  }
		  	rs.close();
		  	stmt.close();
	      } catch (SQLException e) {
	    	System.err.println("Query failed in countCustomersInDistrict()");
			System.err.println("Message from Postgres: " + e.getMessage());
			System.exit(-1);
	     }
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
			title, String description, int length, String rating){
         try {
		 	PreparedStatement stmt = connection.prepareStatement("INSERT INTO dv_film (title, description, length, rating) VALUES (?, ?, ?, cast(? as mpaa_rating));");
		 	stmt.setString(1, title);
        	stmt.setString(2, description);
        	stmt.setInt(3, length);
        	stmt.setString(4, rating);
        	stmt.execute();
        	stmt.close();
	     } catch (SQLException e) {
	    	System.err.println("Query failed in insertFilmIntoInventory()");
			System.err.println("Message from Postgres: " + e.getMessage());
			System.exit(-1);
	     }

	}

	/**
	 * Constructor
	 */
	public StoreApplication()
	{}

};
