package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.service.ProductService;

@WebServlet("/index")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private ProductService productService;

	    public void init() throws ServletException {
	        productService = ProductService.getInstance();
	    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            request.setAttribute("products", productService.getAllProducts());
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	
	

}
