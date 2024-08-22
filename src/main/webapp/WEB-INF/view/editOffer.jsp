<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Offer</title>
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
        .offer-image {
            width: 100px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Edit Offer</h1>
        <form action="offer?action=edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${offer.offerId}">
            <div class="form-group">
                <label for="name">Offer Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="${offer.name}" required>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" required>${offer.description}</textarea>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" class="form-control" id="image" name="image">
                <img src="${offer.image}" class="offer-image" alt="Current Offer Image">
            </div>
            <button type="submit" class="btn btn-primary">Update Offer</button>
        </form>
    </div>
</body>
</html>
