package com.abc.controller;

import com.abc.model.Cart;
import com.abc.model.Customer;
import com.abc.model.Order;
import com.abc.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartService cartService;

    public void init() throws ServletException {
        cartService = CartService.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        try {
            if (action != null) {
                switch (action) {
                    case "add":
                        addProductToCart(request, cart);
                        break;
                    case "update":
                        updateProductInCart(request, cart);
                        break;
                    case "remove":
                        removeProductFromCart(request, cart);
                        break;
                    case "checkout":
                        proceedToCheckout(request, response);
                        return; // Ensure no further processing after checkout
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page if needed
            return;
        }

        if (!response.isCommitted()) {
            response.sendRedirect("cart.jsp");
        }
    }

    private void addProductToCart(HttpServletRequest request, Cart cart) throws SQLException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartService.addToCart(cart, productId, quantity);
    }

    private void updateProductInCart(HttpServletRequest request, Cart cart) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartService.updateCartItem(cart, productId, quantity);
    }

    private void removeProductFromCart(HttpServletRequest request, Cart cart) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        cartService.removeCartItem(cart, productId);
    }

    private void proceedToCheckout(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Customer customer = (Customer) session.getAttribute("customer");
        String address = request.getParameter("address");

        if (cart == null || customer == null || address == null || address.isEmpty()) {
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page if inputs are invalid
            return;
        }

        // Proceed with the checkout process
        cartService.checkoutCart(cart, customer, address);

        // Assuming the checkout process returns an Order object after saving it to the database
        Order placedOrder = new Order();
        placedOrder.setCustomerName(customer.getName());
        placedOrder.setOrderTime(new Date().toString()); // Set the current time or order time
        placedOrder.setOrderSummary(cart.getItems().toString()); // Simplified, customize as needed
        placedOrder.setCustomerAddress(address);
        placedOrder.setTotalPrice(cart.getTotal());

        // Save the placed order in the session for later use in order confirmation
        session.setAttribute("order", placedOrder);

        // Clear the cart after checkout
        cart.clear();

        // Redirect to the order confirmation page
        response.sendRedirect("orderConfirmation.jsp");
    }
}
