package com.abc.service;

import com.abc.dao.CustomerDAO;
import com.abc.model.Customer;

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
     
    }

    public Customer loginCustomer(String email, String password) {
        return customerDAO.loginCustomer(email, password);
    }
}
