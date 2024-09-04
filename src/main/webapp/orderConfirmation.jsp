<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation | ABC Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <style>
        /* General Body Styling */
        body {
            padding-top: 56px;
            background-color: #121212; /* Dark black background */
            color: #f8f9fa; /* Light text color */
            font-family: 'Poppins', sans-serif; /* Use Poppins font */
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Align items at the start of the container */
            height: 100vh;
            margin: 0;
        }

        /* Header Styling */
        .header {
            background-color: #000; /* Solid black header */
            padding: 15px;
            text-align: center;
            font-size: 26px;
            color: #ffffff; /* White color for text */
            font-weight: 500; /* Medium weight for better readability */
            letter-spacing: 1px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            font-family: 'Poppins', sans-serif; /* Apply Poppins font to header */
        }

        /* Container Styling */
        .container {
            max-width: 700px;
            background-color: #1f1f1f; /* Slightly lighter black for contrast */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.6);
            margin-top: 60px; /* Reduced margin-top to lift the form up */
        }

        /* Button Styling */
        .btn-primary, .btn-secondary {
            background-color: #d4a05a; /* Updated button color */
            border: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover, .btn-secondary:hover {
            background-color: #bb8b50; /* Darker shade of yellow on hover */
        }

        .text-center.mt-4 {
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        ABC RESTAURANT
    </div>

    <!-- Confirmation Container -->
    <div class="container mt-5">
        <h1 class="text-center">Order Confirmation</h1>
        <p class="text-center">Thank you for your order, <strong>${sessionScope.customer.name}!</strong></p>
        <p class="text-center">Your order has been successfully placed.</p>
        <div class="text-center mt-4">
            <a href="index" class="btn btn-secondary w-100 mb-3">Return to Home</a>
            <!-- Button to Print the Bill -->
            <button class="btn btn-primary w-100" onclick="window.location.href='order?action=generateBill'">Print Your Bill</button>

        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <!-- JavaScript Function for Printing the Bill -->
    
</body>
</html>
