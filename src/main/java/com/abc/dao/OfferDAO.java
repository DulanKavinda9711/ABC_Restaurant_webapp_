package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Offer;

public class OfferDAO {

    public void addOffer(Offer offer) {
        String query = "INSERT INTO Offer (name, description, image) VALUES (?, ?, ?)";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, offer.getName());
            statement.setString(2, offer.getDescription());
            statement.setString(3, offer.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateOffer(Offer offer) {
        String query = "UPDATE Offer SET name = ?, description = ?, image = ? WHERE offer_id = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, offer.getName());
            statement.setString(2, offer.getDescription());
            statement.setString(3, offer.getImage());
            statement.setInt(4, offer.getOfferId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteOffer(int offerId) {
        String query = "DELETE FROM Offer WHERE offer_id = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, offerId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Offer> getAllOffers() {
        List<Offer> offers = new ArrayList<>();
        String query = "SELECT * FROM Offer";
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                int id = resultSet.getInt("offer_id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                offers.add(new Offer(id, name, description, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return offers;
    }
    
    public int getOfferCount() throws SQLException {
        String query = "SELECT COUNT(*) AS count FROM Offer";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt("count");
            }
        } 
        return 0;
    }

}
