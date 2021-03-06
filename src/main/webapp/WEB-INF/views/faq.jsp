<%--
  Created by IntelliJ IDEA.
  User: Тынышбай Нуржан
  Date: 15.04.2019
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SmartParking</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
                <c:choose>
                    <c:when test="${user!=null}">
                        <c:choose>
                            <c:when test="${user.role.name=='admin'}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${user.name}
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog1">
                                        <a class="dropdown-item" href="/Admin/adminPage">Dashboard</a>
                                        <a href="/Owner/createParkingPage" class="dropdown-item">Bookings</a>
                                        <a class="dropdown-item" href="/Admin/requests">Requests</a>
                                        <a class="dropdown-item" href="404.html">Parking Spaces</a>
                                        <a class="dropdown-item" href="404.html">Vehicles</a>
                                        <a class="dropdown-item" href="404.html">Transactions</a>
                                        <a class="dropdown-item" href="/profileSettingsPage">Profile Settings</a>
                                        <a class="dropdown-item" href="/faqPage">FAQ</a>

                                        <form action="/logout" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button type="submit" class="dropdown-item">Logout</button>
                                        </form>
                                    </div>
                                </li>
                            </c:when>
                            <c:when test="${user.role.name=='employee'}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${user.name}
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog2">
                                        <a class="dropdown-item" href="/Employee/employeePage">Dashboard</a>
                                        <a class="dropdown-item" href="/faqPage">Bookings Received</a>
                                        <a href="/profileSettingsPage" class="dropdown-item">Profile Settings</a>
                                        <a class="dropdown-item" href="/faqPage">FAQ</a>

                                        <form action="/logout" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button type="submit" class="dropdown-item">Logout</button>
                                        </form>
                                    </div>
                                </li>
                            </c:when>
                            <c:when test="${user.role.name=='driver'}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${user.name}
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog3">
                                        <a class="dropdown-item" href="/Driver/driverPage">Dashboard</a>
                                        <a class="dropdown-item" href="sidebar.html">Find Parking</a>
                                        <a class="dropdown-item" href="sidebar.html">Bookings Made</a>
                                        <a class="dropdown-item" href="/profileSettingsPage">Profile Settings</a>
                                        <a class="dropdown-item" href="faq.html">Vehicles</a>
                                        <a class="dropdown-item" href="/faqPage">FAQ</a>
                                        <form action="/logout" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button type="submit" class="dropdown-item">Logout</button>
                                        </form>
                                    </div>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${user.name}
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                        <a class="dropdown-item" href="/Owner/ownerPage">Dashboard</a>
                                        <a class="dropdown-item" href="/faqPage">Bookings Received</a>
                                        <a href="/Owner/createParkingPage" class="dropdown-item">Add Space</a>
                                        <a href="/Owner/createParkingPage" class="dropdown-item">My Spaces</a>
                                        <a class="dropdown-item" href="404.html">Transactions</a>
                                        <a href="/Owner/createParkingPage" class="dropdown-item">Profile Settings</a>
                                        <a class="dropdown-item" href="/faqPage">FAQ</a>

                                        <form action="/logout" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button type="submit" class="dropdown-item">Logout</button>
                                        </form>
                                    </div>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link text-success" href="/loginPage">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-outline-success" href="/registrationPage">Sign Up</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">FAQ
        <small>Popular questions</small>
    </h1>



    <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="card">
            <div class="card-header" role="tab" id="headingOne">
                <h5 class="mb-0">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">What if I overstay my booking?</a>
                </h5>
            </div>

            <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
                <div class="card-body">
                    The space is only available to you for the period that you have booked for. If you do require the space for longer than expected, you will be able to extend the booking, provided that there is still availability for the location in the extended period required and if the extension is done before the original booking period ends.
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" role="tab" id="headingTwo">
                <h5 class="mb-0">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">What if I arrive early or late for booking?
                    </a>
                </h5>
            </div>
            <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="card-body">
                    If you're running late:
                    When you book a space with JustPark, you're guaranteed that space for the duration of the booking period - so don't worry, we won't give it to someone else. Please be aware that some car parks don't allow overnight access. You'll find this information on the listing description or booking confirmation email.

                    If you're early:
                    It's not currently possible to edit your booking to an earlier start time. This means you'll need to make a new booking to cover the extra time you use before your original booking commences, using the JustPark app or mobile website.
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" role="tab" id="headingThree">
                <h5 class="mb-0">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">How do I extend the day or time of my booking?</a>
                </h5>
            </div>
            <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="card-body">
                    To extend your booking or end it early, head to the Bookings section of your JustPark account. Click 'More' on the booking you want to update, and select 'Amend booking'. You can also extend your booking after it's started by using the JustPark app or mobile website, click here to see how to do this on the app.

                    If you want to start your booking earlier, we'll need to help sort that out for you. Please contact customer support to start your booking earlier.

                    Any refund or extra payment needed will be applied when we process the change.
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /.container -->

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


