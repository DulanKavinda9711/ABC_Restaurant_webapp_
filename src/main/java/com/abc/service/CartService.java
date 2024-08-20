package com.abc.service;

import com.abc.model.Cart;
import com.abc.model.Product;
import com.abc.service.ProductService;

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
}
