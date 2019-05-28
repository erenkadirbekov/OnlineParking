
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>
<head>
    <title>Owner Page</title>
</head>
<body>

<h1> Welcome, Manager, ${user.surname} ${user.name}</h1>

<form action="/logout" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button type="submit">Logout</button>
</form>

<a href="/Owner/createParkingPage">Create Parking</a>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Street</th>
        <th>House</th>
        <th>Cost</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${parkings}" var="park">
        <tr>
            <td>${park.id}</td>
            <td>${park.street}</td>
            <td>${park.houseNumber}</td>
            <td>${park.cost}</td>
            <td><a href="/Owner/ownerParkingPage?id=${park.id}">Go to Page</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


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
                    <a class="nav-link" href="/aboutPage">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contactPage">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/forDriversPage">For Drivers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/forSpaceOwnersPage">For Space Owners</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/faqPage">FAQ</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${user.name}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                        <a class="dropdown-item" href="/Owner/ownerPage">Dashboard</a>
                        <a class="dropdown-item" href="/faqPage">Bookings Received</a>
                        <a href="/Owner/createParkingPage" class="dropdown-item">Add Space</a>
                        <a class="dropdown-item" href="404.html">Transactions</a>
                        <a href="/Owner/createParkingPage" class="dropdown-item">Profile Settings</a>
                        <a class="dropdown-item" href="/faqPage">FAQ</a>

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
        <small>Welcome, ${user.surname} ${user.name}</small>
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
                <a href="/profileSettingsPage" class="list-group-item">Profile Setting</a>
                <a href="blog-home-1.html" class="list-group-item">Transactions</a>
                <a href="blog-home-2.html" class="list-group-item">Payment Sources</a>

            </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Street</th>
                    <th>House</th>
                    <th>Cost</th>
                    <th>Status</th>
                    <th>Read more</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${parkings}" var="park">
                    <tr>
                        <td>${park.id}</td>
                        <td>${park.street}</td>
                        <td>${park.houseNumber}</td>
                        <td>${park.cost}</td>
                        <td>
                            <c:choose>
                                <c:when test="${park.status == 1}">
                                    Active
                                </c:when>
                                <c:otherwise>
                                  Non-active
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><a href="/Owner/ownerParkingPage/${park.id}">Detailed</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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