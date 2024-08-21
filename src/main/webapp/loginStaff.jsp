<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Login | ABC Restaurant</title>
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
            max-width: 380px;
            background-color: #1f1f1f; /* Slightly lighter black for contrast */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.6);
            margin-top: 60px; /* Reduced margin-top to lift the form up */
        }

        /* Form Element Styling */
        .form-group label {
            color: #d4a05a; /* Updated gold color for labels */
            font-weight: 600;
        }

        .form-control {
            background-color: #333; /* Darker input background */
            border: 1px solid #444; /* Slight border */
            color: #f8f9fa; /* Light text color */
        }

        .form-control:focus {
            border-color: #d4a05a; /* Updated yellow color */
            box-shadow: none; /* Remove default shadow */
        }

        .form-control::placeholder {
            color: #bbb; /* Lighter placeholder text */
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
        ABC RESTAURANT - STAFF
    </div>

    <!-- Login Form Container -->
    <div class="container">
        <h1 class="text-center">STAFF LOGIN</h1>
        <form action="staff?action=login" method="post" class="mt-4">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group mt-3">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-primary mt-4 w-100">Login</button>
        </form>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <div class="text-center mt-4">
            <p>Not registered? <a href="staff?action=register">Sign Up</a></p>
        </div>
       
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
