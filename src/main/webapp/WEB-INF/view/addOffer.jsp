<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Offer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 10px;
            max-width: 600px;
            padding: 20px; /* Added padding for better spacing */
            background-color: #d6dadf; /* Light background color */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 0px 0px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Add Offer</h1>
        <form action="offer?action=add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Offer Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" required></textarea>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" class="form-control" id="image" name="image" required>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Add Offer</button>
        </form>
    </div>
</body>
</html>
