<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Service</title>
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
        .service-image {
            width: 100px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Edit Service</h1>
        <form action="service?action=edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${service.serviceId}">
            <div class="form-group">
                <label for="serviceName">Service Name:</label>
                <input type="text" class="form-control" id="serviceName" name="serviceName" value="${service.serviceName}" required>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" required>${service.description}</textarea>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" class="form-control" id="image" name="image">
                <img src="${service.image}" class="service-image" alt="Current Service Image">
            </div>
            <button type="submit" class="btn btn-primary">Update Service</button>
        </form>
    </div>
</body>
</html>
