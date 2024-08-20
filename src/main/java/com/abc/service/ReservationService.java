package com.abc.service;

import java.sql.SQLException;
import java.util.List;
import com.abc.dao.ReservationDAO;
import com.abc.model.Reservation;

public class ReservationService {

    private static ReservationService instance;
    private ReservationDAO reservationDAO;

    private ReservationService() {
        this.reservationDAO = new ReservationDAO();
    }

    public static ReservationService getInstance() {
        if (instance == null) {
            synchronized (ReservationService.class) {
                if (instance == null) {
                    instance = new ReservationService();
                }
            }
        }
        return instance;
    }

    public void addReservation(Reservation reservation) {
        reservationDAO.addReservation(reservation);
    }

    public List<Reservation> getAllReservations() throws SQLException {
        return reservationDAO.getAllReservations();
    }
    
    public void updateReservationStatus(int reservationId, String status) throws SQLException {
        reservationDAO.updateReservationStatus(reservationId, status);
    }

    public void deleteReservation(int reservationId) throws SQLException {
        reservationDAO.deleteReservation(reservationId);
    }
}
