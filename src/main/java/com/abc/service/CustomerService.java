package com.abc.service;

import com.abc.dao.CustomerDAO;
import com.abc.model.Customer;
import com.abc.util.EmailUtil;

import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    private CustomerDAO customerDAO;

    public CustomerService() {
        customerDAO = new CustomerDAO();
    }

    public List<Customer> getAllCustomers() throws SQLException {
        return customerDAO.getAllCustomers();
    }

    public void deleteCustomer(int customerId) {
        customerDAO.deleteCustomer(customerId);
    }

    public void registerCustomer(Customer customer) {
        customerDAO.registerCustomer(customer);
     // Send welcome email after successful registration
        String subject = "Welcome to ABC!";
        String messageBody = "Dear " + customer.getName() + ",\n\nThank you for registering with us. We're excited to have you on board!\n\nBest regards,\nABC Team";
        EmailUtil.sendEmail(customer.getEmail(), subject, messageBody);
    }

    public Customer loginCustomer(String email, String password) {
        return customerDAO.loginCustomer(email, password);
    }
}
