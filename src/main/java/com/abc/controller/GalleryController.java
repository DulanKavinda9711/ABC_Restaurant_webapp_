package com.abc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.abc.model.Gallery;
import com.abc.service.GalleryService;

@WebServlet("/gallery")
@MultipartConfig
public class GalleryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GalleryService galleryService;

    public void init() throws ServletException {
        galleryService = GalleryService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            listGalleries(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("edit")) {
            showEditForm(request, response);
        } else if (action.equals("delete")) {
            deleteGallery(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("add")) {
            addGallery(request, response);
        } else if (action.equals("edit")) {
            updateGallery(request, response);
        }
    }

    private void listGalleries(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("galleries", galleryService.getAllGalleries());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("WEB-INF/view/listGalleries.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addGallery.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int galleryId = Integer.parseInt(request.getParameter("id"));
        Gallery gallery = null;
        try {
            gallery = galleryService.getAllGalleries().stream().filter(g -> g.getGalleryId() == galleryId).findFirst().orElse(null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("gallery", gallery);
        request.getRequestDispatcher("WEB-INF/view/editGallery.jsp").forward(request, response);
    }

    private void addGallery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        String imagePath = "uploads" + File.separator + fileName;

        Gallery gallery = new Gallery();
        gallery.setImage(imagePath);

        galleryService.addGallery(gallery);
        response.sendRedirect("admin");
    }

    private void updateGallery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int galleryId = Integer.parseInt(request.getParameter("id"));

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        String imagePath = "uploads" + File.separator + fileName;

        Gallery gallery = new Gallery(galleryId, imagePath);
        galleryService.updateGallery(gallery);
        request.getSession().setAttribute("message", "Image Added Successfully");
        response.sendRedirect("admin");
    }

    private void deleteGallery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int galleryId = Integer.parseInt(request.getParameter("id"));
        galleryService.deleteGallery(galleryId);
        request.getSession().setAttribute("message", "Image Deleted Successfully");
        response.sendRedirect("admin");
    }
}
