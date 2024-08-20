package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Query;

public class QueryDAO {

    public void addQuery(Query query) {
        String queryStatement = "INSERT INTO Query (name, email, subject, message) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(queryStatement)) {
            statement.setString(1, query.getName());
            statement.setString(2, query.getEmail());
            statement.setString(3, query.getSubject());
            statement.setString(4, query.getMessage());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Query> getAllQueries() {
        List<Query> queries = new ArrayList<>();
        String queryStatement = "SELECT * FROM Query";

        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(queryStatement)) {
            while (resultSet.next()) {
                int id = resultSet.getInt("query_id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String subject = resultSet.getString("subject");
                String message = resultSet.getString("message");
                queries.add(new Query(id, name, email, subject, message));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return queries;
    }

    public void deleteQuery(int queryId) {
        String queryStatement = "DELETE FROM Query WHERE query_id = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(queryStatement)) {
            statement.setInt(1, queryId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
