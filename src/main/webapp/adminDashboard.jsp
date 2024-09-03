<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - ABC Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
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
            background-color:#f8f9fa ;
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
            display: flex;
            padding: 10px 15px;
            align-items: center;
            transition: background-color 0.3s, color 0.3s;
        }
        
		 .sidebar a i {
		    margin-right: 10px; /* Add space between the icon and the text */
		}
		
		.sidebar .accordion-button {
		    display: flex;
		    align-items: center;
		    padding: 10px 15px;
		}
		
		.sidebar .accordion-button i {
		    margin-right: 10px;
		}

        .sidebar a:hover {
		    background-color: #495057 !important; /* Ensure this color is applied */
		    color: #f8f9fa !important; /* Ensure the text color changes */
		}
        

        .sidebar .dropdown-menu {
		    background-color: #1f1f1f !important; /* Ensure dropdown menu background */
		    border: none !important;
		    box-shadow: none !important;
		}
		
		.sidebar .dropdown-menu :hover {
		    background-color: #495057 !important; /* Ensure this color is applied */
		    color: #f8f9fa !important;
		}

        .sidebar .dropdown-item {
            color: #343a40; /* Text color of dropdown items */
            padding-left: 30px;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar .dropdown-item:hover {
		    background-color: #495057 !important; /* Apply hover effect */
		    color: #f8f9fa !important; /* Change text color on hover */
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
            background-color: #343a40;
        }

        .sidebar .accordion-item {
            border: none;
        }

        .sidebar .accordion-body {
            padding-left: 2rem;
            background-color: #495057;
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
        .sidebar .dropdown-toggle::after,
		.sidebar .accordion-button::after {
	    content: '\f078'; /* FontAwesome code for arrow */
	    font-family: 'FontAwesome';
	    color: #ffffff; /* White color for the arrow */
	    position: absolute;
	    right: 10px;
	    top: 10px;
		}
		
		.sidebar .accordion-button.collapsed::after {
		    content: '\f078'; /* Code for right-pointing arrow when collapsed */
		    transform: rotate(0deg); /* Rotate the arrow to point right */
		}
		
		.sidebar .accordion-button:not(.collapsed)::after {
		    content: '\f077'; /* Code for down-pointing arrow when expanded */
		}
		
		.btn-red {
		    background-color: #dc3545;
		    border-color: #dc3545;
		}
		
		.card-red {
		    background-color: #f8d7da;
		    border-color: #f5c6cb;
		}
		
		.btn-blue {
		    background-color: #007bff;
		    border-color: #007bff;
		}
		
		.card-blue {
		    background-color: #d1ecf1;
		    border-color: #bee5eb;
		}
		
		.btn-green {
		    background-color: #28a745;
		    border-color: #28a745;
		}
		
		.card-green {
		    background-color: #d4edda;
		    border-color: #c3e6cb;
		}
		
		.btn-orange {
		    background-color: #fd7e14;
		    border-color: #fd7e14;
		}
		
		.card-orange {
		    background-color: #ffe8cc;
		    border-color: #ffdfb8;
		}
		
		.btn-purple {
		    background-color: #6f42c1;
		    border-color: #6f42c1;
		}
		
		.card-purple {
		    background-color: #e2d5f3;
		    border-color: #d7c1f7;
		}
		
		.btn-teal {
		    background-color: #20c997;
		    border-color: #20c997;
		}
		
		.card-teal {
		    background-color: #c3e6e3;
		    border-color: #c1e7e7;
		}
		
		        
    </style>
</head>
<body>

<% 
    String message = (String) session.getAttribute("message");
    if (message != null) { 
%>
    <div class="alert alert-success alert-dismissible fade show" role="alert" style="position: fixed; top: 60px; right: 20px; z-index: 1050;">
        <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% 
    session.removeAttribute("message");
    } 
%>

    <!-- Sidebar -->
<div class="sidebar" style="height: 100vh; overflow-y: auto; background-color: #1f1f1f; padding-top: 20px; position: fixed; width: 250px; top: 0; left: 0; z-index: 1000;">
    
    <h4 class="text-center text-white">Dashboard</h4>
    
    <a href="admin?action=dashboard">
        <i class="fas fa-tachometer-alt"></i> Dashboard
    </a>
    
    <!-- Conditional content based on role -->
    <c:choose>
        <c:when test="${role == 'staff'}">
            <div class="accordion-item" style="background-color: #1f1f1f; border-color: #1f1f1f; margin-bottom: 5px;">
                <h2 class="accordion-header" id="headingProducts">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseProducts" aria-expanded="false" aria-controls="collapseProducts" style="background-color:#1f1f1f; color: #f8f9fa;">
                        <i class="fas fa-box"></i> 
                        <span>Products</span>
                    </button>
                </h2>
                <div id="collapseProducts" class="accordion-collapse collapse" aria-labelledby="headingProducts" data-bs-parent="#accordionSidebar">
                    <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                        <a href="javascript:void(0);" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;" onclick="loadContent('product?action=add');">
                            <i class="fas fa-plus-circle"></i> Insert Product
                        </a>
                        <a href="javascript:void(0);" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;" onclick="loadContent('admin?action=listProducts');">
                            <i class="fas fa-list"></i> View Products
                        </a>
                    </div>
                </div>
            </div>
            <a href="javascript:void(0);" onclick="loadContent('admin?action=listCustomers');" style="color: #f8f9fa; background-color: #1f1f1f; padding: 10px 15px; display: block; margin-bottom: 5px;">
                <i class="fas fa-users"></i> View Customers
            </a>
            <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40; margin-bottom: 5px;">
                <h2 class="accordion-header" id="headingReservations">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseReservations" aria-expanded="false" aria-controls="collapseReservations" style="background-color: #1f1f1f; color: #f8f9fa;">
                        <i class="fas fa-calendar-alt"></i> Reservation
                    </button>
                </h2>
                <div id="collapseReservations" class="accordion-collapse collapse" aria-labelledby="headingReservations" data-bs-parent="#accordionSidebar">
                    <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                        <a href="javascript:void(0);" onclick="loadContent('admin?action=listReservations');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">
                            <i class="fas fa-list"></i> View Reservation
                        </a>
                        <a href="admin?action=generateReservationsPDF" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">
                            <i class="fas fa-file-pdf"></i> Reservations as PDF
                        </a>
                    </div>
                </div>
            </div>
            
        </c:when>
        <c:otherwise>
            <!-- Admin-specific content -->
            <div class="accordion-item" style="background-color: #1f1f1f; border-color: #1f1f1f; margin-bottom: 5px;">
                <h2 class="accordion-header" id="headingProducts">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseProducts" aria-expanded="false" aria-controls="collapseProducts" style="background-color:#1f1f1f; color: #f8f9fa;">
                        <i class="fas fa-box"></i> 
                        <span>Products</span>
                    </button>
                </h2>
                <div id="collapseProducts" class="accordion-collapse collapse" aria-labelledby="headingProducts" data-bs-parent="#accordionSidebar">
                    <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                        <a href="javascript:void(0);" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;" onclick="loadContent('product?action=add');">
                            <i class="fas fa-plus-circle"></i> Insert Product
                        </a>
                        <a href="javascript:void(0);" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;" onclick="loadContent('admin?action=listProducts');">
                            <i class="fas fa-list"></i> View Products
                        </a>
                    </div>
                </div>
            </div>
            <a href="javascript:void(0);" onclick="loadContent('admin?action=listCustomers');" style="color: #f8f9fa; background-color: #1f1f1f; padding: 10px 15px; display: block; margin-bottom: 5px;">
                <i class="fas fa-users"></i> View Customers
            </a>
            <a href="javascript:void(0);" onclick="loadContent('admin?action=listStaff');" style="color: #f8f9fa; background-color: #1f1f1f; padding: 10px 15px; display: block; margin-bottom: 5px;">
                <i class="fas fa-user-tie"></i> View Staff
            </a>
            <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40; margin-bottom: 5px;">
                <h2 class="accordion-header" id="headingReservations">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseReservations" aria-expanded="false" aria-controls="collapseReservations" style="background-color: #1f1f1f; color: #f8f9fa;">
                        <i class="fas fa-calendar-alt"></i> Reservation
                    </button>
                </h2>
                <div id="collapseReservations" class="accordion-collapse collapse" aria-labelledby="headingReservations" data-bs-parent="#accordionSidebar">
                    <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                        <a href="javascript:void(0);" onclick="loadContent('admin?action=listReservations');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">
                            <i class="fas fa-list"></i> View Reservation
                        </a>
                        <a href="admin?action=generateReservationsPDF" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">
                            <i class="fas fa-file-pdf"></i> Reservations as PDF
                        </a>
                    </div>
                </div>
            </div>
            <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40; margin-bottom: 5px;">
                <h2 class="accordion-header" id="headingOffers">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOffers" aria-expanded="false" aria-controls="collapseOffers" style="background-color: #1f1f1f; color: #f8f9fa;">
                        <i class="fas fa-tags"></i> Offer
                    </button>
                </h2>
                <div id="collapseOffers" class="accordion-collapse collapse" aria-labelledby="headingOffers" data-bs-parent="#accordionSidebar">
                    <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                        <a href="javascript:void(0);" onclick="loadContent('offer?action=add');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">
                            <i class="fas fa-plus-circle"></i> Add Offer
                        </a>
                        <a href="javascript:void(0);" onclick="loadContent('offer?action=list');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">
                            <i class="fas fa-list"></i> View Offers
                        </a>
                    </div>
                </div>
            </div>
            <a href="javascript:void(0);" onclick="loadContent('admin?action=listQueries');" style="color: #f8f9fa; background-color: #1f1f1f; padding: 10px 15px; display: block; margin-bottom: 5px;">
                <i class="fas fa-question-circle"></i> View Queries
            </a>
            <a href="javascript:void(0);" onclick="loadContent('admin?action=listOrders');" style="color: #f8f9fa; background-color: #1f1f1f; padding: 10px 15px; display: block; margin-bottom: 5px;">
                <i class="fas fa-box-open"></i> View Orders
            </a>
            <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40; margin-bottom: 5px;">
                <h2 class="accordion-header" id="headingGallery">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGallery" aria-expanded="false" aria-controls="collapseGallery" style="background-color: #1f1f1f; color: #f8f9fa;">
                        <i class="fas fa-images"></i> Gallery
                    </button>
                </h2>
                <div id="collapseGallery" class="accordion-collapse collapse" aria-labelledby="headingGallery" data-bs-parent="#accordionSidebar">
                    <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                        <a href="javascript:void(0);" onclick="loadContent('gallery?action=add');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">
                            <i class="fas fa-plus-circle"></i> Add New Image
                        </a>
                        <a href="javascript:void(0);" onclick="loadContent('gallery?action=list');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">
                            <i class="fas fa-list"></i> View Gallery
                        </a>
                    </div>
                </div>
            </div>

            <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40;">
                <h2 class="accordion-header" id="headingServices">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseServices" aria-expanded="false" aria-controls="collapseServices" style="background-color: #1f1f1f; color: #f8f9fa;">
                        <i class="fas fa-concierge-bell"></i> Service
                    </button>
                </h2>
                <div id="collapseServices" class="accordion-collapse collapse" aria-labelledby="headingServices" data-bs-parent="#accordionSidebar">
                    <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
                        <a href="javascript:void(0);" onclick="loadContent('service?action=add');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">
                            <i class="fas fa-plus-circle"></i> Add Service
                        </a>
                        <a href="javascript:void(0);" onclick="loadContent('admin?action=listServices');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">
                            <i class="fas fa-list"></i> View Services
                        </a>
                    </div>
                </div>
            </div>
            <!-- Other admin-specific links can go here -->
        </c:otherwise>
    </c:choose>
    
    <a href="adminLogin.jsp" style="color: #f8f9fa; background-color: #1f1f1f; padding: 10px 15px; display: block; margin-top: 5px;">
        <i class="fas fa-sign-out-alt"></i> Log Out
    </a>
</div>
    

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="admin?action=dashboard">  
                <%
				    String role = (String) session.getAttribute("role");
				    if (role != null) {
				        String capitalizedRole = role.substring(0, 1).toUpperCase() + role.substring(1).toLowerCase();
				        out.print(capitalizedRole);
				    } else {
				        out.print("Unknown");
				    }
				%>
 							Dashboard</a>
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
							    <div class="card card-red">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-box"></i> Products
							            </h5>
							            <p class="card-text">Total Products: <span id="productCount">Loading...</span></p>
							            <a href="javascript:void(0);" class="btn btn-red" onclick="loadContent('admin?action=listProducts');">Go to Products</a>
							        </div>
							    </div>
							</div>
                            <div class="col-md-4">
							    <div class="card card-blue">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-users"></i> Customers
							            </h5>
							            <p class="card-text">Total Customers: <span id="customerCount">Loading...</span></p> <!-- Placeholder for customer count -->
							            <a href="javascript:void(0);" class="btn btn-blue" onclick="loadContent('admin?action=listCustomers');">Go to Customers</a>
							        </div>
							    </div>
							</div>
                            <div class="col-md-4">
							    <div class="card card-orange">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-calendar-alt"></i> Reservations
							            </h5>
							            <p class="card-text">Total Reservation: <span id="reservationCount">Loading...</span></p> <!-- Placeholder for staff count -->
							            <a href="javascript:void(0);" class="btn btn-orange" onclick="loadContent('admin?action=listReservations');">Go to Reservations</a>
							        </div>
							    </div>
							</div>
                            <div class="col-md-4">
							    <div class="card card-purple">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-question-circle"></i> Queries
							            </h5>
							            <p class="card-text">Total Queries: <span id="queryCount">Loading...</span></p> <!-- Placeholder for query count -->
							            <a href="javascript:void(0);" class="btn btn-purple" onclick="loadContent('admin?action=listQueries');">Go to Queries</a>
							        </div>
							    </div>
							</div>
                        </c:when>
                        <c:otherwise>
                            <!-- Admin-specific content -->
                            <div class="col-md-4">
							    <div class="card card-red">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-box"></i> Products
							            </h5>
							            <p class="card-text">Total Products: <span id="productCount">Loading...</span></p>
							            <a href="javascript:void(0);" class="btn btn-red" onclick="loadContent('admin?action=listProducts');">Go to Products</a>
							        </div>
							    </div>
							</div>
														
							<div class="col-md-4">
							    <div class="card card-blue">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-users"></i> Customers
							            </h5>
							            <p class="card-text">Total Customers: <span id="customerCount">Loading...</span></p> <!-- Placeholder for customer count -->
							            <a href="javascript:void(0);" class="btn btn-blue" onclick="loadContent('admin?action=listCustomers');">Go to Customers</a>
							        </div>
							    </div>
							</div>
														
							<div class="col-md-4">
							    <div class="card card-green">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-user-tie"></i> Staff
							            </h5>
							            <p class="card-text">Total Staff: <span id="staffCount">Loading...</span></p> <!-- Placeholder for staff count -->
							            <a href="javascript:void(0);" class="btn btn-green" onclick="loadContent('admin?action=listStaff');">Go to Staff</a>
							        </div>
							    </div>
							</div>
							
							<div class="col-md-4">
							    <div class="card card-orange">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-calendar-alt"></i> Reservations
							            </h5>
							            <p class="card-text">Total Reservation: <span id="reservationCount">Loading...</span></p> <!-- Placeholder for staff count -->
							            <a href="javascript:void(0);" class="btn btn-orange" onclick="loadContent('admin?action=listReservations');">Go to Reservations</a>
							        </div>
							    </div>
							</div>
							
							<div class="col-md-4">
							    <div class="card card-purple">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-question-circle"></i> Queries
							            </h5>
							            <p class="card-text">Total Queries: <span id="queryCount">Loading...</span></p> <!-- Placeholder for query count -->
							            <a href="javascript:void(0);" class="btn btn-purple" onclick="loadContent('admin?action=listQueries');">Go to Queries</a>
							        </div>
							    </div>
							</div>
							
							
							<div class="col-md-4">
							    <div class="card card-teal">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-box-open"></i> Orders
							            </h5>
							            <p class="card-text">Total Orders: <span id="orderCount">Loading...</span></p> <!-- Placeholder for order count -->
							            <a href="javascript:void(0);" class="btn btn-teal" onclick="loadContent('admin?action=listOrders');">Go to Orders</a>
							        </div>
							    </div>
							</div>
							
							
							<div class="col-md-4">
							    <div class="card card-red">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-concierge-bell"></i> Services
							            </h5>
							            <p class="card-text">Total Services: <span id="serviceCount">Loading...</span></p> <!-- Placeholder for service count -->
							            <a href="javascript:void(0);" class="btn btn-red" onclick="loadContent('admin?action=listServices');">Go to Services</a>
							        </div>
							    </div>
							</div>
							
							<div class="col-md-4">
							    <div class="card card-blue">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-tags"></i> Offers
							            </h5>
							            <p class="card-text">Total Offers: <span id="offerCount">Loading...</span></p> <!-- Placeholder for offer count -->
							            <a href="javascript:void(0);" class="btn btn-blue" onclick="loadContent('admin?action=listOffers');">Go to Offers</a>
							        </div>
							    </div>
							</div>
							
							<div class="col-md-4">
							    <div class="card card-green">
							        <div class="card-body">
							            <h5 class="card-title">
							                <i class="fas fa-images"></i> Gallery
							            </h5>
							            <p class="card-text">Total Images: <span id="galleryCount">Loading...</span></p>
							            <a href="javascript:void(0);" class="btn btn-green" onclick="loadContent('admin?action=listGalleries');">Go to Gallery</a>
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
    
    
    <script>
        function searchProducts() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toLowerCase();
            table = document.getElementById("productTable");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none"; 
                td = tr[i].getElementsByTagName("td");
                for (var j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toLowerCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            break;
                        }
                    }
                }
            }
        }
    </script>
    
    <script>
    document.querySelectorAll('.accordion-button').forEach(button => {
        button.addEventListener('click', function () {
            this.querySelector('.accordion-button::after').classList.toggle('rotate-arrow');
        });
    });

    </script>
    
    <script>
