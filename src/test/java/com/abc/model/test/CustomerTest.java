package com.abc.model.test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.abc.model.Customer;

public class CustomerTest {

    private Customer customer;

    @BeforeEach
    public void setUp() {
       
        customer = new Customer(1, "Dulan Herath", "dulan@gmail.com", "0701234567", "Dulan@123");
    }

    @Test
    public void testGetCustomerId() {
        assertEquals(1, customer.getCustomerId());
    }

    @Test
    public void testSetCustomerId() {
        customer.setCustomerId(2);
        assertEquals(2, customer.getCustomerId());
    }

    @Test
    public void testGetName() {
        assertEquals("Dulan Herath", customer.getName());
    }

    @Test
    public void testSetName() {
        customer.setName("Kavinda Herath");
        assertEquals("Kavinda Herath", customer.getName());
    }

    @Test
    public void testGetEmail() {
        assertEquals("dulan@gmail.com", customer.getEmail());
    }

    @Test
    public void testSetEmail() {
        customer.setEmail("kavinda@gmail.com");
        assertEquals("kavinda@gmail.com", customer.getEmail());
    }

    @Test
    public void testGetPhoneNumber() {
        assertEquals("0701234567", customer.getPhoneNumber());
    }

    @Test
    public void testSetPhoneNumber() {
        customer.setPhoneNumber("0767654321");
        assertEquals("0767654321", customer.getPhoneNumber());
    }

    @Test
    public void testGetPassword() {
        assertEquals("Dulan@123", customer.getPassword());
    }

    @Test
    public void testSetPassword() {
        customer.setPassword("Kavinda@11");
        assertEquals("Kavinda@11", customer.getPassword());
    }
}
