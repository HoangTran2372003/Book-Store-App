<%-- 
    Document   : AddBook
    Created on : Jul 16, 2025, 1:37:08 AM
    Author     : tranh
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booker Shop - Add Book Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <!-- Slick -->
        <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
    </head>
    <body>
        <jsp:include page="assets/layout/Navbar.jsp" />
        <div class="container mt-5 mb-5">
            <h1 class="mb-3">Add A New Book</h1>
                <form action="addBook" method="post">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" name="title" id="title" required class="form-control">
                    </div>

                    <div class="col-md-6">
                        <label for="author" class="form-label">Author</label>
                        <input type="text" name="author" id="author" required class="form-control">
                    </div>

                    <div class="col-md-6">
                        <label for="price" class="form-label">Price ($)</label>
                        <input type="number" step="0.01" name="price" id="price" required class="form-control">
                    </div>

                    <div class="col-md-6">
                        <label for="stock" class="form-label">Stock</label>
                        <input type="number" name="stock" id="stock" required class="form-control">
                    </div>

                    <div class="col-md-6">
                        <label for="viewCount" class="form-label">View Count</label>
                        <input type="number" name="viewCount" id="viewCount" required class="form-control" value="0">
                    </div>

                    <div class="col-md-6">
                        <label for="language" class="form-label">Language</label>
                        <select name="language" id="language" class="form-select" required>
                            <option value="English">English</option>
                            <option value="French">French</option>
                            <option value="Spanish">Spanish</option>
                            <option value="Vietnamese">Vietnamese</option>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label for="category" class="form-label">Category</label>
                        <select name="categoryId" id="category" class="form-select" required>
                            <c:forEach var="cat" items="${listCategory}">
                                <option value="${cat.id}">${cat.cname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label for="coverImage" class="form-label">Cover Image URL</label>
                        <input type="url" name="coverImage" id="coverImage" required class="form-control" placeholder="https://example.com/image.jpg">
                    </div>

                    <div class="col-12">
                        <label for="description" class="form-label">Description</label>
                        <textarea name="description" id="description" rows="4" class="form-control" required></textarea>
                    </div>

                    <div class="col-12">
                        <button type="submit" class="btn btn-success w-100">Add Book</button>
                    </div>
                </div>
            </form>
        </div>
        <jsp:include page="assets/layout/Footer.jsp" />
    </body>
</html>
