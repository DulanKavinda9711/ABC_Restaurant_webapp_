package com.abc.service;

import java.sql.SQLException;
import java.util.List;
import com.abc.dao.ProductDAO;
import com.abc.model.Product;

public class ProductService {

    private static ProductService instance;
    private ProductDAO productDAO;

    private ProductService() {
        this.productDAO = new ProductDAO();
    }

    public static ProductService getInstance() {
        if (instance == null) {
            synchronized (ProductService.class) {
                if (instance == null) {
                    instance = new ProductService();
                }
            }
        }
        return instance;
    }

    public void addProduct(Product product) {
        productDAO.addProduct(product);
    }

    public List<Product> getAllProducts() throws SQLException {
        return productDAO.getAllProducts();
    }
    
    public void updateProduct(Product product) {
        productDAO.updateProduct(product);
    }

    public void deleteProduct(int productId) {
        productDAO.deleteProduct(productId);
    }
}
