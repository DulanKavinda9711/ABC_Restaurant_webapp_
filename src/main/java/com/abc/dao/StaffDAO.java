package com.abc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Staff;

public class StaffDAO {

    public void registerStaff(Staff staff) {
        String query = "INSERT INTO Staff (name, email, phone_number, password, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, staff.getName());
            statement.setString(2, staff.getEmail());
            statement.setString(3, staff.getPhoneNumber());
            statement.setString(4, staff.getPassword());
            statement.setString(5, staff.getRole());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Staff loginStaff(String email, String password) {
        String query = "SELECT * FROM Staff WHERE email = ? AND password = ?";

        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("staff_id");
                String name = resultSet.getString("name");
                String phoneNumber = resultSet.getString("phone_number");
                String role = resultSet.getString("role");
                return new Staff(id, name, email, phoneNumber, password, role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Staff> getAllStaff() throws SQLException {
        List<Staff> staffList = new ArrayList<>();
        String query = "SELECT * FROM Staff";

        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("staff_id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phone_number");
                String role = resultSet.getString("role");
                staffList.add(new Staff(id, name, email, phoneNumber, null, role));
            }
        }
        return staffList;
    }

    public void deleteStaff(int staffId) {
        String query = "DELETE FROM Staff WHERE staff_id = ?";

        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, staffId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
