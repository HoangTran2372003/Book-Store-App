<%-- 
    Document   : Products
    Created on : Jul 14, 2025, 1:42:24 AM
    Author     : tranh
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Booker Shop - Product Listing Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    </head>

    <body style="display: flex; flex-direction: column; min-height: 100vh;">


        <main style="flex: 1;">
            <jsp:include page="assets/layout/Navbar.jsp"></jsp:include>
                
                <div class="container py-5">
                    <div class="row">
                        <!-- Sidebar: Categories -->
                        <div class="col-lg-3">
                            <h2 class="mb-4">Categories</h2>

                            <ul class="list-group list-group-flush">
                            <c:forEach var="c" items="${listCategory}">
                                <li class="list-group-item p-2 border-0">
                                    <a href="category?cid=${c.id}"
                                       class="category-link d-block px-2 py-2 rounded text-dark text-decoration-none ${highlight == c.id ? 'active' : ''}">
                                        ${c.cname}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="col-lg-9">
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="list-inline shop-top-menu pb-3 pt-1">
                                    <li class="list-inline-item">
                                        <a class="h3 text-dark text-decoration-none mr-3" href="books">All</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="h3 text-dark text-decoration-none mr-3" href="latest">Latest</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="h3 text-dark text-decoration-none" href="popular">Popular</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6 pb-4">
                                <form action="search" method="post">
                                    <div class="input-group">
                                        <input value="${searchValue}" type="text" class="form-control" name="search" placeholder="Search...">
                                        <button class="btn text-white" type="submit" style="background-color: #61B87C;">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        
                        <div class="row">
                            <c:forEach var="o" items="${listBook}">
                                <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                                    <div class="card h-100 shadow-sm border-0 product-item">
                                        <!-- Image -->
                                        <div class="position-relative overflow-hidden" style="height: 250px;">
                                            <a href="detail?bid=${o.id}">
                                                <img src="${o.coverImage}" class="card-img-top w-100 h-100" style="object-fit: cover;" alt="${o.title}">
                                            </a>
                                        </div>

                                        <!-- Body -->
                                        <div class="card-body d-flex flex-column justify-content-between">
                                            <h5 class="card-title text-truncate mb-2">
                                                <a href="detail?bid=${o.id}" class="text-decoration-none text-dark">${o.title}</a>
                                            </h5>
                                            <p class="card-text text-muted mb-3">  <fmt:formatNumber value="${o.price}" type="number" maxFractionDigits="0" />
                                                $</p>

                                            <!-- Buttons -->
                                            <div class="d-flex justify-content-between">
                                                <a href="add-to-cart?id=${o.id}" class="btn btn-outline-success btn-sm w-50 me-1">Cart</a>
                                                <a href="detail?bid=${o.id}" class="btn btn-outline-secondary btn-sm w-50">Details</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                    </div>
                </div>
        </main>

        <jsp:include page="assets/layout/Footer.jsp"></jsp:include>

        <!-- Start Script -->
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- End Script -->
    </body>

</html>