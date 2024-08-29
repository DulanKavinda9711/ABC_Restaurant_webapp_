<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gallery List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1 class="text-center">Gallery List</h1>

        <table class="table table-hover table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="gallery" items="${galleries}">
                    <tr>
                        <td>${gallery.galleryId}</td>
                        <td><img src="${gallery.image}" class="product-image" alt="Gallery Image" style="width: 100px; height: auto;"></td>
                        <td>
                            <a href="gallery?action=edit&id=${gallery.galleryId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="gallery?action=delete&id=${gallery.galleryId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this image?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
      
    </div>
</body>
</html>
