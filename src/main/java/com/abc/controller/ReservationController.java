package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.abc.model.Reservation;
import com.abc.service.ReservationService;
import com.abc.util.EmailUtil;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationService reservationService;

    public void init() throws ServletException {
        reservationService = ReservationService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            listReservations(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("accept")) {
            acceptReservation(request, response);
        } else if (action.equals("reject")) {
            rejectReservation(request, response);
        } else if (action.equals("delete")) {
            deleteReservation(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("add")) {
            addReservation(request, response);
        }
    }

    private void listReservations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("reservations", reservationService.getAllReservations());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("WEB-INF/view/listReservations.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addReservation.jsp").forward(request, response);
    }

    private void addReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int people = Integer.parseInt(request.getParameter("people"));
        String message = request.getParameter("message");

        Reservation reservation = new Reservation();
        reservation.setName(name);
        reservation.setEmail(email);
        reservation.setPhone(phone);
        reservation.setDate(date);
        reservation.setTime(time);
        reservation.setPeople(people);
        reservation.setMessage(message);
        reservation.setStatus("Pending");

        try {
            reservationService.addReservation(reservation);
            response.sendRedirect("index?success=true&message=Your booking request was sent. We will call back or send an Email to confirm your reservation. Thank you!");
        } catch (Exception e) {
            response.sendRedirect("index?error=true&message=There was an error submitting your reservation. Please try again later.");
        }
    }

    private void acceptReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationId = Integer.parseInt(request.getParameter("id"));
        try {
            Reservation reservation = reservationService.getReservationById(reservationId);
            reservationService.updateReservationStatus(reservationId, "Accepted");
            
            // Send email notification to customer
            EmailUtil.sendReservationAcceptedEmail(reservation.getEmail(), reservation.getName(), reservation.getDate(), reservation.getTime());
            
            request.getSession().setAttribute("message", "Accepted Reservation Successfully");
            response.sendRedirect("admin?action=dashboard");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void rejectReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationId = Integer.parseInt(request.getParameter("id"));
        try {
            Reservation reservation = reservationService.getReservationById(reservationId);
            reservationService.updateReservationStatus(reservationId, "Rejected");
            
            // Send email notification to customer
            EmailUtil.sendReservationRejectedEmail(reservation.getEmail(), reservation.getName(), reservation.getDate(), reservation.getTime());
            
            request.getSession().setAttribute("message", "Rejected Reservation Successfully");
            response.sendRedirect("admin?action=dashboard");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationId = Integer.parseInt(request.getParameter("id"));
        try {
            reservationService.deleteReservation(reservationId);
            request.getSession().setAttribute("message", "Deleted Reservation Successfully");
            response.sendRedirect("admin?action=dashboard");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
