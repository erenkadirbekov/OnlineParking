<%@ page import="com.parking.entities.Parkings" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>
<head>
    <title>CreateParkingPage</title>
</head>
<body>

<form action="/Owner/createParking" method="post">

    <input type="number" name="slots" placeholder="Num of Slots">
    <input type="number" name="cost" placeholder="Cost">
    <input type="text" name="house" placeholder="House">
    <input type="text" name="street" placeholder="Street">
    <input type="text" name="postal" placeholder="Postal Code">
    <select name="city">
        <c:forEach items="${cities}" var="city">
            <option value="${city.id}">${city.name}</option>
        </c:forEach>
    </select>
    <button type="submit">SEND</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>


</body>
</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Owner Page</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/modern-business.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/index">SmartParking</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="about.html">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="services.html">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.html">Contact</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        For Drivers
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                        <a class="dropdown-item" href="portfolio-1-col.html"></a>
                        <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
                        <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
                        <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
                        <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Rent out Driveway
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog1">
                        <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                        <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                        <a class="dropdown-item" href="blog-post.html">Blog Post</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${user.name}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                        <a class="dropdown-item" href="/Owner/ownerPage">Dashboard</a>
                        <a href="/Owner/createParkingPage" class="dropdown-item">Add Space</a>
                        <a class="dropdown-item" href="faq.html">FAQ</a>
                        <a class="dropdown-item" href="404.html">404</a>
                        <form action="/logout" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="dropdown-item">Logout</button>
                        </form>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Dashboard
        <small>Welcome, Admin, ${user.surname} ${user.name}</small>
    </h1>


    <!-- Content Row -->
    <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
            <div class="list-group">
                <a href="/Owner/ownerPage" class="list-group-item">Dashboard</a>
                <a href="services.html" class="list-group-item">Bookings Received</a>
                <a href="/Owner/createParkingPage" class="list-group-item">Add Space</a>
                <a href="portfolio-1-col.html" class="list-group-item">My Spaces</a>
                <a href="portfolio-2-col.html" class="list-group-item">Profile Setting</a>
                <a href="blog-home-1.html" class="list-group-item">Transactions</a>
                <a href="blog-home-2.html" class="list-group-item">Payment Sources</a>
                <form action="/logout" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button type="submit" class="btn-outline-danger list-group-item">Logout</button>
                </form>
            </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
            <form action="/Owner/createParking" method="post">

                <input type="number" name="slots" placeholder="Num of Slots">
                <input type="number" name="cost" placeholder="Cost">
                <input type="text" name="house" placeholder="House">
                <input type="text" name="street" placeholder="Street">
                <input type="text" name="postal" placeholder="Postal Code">
                <select name="city">
                    <c:forEach items="${cities}" var="city">
                        <option value="${city.id}">${city.name}</option>
                    </c:forEach>
                </select>
                <button type="submit">SEND</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Smart Parking 2019</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>