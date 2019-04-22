<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 06.03.2019
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
<html>
<head>
    <title>Requests</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Slots</th>
                <th>Owner</th>
                <th>City</th>
                <th>House number</th>
                <th>Street</th>
                <th>Postal code</th>
                <th>Cost</th>
                <th>Show in map</th>
                <th>Confirm</th>
                <th>Reject</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${parkings}" var="parking">
                <tr>
                    <td>${parking.slots}</td>
                    <td>${parking.owner.name} ${parking.owner.surname}</td>
                    <td>${parking.city.name}</td>
                    <td>${parking.houseNumber}</td>
                    <td>${parking.street}</td>
                    <td>${parking.postalCode}</td>
                    <td>${parking.cost}</td>
                    <td><a href="/Admin/parkingLocation/${parking.id}" class="btn btn-primary">Confirm</a></td>
                    <td>
                        <form action="/Admin/addParking" method="post">
                            <input type="hidden" name="id"  value="${parking.id}">
                            <button type="submit" class="btn btn-primary">Confirm</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </td>
                    <td>
                        <form action="/Admin/rejectRequest" method="post">
                            <input type="hidden" name="id" value="${parking.id}">
                            <button type="submit" class="btn btn-danger">Reject</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
--%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Page</title>

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
                        ${user.surname}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                        <a href="/Owner/createParkingPage" class="dropdown-item">Create Parking</a>
                        <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
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
                <a href="/Admin/adminPage" class="list-group-item">Dashboard</a>
                <a href="about.html" class="list-group-item">Bookings Made</a>
                <a href="services.html" class="list-group-item">Bookings Received</a>
                <a href="/Admin/requests" class="list-group-item">Requests</a>
                <a href="contact.html" class="list-group-item">Add Space</a>
                <a href="portfolio-1-col.html" class="list-group-item">My Spaces</a>
                <a href="portfolio-2-col.html" class="list-group-item">Profile Setting</a>
                <a href="portfolio-3-col.html" class="list-group-item">Data Preferences</a>
                <a href="portfolio-4-col.html" class="list-group-item">Feedback Management</a>
                <a href="portfolio-item.html" class="list-group-item">Vehicles</a>
                <a href="blog-home-1.html" class="list-group-item">Transactions</a>
                <a href="blog-home-2.html" class="list-group-item">Payment Sources</a>
                <a href="blog-post.html" class="list-group-item">Withdrawal Methods</a>
            </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Slots</th>
                    <th>Owner</th>
                    <th>City</th>
                    <th>House number</th>
                    <th>Street</th>
                    <th>Postal code</th>
                    <th>Cost</th>
                    <th>Show in map</th>
                    <th>Confirm</th>
                    <th>Reject</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${parkings}" var="parking">
                    <tr>
                        <td>${parking.slots}</td>
                        <td>${parking.owner.name} ${parking.owner.surname}</td>
                        <td>${parking.city.name}</td>
                        <td>${parking.houseNumber}</td>
                        <td>${parking.street}</td>
                        <td>${parking.postalCode}</td>
                        <td>${parking.cost}</td>
                        <td><a href="/Admin/parkingLocation/${parking.id}" class="btn btn-primary">Confirm</a></td>
                        <td>
                            <form action="/Admin/addParking" method="post">
                                <input type="hidden" name="id" value="${parking.id}">
                                <button type="submit" class="btn btn-primary">Confirm</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                        </td>
                        <td>
                            <form action="/Admin/rejectRequest" method="post">
                                <input type="hidden" name="id" value="${parking.id}">
                                <button type="submit" class="btn btn-danger">Reject</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                        </td>
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
