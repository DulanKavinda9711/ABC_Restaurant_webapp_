package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.abc.model.Order;
import com.abc.model.OrderReport;

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
	
	public Map<String, OrderReport> getOrderReport() throws SQLException {
        String query = "SELECT DATE(order_time) AS order_date, COUNT(*) AS total_products, SUM(total_price) AS total_income " +
                       "FROM Orders GROUP BY DATE(order_time)";
        
        Map<String, OrderReport> report = new LinkedHashMap<>();

        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                String date = resultSet.getString("order_date");
                int totalProducts = resultSet.getInt("total_products");
                double totalIncome = resultSet.getDouble("total_income");
                
                report.put(date, new OrderReport(date, totalProducts, totalIncome));
            }
        }

        return report;
    }
	
	



}
