<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
            max-width: 600px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary {
            width: 100%;
        }
        
        /* General Body Styling */
        body {
            padding-top: 56px;
            background-color: #ffffff; /* Dark black background */
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
            max-width: 450px;
            background-color: #ffffff; /* Slightly lighter black for contrast */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.6);
            margin-top: 100px; /* Reduced margin-top to lift the form up */
        }
    </style>
</head>
<body>
<div class="header">
        <h1 class="text-center">Edit Product</h1>
    </div>
    <div class="container">
        
        <form action="product?action=edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${product.productId}">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" required>${product.description}</textarea>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" class="form-control" step="0.01" id="price" name="price" value="${product.price}" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label> <!-- New category field -->
                
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
                <input type="file" class="form-control" id="image" name="image">
                <img src="${product.imagePath}" class="product-image" alt="Current Product Image" style="width: 100px; margin-top: 10px;">
            </div>
            <button type="submit" class="btn btn-primary">Update Product</button>
        </form>
    </div>
</body>
</html>
