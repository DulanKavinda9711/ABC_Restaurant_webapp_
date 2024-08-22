package com.abc.model;

public class Gallery {

    private int galleryId;
    private String image;

    public Gallery() {}

    public Gallery(int galleryId, String image) {
        this.galleryId = galleryId;
        this.image = image;
    }

    // Getters and Setters
    public int getGalleryId() {
        return galleryId;
    }

    public void setGalleryId(int galleryId) {
        this.galleryId = galleryId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
