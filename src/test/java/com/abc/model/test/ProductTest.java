package com.abc.model.test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.abc.model.Product;

public class ProductTest {

    private Product product;

    @BeforeEach
    public void setUp() {
        
        product = new Product(1, "Pasta", "Creamy Alfredo Pasta", "15.99", "/images/pasta.jpg", "All");
    }

    @Test
    public void testGetProductId() {
        assertEquals(1, product.getProductId());
    }

    @Test
    public void testSetProductId() {
        product.setProductId(2);
        assertEquals(2, product.getProductId());
    }

    @Test
    public void testGetName() {
        assertEquals("Pasta", product.getName());
    }

    @Test
    public void testSetName() {
        product.setName("Pizza");
        assertEquals("Pizza", product.getName());
    }

    @Test
    public void testGetDescription() {
        assertEquals("Creamy Alfredo Pasta", product.getDescription());
    }

    @Test
    public void testSetDescription() {
        product.setDescription("Spicy Pepperoni Pizza");
        assertEquals("Spicy Pepperoni Pizza", product.getDescription());
    }

    @Test
    public void testGetPrice() {
        assertEquals("15.99", product.getPrice());
    }

    @Test
    public void testSetPrice() {
        product.setPrice("12.99");
        assertEquals("12.99", product.getPrice());
    }

    @Test
    public void testGetImagePath() {
        assertEquals("/images/pasta.jpg", product.getImagePath());
    }

    @Test
    public void testSetImagePath() {
        product.setImagePath("/images/pizza.jpg");
        assertEquals("/images/pizza.jpg", product.getImagePath());
    }

    @Test
    public void testGetCategory() {
        assertEquals("All", product.getCategory());
    }

    @Test
    public void testSetCategory() {
        product.setCategory("Breakfast");
        assertEquals("Breakfast", product.getCategory());
    }
}
