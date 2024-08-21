<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - ABC Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            padding-top: 56px;
            background-color: #f8f9fa;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .card-title {
            font-size: 1.25rem;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #343a40;
            color: #ffffff;
            padding-top: 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            z-index: 1000;
        }
        .sidebar a {
            color: #ffffff;
            text-decoration: none;
            display: block;
            padding: 10px 15px;
        }
        .sidebar a:hover {
            background-color: #495057;
            color: #ffffff;
        }
        .main-content {
            margin-left: 250px; /* Matches the sidebar width */
            padding: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .navbar-text {
            color: #ffffff;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center text-white">Admin Area</h4>
        <a href="admin?action=dashboard">Dashboard</a>
        <div class="dropdown">
            <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">Products</a>
            <ul class="dropdown-menu">
                <li><a href="product?action=add" class="dropdown-item">Insert Product</a></li>
                <li><a href="admin?action=listProducts" class="dropdown-item">View Products</a></li>
            </ul>
        </div>
        <a href="admin?action=listCustomers">View Customers</a>
        <a href="admin?action=listStaff">View Staff</a>
        <a href="admin?action=listReservations">View Reservations</a>
        <a href="admin?action=listOrders">View Orders</a>
        <a href="admin?action=listQueries">View Messages</a>
        <a href="adminLogin.jsp">Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="admin?action=dashboard">Admin Dashboard</a>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <span class="navbar-text">Welcome, Admin!</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Dashboard Cards -->
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">List Products</h5>
                            <p class="card-text">View, add, edit, or delete products.</p>
                            <a href="admin?action=listProducts" class="btn btn-primary">Go to Products</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">List Customers</h5>
                            <p class="card-text">View, add, edit, or delete customers.</p>
                            <a href="admin?action=listCustomers" class="btn btn-info">Go to Customers</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">List Staff</h5>
                            <p class="card-text">View, add, edit, or delete staff members.</p>
                            <a href="admin?action=listStaff" class="btn btn-secondary">Go to Staff</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">List Reservations</h5>
                            <p class="card-text">View, accept, reject, or delete reservations.</p>
                            <a href="admin?action=listReservations" class="btn btn-secondary">Go to Reservations</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">List Queries</h5>
                            <p class="card-text">View, accept, reject queries.</p>
                            <a href="admin?action=listQueries" class="btn btn-secondary">Go to Queries</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">List Orders</h5>
                            <p class="card-text">View orders.</p>
                            <a href="admin?action=listOrders" class="btn btn-secondary">Go to Orders</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
