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
            action = "login";
        }

        switch (action) {
            case "list":
                listCustomers(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "register":
                showRegisterForm(request, response);
                break;
            case "login":
                showLoginForm(request, response);
                break;
            case "logout":
                logoutCustomer(request, response);
                break;
            default:
                showLoginForm(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "login";
        }

        switch (action) {
            case "register":
                registerCustomer(request, response);
                break;
            case "login":
                loginCustomer(request, response);
                break;
            default:
                loginCustomer(request, response);
                break;
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("customers", customerService.getAllCustomers());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("WEB-INF/view/listCustomers.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(customerId);
        response.sendRedirect("customer?action=list");
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
            request.getSession().setAttribute("customer", customer);
            response.sendRedirect("main.jsp"); // Redirect to the index page after successful login
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("WEB-INF/view/loginCustomer.jsp").forward(request, response);
        }
    }

    private void logoutCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate(); // Invalidate the session
        response.sendRedirect("customer?action=login"); // Redirect to the login page
    }
}
