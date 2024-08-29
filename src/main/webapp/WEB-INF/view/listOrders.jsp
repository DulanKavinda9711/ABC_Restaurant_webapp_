<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Order List</h1>
        <table class="table table-hover table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Order Time</th>
                    <th>Order Summary</th>
                    <th>Customer Address</th>
                    <th>Total Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.customerName}</td>
                        <td>${order.orderTime}</td>
                        <td>${order.orderSummary}</td>
                        <td>${order.customerAddress}</td>
                        <td class="text-right">${order.totalPrice}</td>
                        <td>
                            <a href="order?action=delete&id=${order.orderId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this order?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

    <!-- JavaScript to Sort and Display Rows Based on Date -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let table = document.querySelector("table tbody");
            let rows = Array.from(table.rows);

            rows.sort((rowA, rowB) => {
                let dateA = new Date(rowA.cells[2].textContent); // Assuming cell[2] contains the order date
                let dateB = new Date(rowB.cells[2].textContent);
                return dateB - dateA; // Sorting in descending order (newest first)
            });

            rows.forEach(row => table.appendChild(row)); // Reorder the rows in the table
        });
    </script>
</body>
</html>
