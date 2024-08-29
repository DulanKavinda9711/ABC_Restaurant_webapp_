package com.abc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.abc.model.Offer;
import com.abc.service.OfferService;

@WebServlet("/offer")
@MultipartConfig
public class OfferController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OfferService offerService;

    public void init() throws ServletException {
        offerService = OfferService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            listOffers(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("edit")) {
            showEditForm(request, response);
        } else if (action.equals("delete")) {
            deleteOffer(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("add")) {
            addOffer(request, response);
        } else if (action.equals("edit")) {
            updateOffer(request, response);
        }
    }

    private void listOffers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("offers", offerService.getAllOffers());
        request.getRequestDispatcher("WEB-INF/view/listOffers.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addOffer.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int offerId = Integer.parseInt(request.getParameter("id"));
        Offer offer = offerService.getAllOffers().stream().filter(o -> o.getOfferId() == offerId).findFirst().orElse(null);
        request.setAttribute("offer", offer);
        request.getRequestDispatcher("WEB-INF/view/editOffer.jsp").forward(request, response);
    }

    private void addOffer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        String imagePath = "uploads" + File.separator + fileName;

        Offer offer = new Offer();
        offer.setName(name);
        offer.setDescription(description);
        offer.setImage(imagePath);

        offerService.addOffer(offer);
        response.sendRedirect("admin");
    }

    private void updateOffer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int offerId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        String imagePath = "uploads" + File.separator + fileName;

        Offer offer = new Offer(offerId, name, description, imagePath);

        offerService.updateOffer(offer);
        response.sendRedirect("admin");
    }

    private void deleteOffer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int offerId = Integer.parseInt(request.getParameter("id"));
        offerService.deleteOffer(offerId);
        response.sendRedirect("admin");
    }
}