document.addEventListener("DOMContentLoaded", function() {
    fetchAllCounts();
});

function fetchAllCounts() {
    Promise.all([
        fetchCount('admin?action=getProductCount', 'productCount'),
        fetchCount('admin?action=getCustomerCount', 'customerCount'),
        fetchCount('admin?action=getStaffCount', 'staffCount'),
        fetchCount('admin?action=getReservationCount', 'reservationCount'),
        fetchCount('admin?action=getQueryCount', 'queryCount'),
        fetchCount('admin?action=getServiceCount', 'serviceCount'),
        fetchCount('admin?action=getOrderCount', 'orderCount'),
        fetchCount('admin?action=getOfferCount', 'offerCount'),
        fetchCount('admin?action=getGalleryCount', 'galleryCount')
    ])
    .then(() => {
        console.log('All counts fetched successfully');
    })
    .catch(error => {
        console.error('Error fetching some counts:', error);
    });
}

function fetchCount(url, elementId) {
    return fetch(url)
        .then(response => response.json())
        .then(data => {
            if (data[elementId] !== undefined) {
                document.getElementById(elementId).textContent = data[elementId];
            } else {
                document.getElementById(elementId).textContent = "Error";
            }
        })
        .catch(error => {
            console.error(`Error fetching ${elementId}:`, error);
            document.getElementById(elementId).textContent = "Error";
        });
}
</script>
    



    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    
</body>
</html>
