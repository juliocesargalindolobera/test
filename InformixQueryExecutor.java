import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InformixQueryExecutor {
    // Database connection properties
    private static final String JDBC_URL = "jdbc:informix-sqli://10.26.160.12:1526/bdisac:INFORMIXSERVER=coppel_tcp";
    private static final String USERNAME = "sysksapif";
    private static final String PASSWORD = "TRxzs24%\"";

    public static void main(String[] args) {
        String query = "SELECT numcliente,  t.numtarjeta, fechaexp,       t.codstatustarjeta as deviceStatus,      t.codstatusasignada ,      t.titular       FROM intercard:\"informix\".tarjeta t      WHERE numcliente = '000019944'      AND codstatustarjeta IN ('ACT','INA','BLO','BLT') "; // Replace with your actual query
        executeQueryAndMeasureTime(query);
    }

    public static void executeQueryAndMeasureTime(String query) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the Informix JDBC driver
            Class.forName("com.informix.jdbc.IfxDriver");

            // Connect to the Informix database
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);

            // Prepare and execute the query, measuring the execution time
            statement = connection.prepareStatement(query);
            long startTime = System.currentTimeMillis();
            resultSet = statement.executeQuery();
            long endTime = System.currentTimeMillis();

            // Calculate and print the execution time
            long executionTime = endTime - startTime;
            System.out.println("Query executed in: " + executionTime + " milliseconds");

            // Process the result set (if needed)
            while (resultSet.next()) {
                // Example: print the first column
                System.out.println(resultSet.getString(1));
            }

        }  catch (ClassNotFoundException e) {
            System.err.println("Informix JDBC Driver not found. Include the JDBC library in your classpath.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("SQL error occurred while executing the query.");
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error closing resources.");
                e.printStackTrace();
            }
        }
    }
}