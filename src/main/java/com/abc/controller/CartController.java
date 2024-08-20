package com.abc.controller;

import com.abc.model.Cart;
import com.abc.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

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
            if (action != null && action.equals("add")) {
                addProductToCart(request, cart);
            } else if (action != null && action.equals("update")) {
                updateProductInCart(request, cart);
            } else if (action != null && action.equals("remove")) {
                removeProductFromCart(request, cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("cart.jsp");
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
}
