<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reply to Query</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 10px;
            max-width: 600px;
            padding: 20px; /* Added padding for better spacing */
            background-color: #d6dadf; /* Light background color */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 0px 0px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }
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
            <div class="accordion-item" style="background-color: #1f1f1f; border-color: #343a40; margin-bottom: 5px;">
                <h2 class="accordion-header" id="headingOrders">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOrders" aria-expanded="false" aria-controls="collapseOrders" style="background-color: #1f1f1f; color: #f8f9fa;">
                        <i class="fas fa-box-open"></i> Order
                    </button>
                </h2>
                <div id="collapseOrders" class="accordion-collapse collapse" aria-labelledby="headingOrders" data-bs-parent="#accordionSidebar">
					    <div class="accordion-body" style="background-color: #1f1f1f; padding: 10px;">
					        <a href="javascript:void(0);" onclick="loadContent('admin?action=listOrders');" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px; margin-bottom: 5px;">
					            <i class="fas fa-box-open"></i> View Orders
					        </a>
					        <a href="admin?action=generateOrderReportPDF" class="dropdown-item" style="color: #f8f9fa; background-color: #343a40; border-radius: 4px;">
					            <i class="fas fa-file-pdf"></i> Daily Sales Report
					        </a>
					    </div>
					</div>
            </div>
            
            <a href="javascript:void(0);" onclick="loadContent('admin?action=listQueries');" style="color: #f8f9fa; background-color: #1f1f1f; padding: 10px 15px; display: block; margin-bottom: 5px;">
                <i class="fas fa-question-circle"></i> View Queries
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
        </div>
    
    <div class="container">
        <h1 class="text-center">Reply to Query</h1>
        <form action="query?action=sendReply&id=${query.queryId}" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${query.name}" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${query.email}" readonly>
            </div>
            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" class="form-control" id="subject" name="subject" value="${query.subject}" readonly>
            </div>
            <div class="form-group">
                <label for="message">Original Message</label>
                <textarea class="form-control" id="message" name="message" rows="3" readonly>${query.message}</textarea>
            </div>
            <div class="form-group">
                <label for="replyMessage">Reply Message</label>
                <textarea class="form-control" id="replyMessage" name="replyMessage" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Send Reply</button>
        </form>
    </div>
</body>
</html>
