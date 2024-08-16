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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Edit Product</h1>
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
                <label for="category">Category:</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="Breakfast" ${product.category == 'Breakfast' ? 'selected' : ''}>Breakfast</option>
                    <option value="Lunch" ${product.category == 'Lunch' ? 'selected' : ''}>Lunch</option>
                    <option value="Dinner" ${product.category == 'Dinner' ? 'selected' : ''}>Dinner</option>
                    <option value="Dessert" ${product.category == 'Dessert' ? 'selected' : ''}>Dessert</option>
                    <option value="Beverage" ${product.category == 'Beverage' ? 'selected' : ''}>Beverage</option>
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
