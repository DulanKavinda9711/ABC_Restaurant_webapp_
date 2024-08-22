package com.abc.model;

public class Offer {
    private int offerId;
    private String name;
    private String description;
    private String image;

    public Offer() {}

    public Offer(int offerId, String name, String description, String image) {
        this.offerId = offerId;
        this.name = name;
        this.description = description;
        this.image = image;
    }

    // Getters and Setters
    public int getOfferId() {
        return offerId;
    }

    public void setOfferId(int offerId) {
        this.offerId = offerId;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
