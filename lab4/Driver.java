import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A sample class that connects to PostgreSQL and runs a simple query.
 *
 * Note: Your database name is your login name, so for login jsmith,
 * you would have
 *    getConnection("jdbc:postgresql://cmps180-db.lt.ucsc.edu/jsmith", 
 *    "jsmith" , "password");
 * java -classpath /afs/cats.ucsc.edu/users/g/ejcordov/CMPS182/git/CMPS182/lab4/postgresql-9.3-1101.jdbc41.jar:. Driver
 * or /mnt/d/etc/programs/CMPS182/lab4/postgresql-9.3-1101.jdbc41.jar
 */
public class Driver
{
    public static void main(String[] args) throws
        ClassNotFoundException, FileNotFoundException, IOException,
        SQLException {
       Connection connection;

   	Class.forName("org.postgresql.Driver");  //Registering the driver
    connection = DriverManager.getConnection(
            "jdbc:postgresql://cmps182-db.lt.ucsc.edu/ejcordov",
            "ejcordov", "durability87scalar");  //Making the Connection 

    StoreApplication app = new StoreApplication();

    List<String> phoneNumbers =
        app.getCustomerPhoneFromFirstLastName(connection, "John",
                "Farnsworth");
    System.out.println (phoneNumbers.size());
    
    List<String> filmTitles =
        app.getFilmTitlesBasedOnLengthRange(connection, 60, 120);
    System.out.println (filmTitles.size());    
    
    int count = app.countCustomersInDistrict(connection, "Buenos Aires",
            true);
    System.out.println (count);
    
    app.insertFilmIntoInventory(connection, "Sequel to the Prequel",
            "Memorable", 98, "PG-13");
    System.out.println ("Testing for Insert ( verify using query ), expected output = 'Sequel to Prequel'..");
    String query = "SELECT title FROM dv_film WHERE title = 'Sequel to the Prequel';";
    Statement stmt=null;
    try {
        stmt= connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()){
            System.out.println (rs.getString("title"));
        }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.err.println("Query failed in driver");
            System.err.println("Message from Postgres: " + e.getMessage());
            System.exit(-1);
         }
    connection.close(); //Closing Connection
    }
}
