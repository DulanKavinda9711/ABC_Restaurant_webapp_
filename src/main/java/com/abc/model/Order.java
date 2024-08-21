package com.abc.model;

public class Order {

    private int orderId;
    private String customerName;
    private String orderTime;
    private String orderSummary;
    private String customerAddress;
    private double totalPrice;

    public Order() {}

    public Order(int orderId, String customerName, String orderTime, String orderSummary, String customerAddress, double totalPrice) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.orderTime = orderTime;
        this.orderSummary = orderSummary;
        this.customerAddress = customerAddress;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderSummary() {
        return orderSummary;
    }

    public void setOrderSummary(String orderSummary) {
        this.orderSummary = orderSummary;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
