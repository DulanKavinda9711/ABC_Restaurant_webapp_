<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Reservations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin: auto;
            width: 80%;
        }
        .btn-danger {
            margin-left: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Reservation List</h1>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr class="table-dark">
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>No. of People</th>
                    <th>Message</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reservation" items="${reservations}">
                    <tr>
                        <td>${reservation.reservationId}</td>
                        <td>${reservation.name}</td>
                        <td>${reservation.email}</td>
                        <td>${reservation.phone}</td>
                        <td>${reservation.date}</td>
                        <td>${reservation.time}</td>
                        <td>${reservation.people}</td>
                        <td>${reservation.message}</td>
                        <td>${reservation.status}</td>
                        <td>
                            <a href="reservation?action=accept&id=${reservation.reservationId}" class="btn btn-success">Accept</a>
                            <a href="reservation?action=reject&id=${reservation.reservationId}" class="btn btn-warning">Reject</a>
                            <a href="reservation?action=delete&id=${reservation.reservationId}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
