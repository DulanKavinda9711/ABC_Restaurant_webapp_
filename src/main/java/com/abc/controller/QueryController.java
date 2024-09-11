package com.abc.controller;

import com.abc.model.Query;
import com.abc.service.QueryService;
import com.abc.util.EmailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/query")
public class QueryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QueryService queryService;

    public void init() throws ServletException {
        queryService = QueryService.getInstance();
    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            listQueries(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("delete")) {
            deleteQuery(request, response);
        } else if (action.equals("reply")) {
            showReplyForm(request, response); 
        }
    }

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("add")) {
            addQuery(request, response);
        } else if (action.equals("sendReply")) {
            sendReply(request, response);
        }
    }

    
    private void listQueries(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("queries", queryService.getAllQueries());
        request.getRequestDispatcher("WEB-INF/view/listQueries.jsp").forward(request, response);
    }

   
    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addQuery.jsp").forward(request, response);
    }

   
    private void addQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Query query = new Query();
        query.setName(name);
        query.setEmail(email);
        query.setSubject(subject);
        query.setMessage(message);
        query.setState("Pending");

        try {
            queryService.addQuery(query);
            
            response.sendRedirect("index?success=true&message=Your query has been successfully submitted!");
        } catch (Exception e) {
            
            response.sendRedirect("index?error=true&message=There was an error submitting your query. Please try again later.");
        }
    }

    
    private void deleteQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int queryId = Integer.parseInt(request.getParameter("id"));
        queryService.deleteQuery(queryId);
        response.sendRedirect("admin");
    }

    
    private void sendReply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int queryId = Integer.parseInt(request.getParameter("id"));
        String replyMessage = request.getParameter("replyMessage");

        
        Query query = queryService.getQueryById(queryId);
        if (query != null) {
            
            EmailUtil.sendReplyEmail(query.getEmail(), query.getName(), query.getSubject(), query.getMessage(), replyMessage);

            query.setState("Replied");
            queryService.updateQuery(query);
            
            
            request.getSession().setAttribute("message", "Send Reply Successfully");
            response.sendRedirect("admin?action=dashboard");
        } else {
            response.sendRedirect("query?action=list&error=true&message=Error sending reply. Query not found.");
        }
    }

   
    private void showReplyForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int queryId = Integer.parseInt(request.getParameter("id"));
        Query query = queryService.getQueryById(queryId);

        if (query != null) {
            request.setAttribute("query", query); 
            request.getRequestDispatcher("WEB-INF/view/replyQuery.jsp").forward(request, response);
        } else {
            response.sendRedirect("query?action=list&error=true&message=Query not found.");
        }
    }
}
