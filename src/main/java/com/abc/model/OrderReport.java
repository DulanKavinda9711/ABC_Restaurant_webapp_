package com.abc.model;

public class OrderReport {
    private String date;
    private int totalProducts;
    private double totalIncome;

    public OrderReport(String date, int totalProducts, double totalIncome) {
        this.date = date;
        this.totalProducts = totalProducts;
        this.totalIncome = totalIncome;
    }

    // Getters and Setters
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(int totalProducts) {
        this.totalProducts = totalProducts;
    }

    public double getTotalIncome() {
        return totalIncome;
    }

    public void setTotalIncome(double totalIncome) {
        this.totalIncome = totalIncome;
    }
}
