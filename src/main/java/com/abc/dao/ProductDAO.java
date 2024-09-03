package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Product;

public class ProductDAO {

    public void addProduct(Product product) {
        String query = "INSERT INTO Product (name, price, description, image_path, category) VALUES (?, ?, ?, ?, ?)";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DBConnectionFactory.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, product.getName());
            statement.setString(2, product.getPrice()); // Change to setString
            statement.setString(3, product.getDescription());
            statement.setString(4, product.getImagePath());
            statement.setString(5, product.getCategory());
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

    public void updateProduct(Product product) {
        String query = "UPDATE Product SET name = ?, price = ?, description = ?, image_path = ?, category = ? WHERE product_id = ?";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DBConnectionFactory.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, product.getName());
            statement.setString(2, product.getPrice()); // Change to setString
            statement.setString(3, product.getDescription());
            statement.setString(4, product.getImagePath());
            statement.setString(5, product.getCategory());
            statement.setInt(6, product.getProductId());
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
    
    public void deleteProduct(int productId) {
        String query = "DELETE FROM Product WHERE product_id = ?";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DBConnectionFactory.getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, productId);
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected == 0) {
                // If no rows were affected, it means the product ID does not exist
                System.out.println("No product found with ID: " + productId);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Log the exception
            }
        }
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product";

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            int id = resultSet.getInt("product_id");
            String name = resultSet.getString("name");
            String price = resultSet.getString("price"); // Change to getString
            String desc = resultSet.getString("description");
            String imagePath = resultSet.getString("image_path");
            String category = resultSet.getString("category");
            products.add(new Product(id, name, desc, price, imagePath, category));
        }

        resultSet.close();
        statement.close();
        connection.close();

        return products;
    }
    
    public int getProductCount() throws SQLException {
        String query = "SELECT COUNT(*) AS count FROM Product";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try {
            connection = DBConnectionFactory.getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("count");
            }
        } finally {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }

        return count;
    }
}
