/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author apiiit123
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class StatusUpdater {

    public static void main(String[] args) {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        // Schedule the status updater task to run every 1 hour
        scheduler.scheduleAtFixedRate(() -> {
            try {
                updateComplaintStatus();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }, 0, 1, TimeUnit.HOURS);
    }

    private static void updateComplaintStatus() throws SQLException {
        // Load the MySQL JDBC driver class
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return; // Exit if the driver class is not found
        }

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/RRTS?" + "user=root&password=Naveen@30")) {

            // Example: Update status based on different time frames
            updateStatus(connection, "Complaint Processing", 2, "Open");
            updateStatus(connection, "Request Accepted", 4, "Complaint Processing");
            updateStatus(connection, "Repairing", 6, "Request Accepted");
            updateStatus(connection, "Repair Completed", 8, "Repairing");

        } catch (SQLException e) {
            throw e;
        }
    }

    private static void updateStatus(Connection connection, String newStatus, int hoursElapsed, String currentStatus) throws SQLException {
        String updateQuery = "UPDATE PRIORITY SET STATUS = ? WHERE STATUS = ? AND TIMESTAMPDIFF(HOUR, created_time, NOW()) >= ?";

        try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
            updateStatement.setString(1, newStatus);
            updateStatement.setString(2, currentStatus);
            updateStatement.setInt(3, hoursElapsed);

            int rowsUpdated = updateStatement.executeUpdate();

            System.out.println(rowsUpdated + " rows updated to " + newStatus + " after " + hoursElapsed + " hours.");
        }
    }
}
