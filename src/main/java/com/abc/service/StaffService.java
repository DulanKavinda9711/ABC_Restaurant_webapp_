package com.abc.service;

import com.abc.dao.StaffDAO;
import com.abc.model.Staff;
import java.sql.SQLException;
import java.util.List;

public class StaffService {
    private StaffDAO staffDAO;

    public StaffService() {
        staffDAO = new StaffDAO();
    }

    public void registerStaff(Staff staff) {
        staffDAO.registerStaff(staff);
    }

    public Staff loginStaff(String email, String password) {
        return staffDAO.loginStaff(email, password);
    }

    public List<Staff> getAllStaff() throws SQLException {
        return staffDAO.getAllStaff();
    }

    public void deleteStaff(int staffId) {
        staffDAO.deleteStaff(staffId);
    }
    
    public int getStaffCount() throws SQLException {
        return staffDAO.getStaffCount();
    }
}
