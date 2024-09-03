package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Order;

public class OrderDAO {
	public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders";
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                orders.add(new Order(
                    resultSet.getInt("order_id"),
                    resultSet.getString("customer_name"),
                    resultSet.getTimestamp("order_time").toString(),
                    resultSet.getString("order_summary"),
                    resultSet.getString("customer_address"),
                    resultSet.getDouble("total_price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
	
	public void deleteOrder(int orderId) {
        String query = "DELETE FROM Orders WHERE order_id = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, orderId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public int getOrderCount() throws SQLException {
	    String query = "SELECT COUNT(*) AS count FROM Orders";
	    int count = 0;

	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {
	        if (resultSet.next()) {
	            count = resultSet.getInt("count");
	        }
	    }

	    return count;
	}



}
