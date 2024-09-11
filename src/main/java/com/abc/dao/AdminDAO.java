package com.abc.dao;

import com.abc.model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    
    public Admin findAdminByUsernameAndPassword(String username, String password) {
        Admin admin = null;

        try (Connection connection = DBConnectionFactory.getConnection()) {
            String query = "SELECT * FROM admin WHERE username = ? AND password = MD5(?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                admin = new Admin();
                admin.setId(resultSet.getInt("id"));
                admin.setUsername(resultSet.getString("username"));
               
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}