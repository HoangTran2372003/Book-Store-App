<%-- 
    Document   : EditBook
    Created on : Jul 16, 2025, 2:31:50 AM
    Author     : tranh
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booker Shop - Edit Book Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

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
            <h1 class="mb-4">Edit Book</h1>

            <form action="editBook" method="post">
                <!-- Hidden field to keep track of book ID -->
                <input type="hidden" name="id" value="${book.id}" />

                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" name="title" id="title" required class="form-control" value="${book.title}">
                    </div>

                    <div class="col-md-6">
                        <label for="author" class="form-label">Author</label>
                        <input type="text" name="author" id="author" required class="form-control" value="${book.author}">
                    </div>

                    <div class="col-md-6">
                        <label for="price" class="form-label">Price ($)</label>
                        <input type="number" step="0.01" name="price" id="price" required class="form-control" value="${book.price}">
                    </div>

                    <div class="col-md-6">
                        <label for="stock" class="form-label">Stock</label>
                        <input type="number" name="stock" id="stock" required class="form-control" value="${book.stock}">
                    </div>

                    <div class="col-md-6">
                        <label for="viewCount" class="form-label">View Count</label>
                        <input type="number" name="viewCount" id="viewCount" required class="form-control" value="${book.viewCount}">
                    </div>

                    <div class="col-md-6">
                        <label for="language" class="form-label">Language</label>
                        <select name="language" id="language" class="form-select" required>
                            <option value="English" ${book.language == 'English' ? 'selected' : ''}>English</option>
                            <option value="French" ${book.language == 'French' ? 'selected' : ''}>French</option>
                            <option value="Spanish" ${book.language == 'Spanish' ? 'selected' : ''}>Spanish</option>
                            <option value="Vietnamese" ${book.language == 'Vietnamese' ? 'selected' : ''}>Vietnamese</option>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label for="categoryId" class="form-label">Category</label>
                        <select name="categoryId" id="categoryId" class="form-select" required>
                            <c:forEach var="cat" items="${listCategory}">
                                <option value="${cat.id}" <c:if test="${cat.id == book.categoryId}">selected</c:if>>
                                    ${cat.cname}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label for="coverImage" class="form-label">Cover Image URL</label>
                        <input type="url" name="coverImage" id="coverImage" required class="form-control"
                               placeholder="https://example.com/image.jpg"
                               value="${book.coverImage}"
                               pattern="https?://.+"
                               title="Please enter a valid URL (must start with http:// or https://)">
                    </div>

                    <div class="col-12">
                        <label for="description" class="form-label">Description</label>
                        <textarea name="description" id="description" rows="4" class="form-control" required>${book.description}</textarea>
                    </div>

                    <div class="col-12">
                        <button type="submit" class="btn btn-primary w-100">Update Book</button>
                    </div>
                </div>
            </form>
        </div>
        <jsp:include page="assets/layout/Footer.jsp" />
    </body>
</html>
