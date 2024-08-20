package com.abc.controller;

import com.abc.dao.ProductDAO;
import com.abc.dao.QueryDAO;
import com.abc.dao.CustomerDAO;
import com.abc.dao.StaffDAO;
import com.abc.dao.ReservationDAO;
import com.abc.model.Product;
import com.abc.model.Customer;
import com.abc.model.Staff;
import com.abc.model.Reservation;
import com.abc.model.Query;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private CustomerDAO customerDAO;
    private StaffDAO staffDAO;
    private ReservationDAO reservationDAO;
    private QueryDAO queryDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
        customerDAO = new CustomerDAO();
        staffDAO = new StaffDAO();
        reservationDAO = new ReservationDAO();
        queryDAO = new QueryDAO(); // Initialize the QueryDAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            handleRequest(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            handleRequest(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "dashboard";
        }

        switch (action) {
            case "listProducts":
                showListProducts(request, response);
                break;
            case "listCustomers":
                showListCustomers(request, response);
                break;
            case "listStaff":
                showListStaff(request, response);
                break;
            case "listReservations":
                showListReservations(request, response);
                break;
            case "listQueries": // Corrected the case name
                showListQueries(request, response);
                break;
            case "logout":
                logoutAdmin(request, response);
                break;
            default:
                response.sendRedirect("adminDashboard.jsp"); // Redirect to the admin dashboard if no valid action is provided
                break;
        }
    }	

    private void showListProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("WEB-INF/view/listProducts.jsp").forward(request, response);
    }

    private void showListCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Customer> customers = customerDAO.getAllCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("WEB-INF/view/listCustomers.jsp").forward(request, response);
    }

    private void showListStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Staff> staffList = staffDAO.getAllStaff();
        request.setAttribute("staffList", staffList);
        request.getRequestDispatcher("WEB-INF/view/listStaff.jsp").forward(request, response);
    }

    private void showListReservations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Reservation> reservations = reservationDAO.getAllReservations();
        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("WEB-INF/view/listReservations.jsp").forward(request, response);
    }

    private void showListQueries(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Query> queries = queryDAO.getAllQueries(); // Corrected to use QueryDAO and proper method
        request.setAttribute("queries", queries); // Updated attribute name to "queries"
        request.getRequestDispatcher("WEB-INF/view/listQueries.jsp").forward(request, response); // Updated JSP name
    }

    private void logoutAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect("admin?action=login"); // Redirect to the login page after logout
    }
}
