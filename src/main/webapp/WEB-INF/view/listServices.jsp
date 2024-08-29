<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Service List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin-top: 20px;
        }
        .service-image {
            width: 80px;
            height: auto;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Service List</h1>
        <table class="table table-hover table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="service" items="${services}">
                    <tr>
                        <td>${service.serviceId}</td>
                        <td>${service.serviceName}</td>
                        <td><img src="${service.image}" class="service-image" alt="Service Image"></td>
                        <td>${service.description}</td>
                        <td>
                            <a href="service?action=edit&id=${service.serviceId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="service?action=delete&id=${service.serviceId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this service?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
       
    </div>
</body>
</html>
