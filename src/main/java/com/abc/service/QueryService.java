package com.abc.service;

import java.sql.SQLException;
import java.util.List;
import com.abc.dao.QueryDAO;
import com.abc.model.Query;

public class QueryService {

    private static QueryService instance;
    private QueryDAO queryDAO;

    private QueryService() {
        this.queryDAO = new QueryDAO();
    }

    public static QueryService getInstance() {
        if (instance == null) {
            synchronized (QueryService.class) {
                if (instance == null) {
                    instance = new QueryService();
                }
            }
        }
        return instance;
    }

    public void addQuery(Query query) {
        queryDAO.addQuery(query);
    }

    public List<Query> getAllQueries() {
        return queryDAO.getAllQueries();
    }

    public void deleteQuery(int queryId) {
        queryDAO.deleteQuery(queryId);
    }
    
    public int getQueryCount() throws SQLException {
        return queryDAO.getQueryCount();
    }
}
