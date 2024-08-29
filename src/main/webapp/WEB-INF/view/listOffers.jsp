<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Offer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin-top: 20px;
        }
        .offer-image {
            width: 80px;
            height: auto;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Offer List</h1>
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
                <c:forEach var="offer" items="${offers}">
                    <tr>
                        <td>${offer.offerId}</td>
                        <td>${offer.name}</td>
                        <td><img src="${offer.image}" class="offer-image" alt="Offer Image"></td>
                        <td>${offer.description}</td>
                        <td>
                            <a href="offer?action=edit&id=${offer.offerId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="offer?action=delete&id=${offer.offerId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this offer?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
       
    </div>
</body>
</html>
