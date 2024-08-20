<%@ page import="com.abc.model.CartItem, com.abc.model.Cart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart | ABC Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Include Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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

        /* Cart Table Styling */
        table {
            width: 100%;
            margin-bottom: 20px;
            color: #f8f9fa; /* Light text */
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #333;
        }

        th {
            background-color: #333;
            font-weight: 600;
        }

        /* Button Styling */
        .btn-primary {
            background-color: #d4a05a; /* Updated button color */
            border: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #bb8b50; /* Darker shade of yellow on hover */
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            font-weight: bold;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .btn-checkout {
            background-color: #28a745; /* Green button for checkout */
            border: none;
            font-weight: bold;
        }

        .btn-checkout:hover {
            background-color: #218838; /* Darker shade of green on hover */
        }

        /* Alert Styling */
        .alert-danger {
            background-color: #1f1f1f; /* Brighter red color for better visibility */
            color: #f44336; /* White text color */
            border: none;
            margin-top: 15px;
            padding: 10px; /* Padding for better spacing */
            font-weight: 600; /* Bold text for emphasis */
            text-align: center; /* Center the text */
        }

        /* Link Styling */
        a {
            color: #d4a05a; /* Updated link color */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Centering the "Home" button */
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

    <!-- Cart Container -->
    <div class="container">
        <h1 class="text-center">Your Cart</h1>
        
        <c:if test="${not empty cart.items}">
            <table>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
                <c:forEach var="item" items="${cart.items}">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>Rs ${item.product.price}</td>
                        <td>
                            <form action="cart" method="post">
                                <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control form-control-sm">
                                <input type="hidden" name="productId" value="${item.product.productId}">
                                <input type="hidden" name="action" value="update">
                                <button type="submit" class="btn btn-primary mt-2">Update</button>
                            </form>
                        </td>
                        <td>Rs ${item.totalPrice}</td>
                        <td>
                            <form action="cart" method="post">
                                <input type="hidden" name="productId" value="${item.product.productId}">
                                <input type="hidden" name="action" value="remove">
                                <button type="submit" class="btn btn-danger">Remove</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="3"><strong>Total:</strong></td>
                    <td colspan="2"><strong>Rs ${cart.total}</strong></td>
                </tr>
            </table>

            <!-- Checkout Button -->
            <div class="text-center">
                <form action="checkout" method="post">
                    <button type="submit" class="btn btn-checkout mt-4 w-100">Proceed to Checkout</button>
                </form>
            </div>

        </c:if>

        <c:if test="${empty cart.items}">
            <div class="alert alert-danger">Your cart is empty.</div>
        </c:if>
        
        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-secondary w-100">Home</a>
        </div>
    </div>


    <!-- Scripts -->
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
