package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.service.OfferService;
import com.abc.service.ProductService;
import com.abc.service.ServiceService;
import com.abc.service.GalleryService;

@WebServlet("/index")
public class IndexController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProductService productService;
    private ServiceService serviceService;
    private OfferService offerService;
    private GalleryService galleryService; 

    public void init() throws ServletException {
        productService = ProductService.getInstance();
        serviceService = ServiceService.getInstance();
        offerService = OfferService.getInstance();
        galleryService = GalleryService.getInstance(); 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            request.setAttribute("products", productService.getAllProducts());
            request.setAttribute("services", serviceService.getAllServices());
            request.setAttribute("offers", offerService.getAllOffers());
            request.setAttribute("galleries", galleryService.getAllGalleries()); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
