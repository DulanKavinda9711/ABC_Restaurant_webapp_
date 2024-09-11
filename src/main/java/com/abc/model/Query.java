package com.abc.model;

public class Query {
    private int queryId;
    private String name;
    private String email;
    private String subject;
    private String message;
    private String state; 

    public Query() {}

    public Query(int queryId, String name, String email, String subject, String message, String state) {
        this.queryId = queryId;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.state = state;
    }

    
    public int getQueryId() {
        return queryId;
    }

    public void setQueryId(int queryId) {
        this.queryId = queryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
