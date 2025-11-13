<%-- 
    Document   : index
    Created on : Jul 14, 2025, 6:10:01 AM
    Author     : tranh
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Booker Shop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">


        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

    <body>
        <jsp:include page="assets/layout/Navbar.jsp"></jsp:include>

            <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
                    <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
                    <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
                </ol>

                <!-- Slides -->
                <div class="carousel-inner">

                    <!-- Slide Template -->
                    <div class="carousel-item active">
                        <div class="position-relative" style="height: 90vh; overflow: hidden;">
                            <img src="https://images.unsplash.com/photo-1521056787327-165dc2a32836?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                                 class="d-block w-100 h-100" style="object-fit: cover;" alt="Slide 1">
                            <div class="carousel-caption d-flex flex-column justify-content-center align-items-start h-100 p-5">
                                <h1 class="display-4 text-white fw-bold shadow-text">Booker Shop</h1>
                                <h3 class="text-success fw-light shadow-text">Discover books across genres </h3>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <div class="position-relative" style="height: 90vh; overflow: hidden;">
                            <img src="https://plus.unsplash.com/premium_photo-1721762724233-1332468b252f?q=80&w=871&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                                 class="d-block w-100 h-100" style="object-fit: cover;" alt="Slide 1">
                            <div class="carousel-caption d-flex flex-column justify-content-center align-items-start h-100 p-5">
                                <h1 class="display-4 text-white fw-bold shadow-text">Booker Shop</h1>
                                <h3 class="text-success fw-light shadow-text">Discover books across genres </h3>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="position-relative" style="height: 90vh; overflow: hidden;">
                            <img src="https://plus.unsplash.com/premium_photo-1681412205724-067303630816?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                                 class="d-block w-100 h-100" style="object-fit: cover;" alt="Slide 1">
                            <div class="carousel-caption d-flex flex-column justify-content-center align-items-start h-100 p-5">
                                <h1 class="display-4 text-white fw-bold shadow-text">Booker Shop</h1>
                                <h3 class="text-success fw-light shadow-text">Discover books across genres </h3>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="carousel-control-prev" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </a>
                <a class="carousel-control-next" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </a>
            </div>

          


            <!-- Latest Books -->
            <section class="container py-5">
                <div class="text-center mb-5">
                    <h1 class="h1">Latest Books</h1>
                    <p class="text-muted">
                        Discover the newest additions to our collection. Handpicked and freshly released.
                    </p>
                </div>

                <div class="row g-4">
                <c:forEach var="lb" items="${listBookLatest}">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <a href="detail?bid=${lb.id}">
                                <img src="${lb.coverImage}" class="card-img-top img-fluid rounded-top" alt="${lb.title}" style="height: 400px;">
                            </a>
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title text-center">${lb.title}</h5>
                                <div class="text-center mt-3">
                                    <a href="detail?bid=${lb.id}" class="btn btn-outline-success">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        


        <!-- Featured Books -->
        <section class="bg-light">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <h1 class="h1">Popular Books</h1>
                    <p class="text-muted">
                        Discover what everyone's reading — bestselling and most viewed books on our store.
                    </p>
                </div>

                <div class="row g-4">
                    <c:forEach var="fb" items="${listBookPopular}">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card h-100 shadow-sm border-0">
                                <a href="detail?bid=${fb.id}">
                                    <img src="${fb.coverImage}" 
                                         class="card-img-top img-fluid" 
                                         alt="${fb.title}" 
                                         style="height: 400px; object-fit: cover;">
                                </a>
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title text-center">${fb.title}</h5>

                                    <p class="text-center text-muted mb-2">
                                        <fmt:formatNumber value="${fb.price}" type="number" maxFractionDigits="0" />$
                                    </p>

                                    <p class="text-center text-secondary mb-3">
                                        ${fb.viewCount} views
                                    </p>

                                    <div class="text-center mt-auto">
                                        <a href="detail?bid=${fb.id}" class="btn btn-outline-success">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        


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
