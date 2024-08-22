package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Gallery;

public class GalleryDAO {

    public void addGallery(Gallery gallery) {
        String query = "INSERT INTO Gallery (image) VALUES (?)";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, gallery.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateGallery(Gallery gallery) {
        String query = "UPDATE Gallery SET image = ? WHERE gallery_id = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, gallery.getImage());
            statement.setInt(2, gallery.getGalleryId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteGallery(int galleryId) {
        String query = "DELETE FROM Gallery WHERE gallery_id = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, galleryId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Gallery> getAllGalleries() throws SQLException {
        List<Gallery> galleries = new ArrayList<>();
        String query = "SELECT * FROM Gallery";
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                int id = resultSet.getInt("gallery_id");
                String image = resultSet.getString("image");
                galleries.add(new Gallery(id, image));
            }
        }
        return galleries;
    }
}
