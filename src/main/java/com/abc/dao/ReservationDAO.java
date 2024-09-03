package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Reservation;

public class ReservationDAO {

    public void addReservation(Reservation reservation) {
        String query = "INSERT INTO Reservation (name, email, phone, date, time, people, message, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DBConnectionFactory.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, reservation.getName());
            statement.setString(2, reservation.getEmail());
            statement.setString(3, reservation.getPhone());
            statement.setString(4, reservation.getDate());
            statement.setString(5, reservation.getTime());
            statement.setInt(6, reservation.getPeople());
            statement.setString(7, reservation.getMessage());
            statement.setString(8, reservation.getStatus());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String query = "SELECT * FROM Reservation ORDER BY reservation_id DESC"; // Order by reservation_id in descending order

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            int id = resultSet.getInt("reservation_id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String phone = resultSet.getString("phone");
            String date = resultSet.getString("date");
            String time = resultSet.getString("time");
            int people = resultSet.getInt("people");
            String message = resultSet.getString("message");
            String status = resultSet.getString("status");
            reservations.add(new Reservation(id, name, email, phone, date, time, people, message, status));
        }

        resultSet.close();
        statement.close();
        connection.close();

        return reservations;
    }


    public void updateReservationStatus(int reservationId, String status) throws SQLException {
        String query = "UPDATE Reservation SET status = ? WHERE reservation_id = ?";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DBConnectionFactory.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setInt(2, reservationId);
            statement.executeUpdate();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteReservation(int reservationId) throws SQLException {
        String query = "DELETE FROM Reservation WHERE reservation_id = ?";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DBConnectionFactory.getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, reservationId);
            statement.executeUpdate();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public int getReservationCount() throws SQLException {
        String query = "SELECT COUNT(*) AS count FROM Reservation";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt("count");
            }
        } 
        return 0;
    }
}
