package com.abc.controller;

import com.abc.service.CustomerService;
import com.abc.model.Customer;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/customer")
public class CustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    public void init() throws ServletException {
        customerService = new CustomerService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "login"; // Default action
        }

        switch (action) {
            case "register":
                showRegisterForm(request, response);
                break;
            case "login":
                showLoginForm(request, response);
                break;
            default:
                showLoginForm(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("login".equals(action)) {
            loginCustomer(request, response);
        } else if ("register".equals(action)) {
            registerCustomer(request, response);
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/registerCustomer.jsp").forward(request, response);
    }

    private void registerCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setPhoneNumber(phoneNumber);
        customer.setPassword(password);

        customerService.registerCustomer(customer);
        response.sendRedirect("customer?action=login");
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/loginCustomer.jsp").forward(request, response);
    }

    private void loginCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = customerService.loginCustomer(email, password);
        if (customer != null) {
            request.getSession().setAttribute("customer", customer); // Store customer in session
            response.sendRedirect("main.jsp"); // Redirect to main.jsp after successful login
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("WEB-INF/view/loginCustomer.jsp").forward(request, response);
        }
    }
}
