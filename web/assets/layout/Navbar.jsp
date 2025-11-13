<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light shadow">
    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href="home">
            Booker
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav navbar-nav d-flex">
                    <li class="nav-item me-3">
                        <a class="nav-link" href="home">Home</a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="books">Shop</a>
                    </li>
                    <c:if test="${sessionScope.account.isAdmin == 1}">
                        <li class="nav-item me-3">
                            <a class="nav-link" href="about.html">Accounts Manage</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account.isSeller == 1}">
                        <li class="nav-item me-3">
                            <a class="nav-link" href="bookManage">Products Manage</a>
                        </li>
                    </c:if>
                </ul>
            </div>

            <div class="navbar align-self-center d-flex">
                <!-- Cart Icon -->
                <a class="nav-icon position-relative text-decoration-none" href="#">
                    <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                </a>


                <c:if test="${sessionScope.account != null}">
                    <span class="nav-link text-dark text-decoration-none px-3">
                        Welcome ${sessionScope.account.firstName}!
                    </span>
                    <span class="text-muted px-1">|</span>
                    <a class="nav-link text-dark text-decoration-none px-3" href="logout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </c:if>


                <c:if test="${sessionScope.account == null}">
                    <a class="nav-link text-dark text-decoration-none px-3" href="Login.jsp">
                        <i class="fa fa-fw fa-user"></i> Login
                    </a>
                    <a class="nav-link text-dark text-decoration-none px-3" href="Register.jsp">
                        <i class="fa fa-fw fa-user-plus"></i> Register
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</nav>
