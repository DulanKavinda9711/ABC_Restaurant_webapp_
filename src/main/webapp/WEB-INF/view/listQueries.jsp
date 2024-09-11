<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Queries</title>
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
        .btn-warning {
            margin-left: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Query List</h1>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr class="table-dark">
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>State</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="query" items="${queries}">
                    <tr>
                        <td>${query.queryId}</td>
                        <td>${query.name}</td>
                        <td>${query.email}</td>
                        <td>${query.subject}</td>
                        <td>${query.message}</td>
                        <td>${query.state}</td>
                        <td>
                            <!-- Reply button sends the query ID to the controller -->
                            <a href="query?action=reply&id=${query.queryId}" class="btn btn-warning">Reply</a>
                            <a href="query?action=delete&id=${query.queryId}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let tableBody = document.getElementById("queryTableBody");
            let rows = Array.from(tableBody.rows);

            rows.sort((rowA, rowB) => {
                let idA = parseInt(rowA.cells[0].textContent);
                let idB = parseInt(rowB.cells[0].textContent);
                return idB - idA; 
            });

            rows.forEach(row => tableBody.appendChild(row)); 
        });
    </script>
</body>
</html>
