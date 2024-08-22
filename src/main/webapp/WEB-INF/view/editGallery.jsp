<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Gallery Image</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1 class="text-center">Edit Gallery Image</h1>
        <form action="gallery?action=edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${gallery.galleryId}">
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" class="form-control" id="image" name="image" required>
                <img src="${gallery.image}" class="product-image" alt="Current Gallery Image" style="width: 100px; margin-top: 10px;">
            </div>
            <button type="submit" class="btn btn-primary">Update Image</button>
        </form>
    </div>
</body>
</html>
