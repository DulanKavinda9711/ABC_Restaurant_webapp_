package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.abc.service.ProductService;
import com.abc.service.ServiceService;

@WebServlet("/index")
public class IndexController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProductService productService;
    private ServiceService serviceService;

    public void init() throws ServletException {
        productService = ProductService.getInstance();
        serviceService = ServiceService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Set products and services as attributes
            request.setAttribute("products", productService.getAllProducts());
            request.setAttribute("services", serviceService.getAllServices());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Forward the request to the index.jsp page
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
