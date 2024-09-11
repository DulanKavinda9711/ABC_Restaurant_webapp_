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
        .card-selection {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }

        .card-option {
            text-align: center;
        }

        .card-option img {
            width: 80px;
            height: 50px;
        }

        .card-option input[type="radio"] {
            margin-top: 10px;
        }

        .selected-card {
            border: 2px solid #28a745;
            padding: 5px;
            border-radius: 5px;
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

            
            <div class="mt-4">
                <form id="payment-form" action="cart" method="post" onsubmit="submitPayment(event)">
                    <input type="hidden" name="action" value="checkout">
                    
                    
                    <div class="mb-3">
                        <label for="customerName" class="form-label">Customer Name</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" value="${sessionScope.customer.name}" required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                    </div>

                   
                    <div class="card-selection">
                        <div class="card-option">
                            <label for="visa" class="selected-card">
                                <img src="assets/img/visa.png" alt="Visa">
                                <br>
                                <input type="radio" id="visa" name="cardType" value="Visa" required>
                            </label>
                        </div>

                        <div class="card-option">
                            <label for="mastercard" class="selected-card">
                                <img src="assets/img/mastercard.png" alt="MasterCard">
                                <br>
                                <input type="radio" id="mastercard" name="cardType" value="MasterCard" required>
                            </label>
                        </div>

                        <div class="card-option">
                            <label for="jcb" class="selected-card">
                                <img src="assets/img/jcb.png" alt="JCB">
                                <br>
                                <input type="radio" id="jcb" name="cardType" value="JCB" required>
                            </label>
                        </div>
                    </div>

                    
                    <div class="mb-3">
                        <label for="cardNumber" class="form-label">Card Number</label>
                        <input type="text" class="form-control" id="cardNumber" name="cardNumber" maxlength="16" required>
                    </div>
                    
                   
                    <div class="mb-3 row">
                        <div class="col">
                            <label for="expiryMonth" class="form-label">Expiry Month</label>
                            <input type="text" class="form-control" id="expiryMonth" name="expiryMonth" maxlength="2" required>
                        </div>
                        <div class="col">
                            <label for="expiryYear" class="form-label">Expiry Year</label>
                            <input type="text" class="form-control" id="expiryYear" name="expiryYear" maxlength="4" required>
                        </div>
                    </div>

                   
                    <div class="mb-3">
                        <label for="cvv" class="form-label">CVV</label>
                        <input type="text" class="form-control" id="cvv" name="cvv" maxlength="3" required>
                    </div>

                    
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

    
    <div id="loading-spinner" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 10000;">
        <div class="spinner-border text-light" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <script>
   
    function submitPayment(event) {
        event.preventDefault();

        const cardNumber = document.getElementById('cardNumber').value;
        const expiryMonth = document.getElementById('expiryMonth').value;
        const expiryYear = document.getElementById('expiryYear').value;
        const cvv = document.getElementById('cvv').value;
        const customerName = document.getElementById('customerName').value; // Get the customer name

        // Validate card number
        if (!/^\d{16}$/.test(cardNumber)) {
            alert('Please enter a valid 16-digit card number.');
            return;
        }

        // Validate expiry month
        if (!/^\d{2}$/.test(expiryMonth) || expiryMonth < 1 || expiryMonth > 12) {
            alert('Please enter a valid expiry month (01-12).');
            return;
        }

        // Validate expiry year
        const currentYear = new Date().getFullYear();
        if (!/^\d{4}$/.test(expiryYear) || parseInt(expiryYear) < currentYear) {
            alert('Please enter a valid expiry year.');
            return;
        }

        // Validate CVV
        if (!/^\d{3}$/.test(cvv)) {
            alert('Please enter a valid 3-digit CVV.');
            return;
        }

        // If all validations pass, display the success message with the customer's name
        alert(`Payment successfully made for ${sessionScope.customer.name}!`);
        
        document.getElementById('payment-form').submit();
    }


</script>

</body>
</html>
