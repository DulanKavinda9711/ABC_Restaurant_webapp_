<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - ABC Restaurant</title>
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
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar a:hover {
            background-color: #495057;
            color: #f8f9fa;
        }

        .sidebar .dropdown-menu {
            background-color: #ffffff; /* Background color of the dropdown menu */
            border: none;
            box-shadow: none;
        }

        .sidebar .dropdown-item {
            color: #343a40; /* Text color of dropdown items */
            padding-left: 30px;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar .dropdown-item:hover {
            background-color: #f1f1f1; /* Light background color on hover */
            color: #343a40; /* Ensure text color remains the same on hover */
        }

        .sidebar .dropdown-toggle::after {
            content: '\f078';
            font-family: 'FontAwesome';
            position: absolute;
            right: 10px;
            top: 10px;
        }

        .sidebar .accordion-button {
            background-color: transparent;
            color: #ffffff;
            padding: 0.75rem 1.25rem;
        }

        .sidebar .accordion-button:not(.collapsed) {
            background-color: #495057;
        }

        .sidebar .accordion-item {
            border: none;
        }

        .sidebar .accordion-body {
            padding-left: 2rem;
            background-color: #343a40;
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
    <div class="sidebar" style="height: 100vh; overflow-y: auto; background-color: #1f1f1f; padding-top: 20px; position: fixed; width: 250px; top: 0; left: 0; z-index: 1000;">
        
        <h4 class="text-center text-white">Dashboard  </h4>
    
        <!-- Display the role from session -->
        <h4 class="text-center text-white">
            Role: 
            <% 
                String role = (String) session.getAttribute("role");
                if (role != null) {
                    out.print(role);
                } else {
                    out.print("Unknown");
                }
            %>
        </h4>
        
        <a href="admin?action=dashboard">Dashboard</a>
        
        <!-- Conditional content based on role -->
        <c:choose>
            <c:when test="${role == 'staff'}">
                 <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40;">
            <h2 class="accordion-header" id="headingProducts">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseProducts" aria-expanded="false" aria-controls="collapseProducts" style="background-color: #343a40; color: #f8f9fa;">
                    Products
                </button>
            </h2>
            <div id="collapseProducts" class="accordion-collapse collapse" aria-labelledby="headingProducts" data-bs-parent="#accordionSidebar">
                <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                    <a href="javascript:void(0);" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;" onclick="loadContent('product?action=add');">Insert Product</a>
                    <a href="javascript:void(0);" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;" onclick="loadContent('admin?action=listProducts');">View Products</a>
                </div>
            </div>
        </div>
                <a href="javascript:void(0);" onclick="loadContent('admin?action=listCustomers');" style="color: #f8f9fa; background-color: #343a40; padding: 10px 15px; display: block; margin-bottom: 5px;">View Customers</a>
                <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40;">
            <h2 class="accordion-header" id="headingReservations">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseReservations" aria-expanded="false" aria-controls="collapseReservations" style="background-color: #343a40; color: #f8f9fa;">
                    Reservation
                </button>
            </h2>
            <div id="collapseReservations" class="accordion-collapse collapse" aria-labelledby="headingReservations" data-bs-parent="#accordionSidebar">
                <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                    <a href="javascript:void(0);" onclick="loadContent('admin?action=listReservations');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">View Reservation</a>
                    <a href="admin?action=generateReservationsPDF" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">Download Reservations as PDF</a>
                </div>
            </div>
        </div>
                <a href="javascript:void(0);" onclick="loadContent('admin?action=listQueries');" style="color: #f8f9fa; background-color: #343a40; padding: 10px 15px; display: block; margin-bottom: 5px;">View Queries</a>
            </c:when>
            <c:otherwise>
                <!-- Admin-specific content -->
                 <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40;">
            <h2 class="accordion-header" id="headingProducts">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseProducts" aria-expanded="false" aria-controls="collapseProducts" style="background-color: #343a40; color: #f8f9fa;">
                    Products
                </button>
            </h2>
            <div id="collapseProducts" class="accordion-collapse collapse" aria-labelledby="headingProducts" data-bs-parent="#accordionSidebar">
                <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                    <a href="javascript:void(0);" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;" onclick="loadContent('product?action=add');">Insert Product</a>
                    <a href="javascript:void(0);" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;" onclick="loadContent('admin?action=listProducts');">View Products</a>
                </div>
            </div>
        </div>
                <a href="javascript:void(0);" onclick="loadContent('admin?action=listCustomers');" style="color: #f8f9fa; background-color: #343a40; padding: 10px 15px; display: block; margin-bottom: 5px;">View Customers</a>
                <a href="javascript:void(0);" onclick="loadContent('admin?action=listStaff');" style="color: #f8f9fa; background-color: #343a40; padding: 10px 15px; display: block; margin-bottom: 5px;">View Staff</a>
                <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40;">
            <h2 class="accordion-header" id="headingReservations">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseReservations" aria-expanded="false" aria-controls="collapseReservations" style="background-color: #343a40; color: #f8f9fa;">
                    Reservation
                </button>
            </h2>
            <div id="collapseReservations" class="accordion-collapse collapse" aria-labelledby="headingReservations" data-bs-parent="#accordionSidebar">
                <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                    <a href="javascript:void(0);" onclick="loadContent('admin?action=listReservations');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">View Reservation</a>
                    <a href="admin?action=generateReservationsPDF" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">Download Reservations as PDF</a>
                </div>
            </div>
        </div>
        <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40;">
            <h2 class="accordion-header" id="headingOffers">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOffers" aria-expanded="false" aria-controls="collapseOffers" style="background-color: #343a40; color: #f8f9fa;">
                    Offer
                </button>
            </h2>
            <div id="collapseOffers" class="accordion-collapse collapse" aria-labelledby="headingOffers" data-bs-parent="#accordionSidebar">
                <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                    <a href="javascript:void(0);" onclick="loadContent('offer?action=add');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">Add Offer</a>
                    <a href="javascript:void(0);" onclick="loadContent('offer?action=list');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">View Offers</a>
                </div>
            </div>
        </div>
                <a href="javascript:void(0);" onclick="loadContent('admin?action=listQueries');" style="color: #f8f9fa; background-color: #343a40; padding: 10px 15px; display: block; margin-bottom: 5px;">View Queries</a>
                <a href="javascript:void(0);" onclick="loadContent('admin?action=listOrders');" style="color: #f8f9fa; background-color: #343a40; padding: 10px 15px; display: block; margin-bottom: 5px;">View Orders</a>
                <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40;">
            <h2 class="accordion-header" id="headingGallery">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGallery" aria-expanded="false" aria-controls="collapseGallery" style="background-color: #343a40; color: #f8f9fa;">
                    Gallery
                </button>
            </h2>
            <div id="collapseGallery" class="accordion-collapse collapse" aria-labelledby="headingGallery" data-bs-parent="#accordionSidebar">
                <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                    <a href="javascript:void(0);" onclick="loadContent('gallery?action=add');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">Add New Image</a>
                    <a href="javascript:void(0);" onclick="loadContent('gallery?action=list');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">View Gallery</a>
                </div>
            </div>
        </div>

        <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40;">
            <h2 class="accordion-header" id="headingServices">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseServices" aria-expanded="false" aria-controls="collapseServices" style="background-color: #343a40; color: #f8f9fa;">
                    Service
                </button>
            </h2>
            <div id="collapseServices" class="accordion-collapse collapse" aria-labelledby="headingServices" data-bs-parent="#accordionSidebar">
                <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                    <a href="javascript:void(0);" onclick="loadContent('service?action=add');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">Add Service</a>
                    <a href="javascript:void(0);" onclick="loadContent('admin?action=listServices');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">View Services</a>
                </div>
            </div>
        </div>
                <!-- Other admin-specific links can go here -->
            </c:otherwise>
        </c:choose>
        
        <a href="adminLogin.jsp" style="color: #f8f9fa; background-color: #343a40; padding: 10px 15px; display: block; margin-top: 10px;">Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="admin?action=dashboard">Dashboard</a>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Dashboard Cards -->
        <div class="container mt-5">
            <div id="dynamic-content" class="col-12">
                <div class="row">
                    <!-- Conditional content based on role -->
                    <c:choose>
                        <c:when test="${role == 'staff'}">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Products</h5>
                                        <p class="card-text">View, add, edit, or delete products.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listProducts');">Go to Products</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Customers</h5>
                                        <p class="card-text">View, add, edit, or delete customers.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listCustomers');">Go to Customers</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Reservations</h5>
                                        <p class="card-text">View, accept, reject, or delete reservations.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listReservations');">Go to Reservations</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Queries</h5>
                                        <p class="card-text">View, accept, reject queries.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listQueries');">Go to Queries</a>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Admin-specific content -->
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Products</h5>
                                        <p class="card-text">View, add, edit, or delete products.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listProducts');">Go to Products</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Customers</h5>
                                        <p class="card-text">View, add, edit, or delete customers.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listCustomers');">Go to Customers</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Staff</h5>
                                        <p class="card-text">View, add, edit, or delete staff members.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listStaff');">Go to Staff</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Reservations</h5>
                                        <p class="card-text">View, accept, reject, or delete reservations.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listReservations');">Go to Reservations</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Queries</h5>
                                        <p class="card-text">View, accept, reject queries.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listQueries');">Go to Queries</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Orders</h5>
                                        <p class="card-text">View orders.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listOrders');">Go to Orders</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Services</h5>
                                        <p class="card-text">View services.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listServices');">Go to Services</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Offers</h5>
                                        <p class="card-text">View Offers.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listOffers');">Go to Offers</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">List Gallery</h5>
                                        <p class="card-text">View Gallery.</p>
                                        <a href="javascript:void(0);" class="btn btn-primary" onclick="loadContent('admin?action=listGalleries');">Go to Gallery</a>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <script>
        function loadContent(url) {
            const dynamicContentDiv = document.getElementById('dynamic-content');
            dynamicContentDiv.innerHTML = '<div class="text-center mt-4"><div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div></div>';
            const xhr = new XMLHttpRequest();
            xhr.open('GET', url, true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    dynamicContentDiv.innerHTML = xhr.responseText;
                } else {
                    dynamicContentDiv.innerHTML = '<div class="alert alert-danger">Failed to load content.</div>';
                }
            };
            xhr.send();
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
