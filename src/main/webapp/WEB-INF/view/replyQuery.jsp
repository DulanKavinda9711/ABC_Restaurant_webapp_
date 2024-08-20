<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reply to Query</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
            max-width: 600px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Reply to Query</h1>
        <form action="query?action=sendReply&id=${query.queryId}" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${query.name}" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${query.email}" readonly>
            </div>
            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" class="form-control" id="subject" name="subject" value="${query.subject}" readonly>
            </div>
            <div class="form-group">
                <label for="message">Original Message</label>
                <textarea class="form-control" id="message" name="message" rows="3" readonly>${query.message}</textarea>
            </div>
            <div class="form-group">
                <label for="replyMessage">Reply Message</label>
                <textarea class="form-control" id="replyMessage" name="replyMessage" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Send Reply</button>
        </form>
    </div>
</body>
</html>
