package com.abc.controller;

import com.abc.service.StaffService;
import com.abc.model.Staff;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/staff")
public class StaffController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffService staffService;

    public void init() throws ServletException {
        staffService = new StaffService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "login";
        }

        switch (action) {
            case "register":
                showRegisterForm(request, response);
                break;
            case "login":
                showLoginForm(request, response);
                break;
            case "list":
                listStaff(request, response);
                break;
            case "delete":
                deleteStaff(request, response);
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
                registerStaff(request, response);
                break;
            case "login":
                loginStaff(request, response);
                break;
            default:
                loginStaff(request, response);
                break;
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/registerStaff.jsp").forward(request, response);
    }

    private void registerStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Staff staff = new Staff();
        staff.setName(name);
        staff.setEmail(email);
        staff.setPhoneNumber(phoneNumber);
        staff.setPassword(password);
        staff.setRole(role);

        staffService.registerStaff(staff);
        response.sendRedirect("staff?action=login");
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("loginStaff.jsp"); // Redirect to the publicly accessible JSP
    }

    private void loginStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Staff staff = staffService.loginStaff(email, password);
        if (staff != null) {
            request.getSession().setAttribute("staff", staff);
            request.getSession().setAttribute("role", "staff"); // Set the role as "staff" in the session
            response.sendRedirect("adminDashboard.jsp"); // Redirect to the dashboard after successful login
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("loginStaff.jsp").forward(request, response);
        }
    }


    private void listStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Staff> staffList = staffService.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("WEB-INF/view/listStaff.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to retrieve staff list.");
        }
    }

    private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int staffId = Integer.parseInt(request.getParameter("id"));
        staffService.deleteStaff(staffId);
        request.getSession().setAttribute("message", "Successfully removed Staff Member");
        response.sendRedirect("admin");
    }
}
