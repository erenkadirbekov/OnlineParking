<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log In Page</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/js/jqBootstrapValidation.js"></script>


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

<br><br><br>


<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formLogin"></span>

                    <!-- form card login with validation feedback -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Login</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" action="/login" role="form" autocomplete="off" id="loginForm" novalidate="" method="post">
                                <div class="form-group">
                                    <label for="uname1">Email</label>
                                    <input type="email" class="form-control" name="email_parameter" id="uname1" required>
                                    <p class="help-block"></p>
                                    <div class="invalid-feedback">Please enter your email</div>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" name="password_parameter" id="pwd1" required autocomplete="new-password">
                                    <div class="invalid-feedback">Please enter a password</div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-success btn-lg float-right" id="btnLogin">Login</button>
                            </form>
                        </div>
                        <!--/card-body-->
                    </div>
                    <!-- /form card login -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- jQuery -->


<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript
<script src="../vendor/metisMenu/metisMenu.min.js"></script>-->

<!-- Custom Theme JavaScript
<script src="../dist/js/sb-admin-2.js"></script>-->

</body>

</html>
