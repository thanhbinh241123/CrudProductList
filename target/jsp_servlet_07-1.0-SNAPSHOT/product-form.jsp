<%--
  Created by IntelliJ IDEA.
  User: thidk
  Date: 5/22/23
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        form {
            width: 300px;
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"],
        a.button {
            display: inline-block;
            background-color: #4CAF50;
            color: #fff;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover,
        a.button:hover {
            background-color: #45a049;
        }

        a.button {
            margin-left: 5px;
        }
    </style>
</head>
<body>
<h1>Product Form</h1>
<c:choose>
    <c:when test="${empty product.id}">
        <form method="POST" action="products?action=create" enctype="multipart/form-data">
<%--        <form method="POST" action="products?action=create">--%>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name">
            <br><br>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price">
            <br><br>
            <!-- Existing form fields -->
            <label for="image">Image:</label>
            <input type="file" id="image" name="image">
            <br><br>

            <input type="submit" value="Create">
            <a class="button" href="products">Cancel</a>
        </form>
    </c:when>
    <c:otherwise>
        <form method="POST" action="products?action=update" enctype="multipart/form-data">
<%--        <form method="POST" action="products?action=update">--%>
            <input type="hidden" name="id" value="${product.id}">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${product.name}">
            <br><br>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" value="${product.price}">
            <br><br>
            <!-- Existing form fields -->
            <label for="image">Image:</label>
            <input type="file" id="image" name="image">
            <br><br>

            <input type="submit" value="Update">
            <a class="button" href="products">Cancel</a>
        </form>
        <form method="POST" action="products?action=delete">
            <input type="hidden" name="id" value="${product.id}">
            <input class="button" type="submit" value="Delete">
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
