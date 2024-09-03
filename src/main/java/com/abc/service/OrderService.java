package com.abc.service;

import java.sql.SQLException;
import java.util.List;
import com.abc.dao.OrderDAO;
import com.abc.model.Order;

public class OrderService {
	private static OrderService instance;
    private OrderDAO orderDAO;

    private OrderService() {
        this.orderDAO = new OrderDAO();
    }

    public static OrderService getInstance() {
        if (instance == null) {
            synchronized (OrderService.class) {
                if (instance == null) {
                    instance = new OrderService();
                }
            }
        }
        return instance;
    }
    
    public void deleteOrder(int orderId) {
        orderDAO.deleteOrder(orderId);
    }
    
    public List<Order> getAllOrders() {
        return orderDAO.getAllOrders();
    }
    
    public int getOrderCount() throws SQLException {
        return orderDAO.getOrderCount();
    }


}
