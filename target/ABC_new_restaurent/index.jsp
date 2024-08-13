<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ABC Restaurant - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        body {
            padding-top: 56px;
        }
        .jumbotron {
            padding: 4rem 2rem;
            background-color: #f8f9fa;
            border-radius: 0.5rem;
            text-align: center;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .card-title {
            font-size: 1.25rem;
        }
        .card-text {
            font-size: 1rem;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">ABC Restaurant</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="customer?action=register">Customer Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="staff?action=register">Staff Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewServices.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewGallery.jsp">Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="submitQuery.jsp">Contact Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="jumbotron mt-5">
            <h1 class="display-4">Welcome to ABC Restaurant</h1>
            <p class="lead">Experience the finest dining with our exquisite services. Whether you are here to dine in or to place an order for delivery, we have something special for everyone.</p>
            <hr class="my-4">
            <p>Sign in to start managing your orders, reservations, and more.</p>
            <a class="btn btn-primary btn-lg" href="customer?action=login" role="button">Customer Login</a>
            <a class="btn btn-success btn-lg" href="customer?action=register" role="button">Customer Register</a>
            <a class="btn btn-secondary btn-lg" href="staff?action=login" role="button">Staff Login</a>
            <a class="btn btn-warning btn-lg" href="staff?action=register" role="button">Staff Register</a>
        </div>

        <!-- Features Section -->
        <div class="row mt-5">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Explore Our Services</h5>
                        <p class="card-text">Discover our range of services, from dining to delivery, and make a reservation online.</p>
                        <a href="viewServices.jsp" class="btn btn-primary">View Services</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Check Our Gallery</h5>
                        <p class="card-text">Take a virtual tour of our restaurant and explore the ambiance before your visit.</p>
                        <a href="viewGallery.jsp" class="btn btn-info">View Gallery</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Get in Touch</h5>
                        <p class="card-text">Have questions? Reach out to us, and we’ll get back to you as soon as possible.</p>
                        <a href="submitQuery.jsp" class="btn btn-secondary">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center mt-5 py-4 bg-light">
        <p>&copy; 2024 ABC Restaurant. All rights reserved. | <a href="privacyPolicy.jsp">Privacy Policy</a></p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>
</html>
