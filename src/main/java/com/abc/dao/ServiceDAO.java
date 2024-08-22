package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Service;

public class ServiceDAO {

    public void addService(Service service) {
        String query = "INSERT INTO Service (service_name, image, description) VALUES (?, ?, ?)";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, service.getServiceName());
            statement.setString(2, service.getImage());
            statement.setString(3, service.getDescription());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateService(Service service) {
        String query = "UPDATE Service SET service_name = ?, image = ?, description = ? WHERE service_id = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, service.getServiceName());
            statement.setString(2, service.getImage());
            statement.setString(3, service.getDescription());
            statement.setInt(4, service.getServiceId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteService(int serviceId) {
        String query = "DELETE FROM Service WHERE service_id = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, serviceId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Service> getAllServices() {
        List<Service> services = new ArrayList<>();
        String query = "SELECT * FROM Service";
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                int id = resultSet.getInt("service_id");
                String name = resultSet.getString("service_name");
                String image = resultSet.getString("image");
                String description = resultSet.getString("description");
                services.add(new Service(id, name, image, description));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }
}
