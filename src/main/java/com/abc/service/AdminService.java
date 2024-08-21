package com.abc.service;

import com.abc.dao.AdminDAO;
import com.abc.model.Admin;

public class AdminService {
    private AdminDAO adminDAO;

    public AdminService() {
        this.adminDAO = new AdminDAO();
    }

    public Admin loginAdmin(String username, String password) {
        return adminDAO.findAdminByUsernameAndPassword(username, password);
    }
}