<%--
  Created by IntelliJ IDEA.
  User: Тынышбай Нуржан
  Date: 15.04.2019
  Time: 9:18
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

    <title>Modern Business - Start Bootstrap Template</title>

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
                <li class="nav-item active">
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
    <h1 class="mt-4 mb-3">Contact Us
        <%--<small>Subheading</small>--%>
    </h1>

    <%--<ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Contact</li>
    </ol>--%>

    <!-- Content Row -->
    <div class="row">
        <!-- Map Column -->
        <div class="col-lg-8 mb-4">
            <!-- Embedded Google Map -->
            <!-- 37.0625,-95.677068 -->
            <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=43.2350965,76.9091967,17.52&amp;spn=56.506174,79.013672&amp;t=m&amp;z=4&amp;output=embed"></iframe>
        </div>
        <!-- Contact Details Column -->
        <div class="col-lg-4 mb-4">
            <h3>Contact Details</h3>
            <p>
                Kazakhstan, Almaty
                <br>Zhetisu district, 05016
                <br>
            </p>
            <p>
                <abbr title="Phone">PHONE</abbr>: (123) 456-7890
            </p>
            <p>
                <abbr title="Email">EMAIL</abbr>:
                <a href="mailto:name@example.com">name@example.com
                </a>
            </p>
            <p>
                <abbr title="Hours">HOURS</abbr>: Monday - Friday: 9:00 AM to 5:00 PM
            </p>
        </div>
    </div>
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
        <div class="col-lg-8 mb-4">
            <h3>Send us a Message</h3>
            <form name="sentMessage" id="contactForm" novalidate>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Full Name:</label>
                        <input type="text" class="form-control" id="name" required data-validation-required-message="Please enter your name.">
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Phone Number:</label>
                        <input type="tel" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Email Address:</label>
                        <input type="email" class="form-control" id="email" required data-validation-required-message="Please enter your email address.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Message:</label>
                        <textarea rows="10" cols="100" class="form-control" id="message" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
                    </div>
                </div>
                <div id="success"></div>
                <!-- For success/fail messages -->
                <button type="submit" class="btn btn-primary" id="sendMessageButton">Send Message</button>
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

<!-- Contact form JavaScript -->
<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
<script src="/resources/js/jqBootstrapValidation.js"></script>
<script src="/resources/js/contact_me.js"></script>

</body>

</html>

