package com.abc.model;

public class Product {

    private int productId;
    private String name;
    private String description;
    private double price;
    private String imagePath;

    public Product() {}

    public Product(int productId, String name, String description, double price, String imagePath) {
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imagePath = imagePath;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}