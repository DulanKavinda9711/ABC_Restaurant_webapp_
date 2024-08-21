<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart | ABC Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Poppins" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            padding-top: 56px;
            background-color: #121212;
            color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            margin: 0;
        }
        .header {
            background-color: #000;
            padding: 15px;
            text-align: center;
            font-size: 26px;
            color: #ffffff;
            font-weight: 500;
            letter-spacing: 1px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .container {
            max-width: 700px;
            background-color: #1f1f1f;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.6);
            margin-top: 60px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            color: #f8f9fa;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #333;
        }
        th {
            background-color: #333;
            font-weight: 600;
        }
        .btn-primary {
            background-color: #d4a05a;
            border: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #bb8b50;
        }
        .btn-checkout {
            background-color: #28a745;
            border: none;
            font-weight: bold;
        }
        .btn-checkout:hover {
            background-color: #218838;
        }
        .alert-danger {
            background-color: #1f1f1f;
            color: #f44336;
            border: none;
            margin-top: 15px;
            padding: 10px;
            font-weight: 600;
            text-align: center;
        }
        a {
            color: #d4a05a;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
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

            <!-- Customer Name and Address Form -->
            <div class="mt-4">
                <form action="cart" method="post" onsubmit="showLoadingSpinner()">
                    <input type="hidden" name="action" value="checkout">
                    <div class="mb-3">
                        <label for="customerName" class="form-label">Customer Name</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" value="${sessionScope.customer.name}" required>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                    </div>

                    <!-- Checkout Button with loading spinner -->
                    <button type="submit" class="btn btn-checkout mt-4 w-100">Proceed to Checkout</button>
                </form>
            </div>

        </c:if>

        <c:if test="${empty cart.items}">
            <div class="alert alert-danger">Your cart is empty.</div>
        </c:if>
        
        <div class="text-center mt-4">
            <a href="index#menu" class="btn btn-secondary w-100">Home</a>
        </div>
    </div>

    <!-- Loading Spinner -->
    <div id="loading-spinner" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 10000;">
        <div class="spinner-border text-light" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <script>
        function showLoadingSpinner() {
            document.getElementById('loading-spinner').style.display = 'block';
            setTimeout(function() {
                document.querySelector('form').submit();
            }, 20000); // 20 seconds delay
        }
    </script>
</body>
</html>
