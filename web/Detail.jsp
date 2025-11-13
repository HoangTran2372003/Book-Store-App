<%-- 
    Document   : Detail
    Created on : Jul 14, 2025, 4:10:07 AM
    Author     : tranh
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <body>
        <jsp:include page="assets/layout/Navbar.jsp"></jsp:include>
   
            <section class="bg-light">
                <div class="container pb-5">
                    <div class="row">
                        <div class="col-lg-5 mt-5">
                            <div class="card mb-3">
                                <img class="card-img img-fluid" src="${detail.coverImage}" alt="Card image cap" id="product-detail">
                        </div>
                    </div>
                    <div class="col-lg-7 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="h2">${detail.title}</h1>
                                <h3 class=" py-2" style="color: #61B87C"><b> $ <fmt:formatNumber value="${detail.price}" type="number" maxFractionDigits="0" /></b></h3>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>User Views Count: </h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${detail.viewCount}</strong></p>
                                    </li>
                                </ul>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>Author:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${detail.author}</strong></p>
                                    </li>
                                </ul>

                                <h6>Description:</h6>
                                <p>${detail.description}</p>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>Stock :</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${detail.stock}</strong></p>
                                    </li>
                                </ul>

                                <h6>Language:</h6>
                                <p class="text-muted"><strong>${detail.language}</strong></p>
                                <form action="" method="GET">
                                    <input type="hidden" name="product-title" value="Activewear">
                                    <div class="row">
                                        <div class="col-auto">
                                            <ul class="list-inline pb-3">
                                                <li class="list-inline-item text-right">
                                                    Quantity
                                                    <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                                </li>
                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                                <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row pb-3">
                                        <form action="cart" method="post">
                                            <input type="hidden" name="action" value="add"/>
                                            <input type="hidden" name="bookId" value="${detail.id}"/>
                                            <input type="hidden" name="quantity" value="1"/>

                                            <div class="row pb-3">
                                                <div class="col d-grid">
                                                    <button type="submit" class="btn btn-success btn-lg" name="submit" value="buy">Buy</button>
                                                </div>
                                                <div class="col d-grid">
                                                    <button type="submit" class="btn btn-success btn-lg" name="submit" value="addtocart">Add To Cart</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        


       
        <section class="py-5">
            <div class="container">
                <div class="row text-left p-2 pb-3">
                    <h4>Related Books</h4>
                </div>

              
                <div id="carousel-related-product">
                    <c:forEach var="sb" items="${similarBooks}">
                        <div class="p-2 pb-3">
                            <div class="product-wap card rounded-0">
                                <div class="card rounded-0">
                                    <a href="detail?bid=${sb.id}"><img style="height: 300px; object-fit: cover;" class="card-img rounded-0 img-fluid" src="${sb.coverImage}"></a>
                                </div>
                                <div class="card-body text-center">
                                    <a   style="height: 48px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;" href="detail?bid=${sb.id}" class="h3 text-decoration-none ">${sb.title}</a>
                                    <p  class="card-text  mb-3"><b>${sb.viewCount} Views</b></p>
                                    <p class="card-text  text-muted mb-3">  <fmt:formatNumber value="${sb.price}" type="number" maxFractionDigits="0" />
                                        $</p>
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

        <!-- Start Slider Script -->
        <script src="assets/js/slick.min.js"></script>
        <script>
            $('#carousel-related-product').slick({
                infinite: true,
                arrows: false,
                slidesToShow: 4,
                slidesToScroll: 3,
                dots: true,
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    }
                ]
            });
        </script>
        <!-- End Slider Script -->

    </body>

</html>
