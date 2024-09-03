<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
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
            margin-bottom: 20px; /* Slightly larger margin for more spacing */
        }

        .btn-primary {
            width: 100%;
            background-color: #007bff; /* Ensure the button matches the Bootstrap primary color */
            padding: 10px 0; /* Increase padding for better button size */
            font-size: 16px; /* Slightly larger font size */
            border-radius: 5px; /* Rounded corners for the button */
            transition: background-color 0.3s ease; /* Smooth transition for hover effect */
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Add Product</h1>
        <form action="product?action=add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" required></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" class="form-control" step="0.01" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label> <!-- Updated category field with dropdown -->
                <select class="form-control" id="category" name="category" required>
                    <option value="">Select Category</option>
                    <option value="Breakfast">Breakfast</option>
                    <option value="Lunch">Lunch</option>
                    <option value="Dinner">Dinner</option>
                    <option value="Dessert">Dessert</option>
                    <option value="Beverages">Beverages</option>
                </select>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" class="form-control" id="image" name="image" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>
</body>
</html>
