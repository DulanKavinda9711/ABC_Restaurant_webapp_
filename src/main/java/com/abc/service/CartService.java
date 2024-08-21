package com.abc.service;

import com.abc.model.Cart;
import com.abc.model.CartItem;
import com.abc.model.Customer;
import com.abc.model.Product;
import com.abc.dao.DBConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CartService {

    private static CartService instance;
    private ProductService productService;

    private CartService() {
        productService = ProductService.getInstance();
    }

    public static CartService getInstance() {
        if (instance == null) {
            synchronized (CartService.class) {
                if (instance == null) {
                    instance = new CartService();
                }
            }
        }
        return instance;
    }

    public void addToCart(Cart cart, int productId, int quantity) throws SQLException {
        Product product = productService.getAllProducts().stream()
                .filter(p -> p.getProductId() == productId)
                .findFirst()
                .orElse(null);

        if (product != null) {
            cart.addItem(product, quantity);
        }
    }

    public void updateCartItem(Cart cart, int productId, int quantity) {
        cart.updateItemQuantity(productId, quantity);
    }

    public void removeCartItem(Cart cart, int productId) {
        cart.removeItem(productId);
    }

    public double calculateTotal(Cart cart) {
        return cart.getTotal();
    }

    public void clearCart(Cart cart) {
        cart.clear();
    }

    public void checkoutCart(Cart cart, Customer customer, String address) throws SQLException {
        String orderQuery = "INSERT INTO Orders (customer_name, order_time, order_summary, customer_address, total_price) VALUES (?, CURRENT_TIMESTAMP, ?, ?, ?)";

        // Prepare a string representing products and their quantities
        StringBuilder orderSummaryBuilder = new StringBuilder();
        for (CartItem item : cart.getItems()) {
            orderSummaryBuilder.append(item.getProduct().getName())
                               .append(" (Qty: ")
                               .append(item.getQuantity())
                               .append("), ");
        }

        if (orderSummaryBuilder.length() > 2) {
            orderSummaryBuilder.setLength(orderSummaryBuilder.length() - 2); // Remove the last comma and space
        }

        try (Connection connection = DBConnectionFactory.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(orderQuery)) {
                statement.setString(1, customer.getName());
                statement.setString(2, orderSummaryBuilder.toString());
                statement.setString(3, address);
                statement.setDouble(4, cart.getTotal());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception or handle it as needed
            throw e; // Re-throw if necessary to inform the caller
        }
    }
}
