<%-- 
    Document   : BooksManage
    Created on : Jul 16, 2025, 12:26:47 AM
    Author     : tranh
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Booker Shop - Product Detail Page</title>
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
    <jsp:include page="assets/layout/Navbar.jsp" />
    <body>
        <div class="container my-5">
            <h1 class="mb-4 text-center fw-bold">Books Management</h1>




            <div class="d-flex justify-content-end mb-3">
                <a href="addBook" class="btn btn-success shadow-sm px-4">
                    <i class="fas fa-plus me-2"></i>Add New Book
                </a>
            </div>


            <div class="table-responsive rounded shadow-sm">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cover</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Views</th>
                            <th>Language</th>
                            <th>Created</th>
                            <th style="min-width: 130px;">Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="b" items="${bookList}">
                            <tr>
                                <td>${b.id}</td>
                                <td>
                                    <img src="${b.coverImage}" alt="${b.title}" class="img-thumbnail" style="height: 60px; width: 45px; object-fit: cover;">
                                </td>
                                <td class="text-start">${b.title}</td>
                                <td>${b.author}</td>
                                <td>
                                    <fmt:formatNumber value="${b.price}" type="number" maxFractionDigits="2"/>
                                </td>
                                <td>${b.stock}</td>
                                <td>${b.viewCount}</td>
                                <td>${b.language}</td>
                                <td>
                                    <fmt:formatDate value="${b.createdAt}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td>
                                    <div class="d-flex justify-content-center gap-2">
                                        <a href="editBook?bid=${b.id}" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="deleteBook?bid=${b.id}" class="btn btn-sm btn-outline-danger"
                                           onclick="return confirm('Are you sure you want to delete this book?');">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="assets/layout/Footer.jsp" />

    </body>
</html>