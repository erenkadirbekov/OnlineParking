<%--
  Created by IntelliJ IDEA.
  User: erbol
  Date: 17.02.2019
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
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

<%--<a href="/index">Main Page</a>

<form action="/registration" method="post">

    Email: <input type="email" name="email">
    Password: <input type="password" name="password">
    Name: <input type="text" name="name">
    Surname: <input type="text" name="surname">
    Role: <select name="role">
            <option value="driver">Driver</option>
            <option value="owner">Owner</option>
          </select>
    <button type="submit">Register</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>--%>
<div class="container">
    <!-- Nav pills -->
    <ul class="nav nav-pills justify-content-center" role="tablist">
        <c:if test="${error1==1||error1==null}">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="pill" href="#formDriver">For Drivers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#formOwner">For Space Owners</a>
            </li>
        </c:if>
        <c:if test="${error1==2}">
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#formDriver">For Drivers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" data-toggle="pill" href="#formOwner">For Space Owners</a>
            </li>
        </c:if>
    </ul>

    <!-- Tab panes -->
    <%--<div class="tab-content">
        <div id="home" class="container tab-pane active"><br>
            <h3>HOME</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <div id="menu1" class="container tab-pane fade"><br>
            <h3>Menu 1</h3>
            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
        <div id="menu2" class="container tab-pane fade"><br>
            <h3>Menu 2</h3>
            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
        </div>
    </div>--%>

    <c:if test="${error1>0}">

        <p class="alert-danger">ERROR</p>

    </c:if>


    <div class="tab-content">
        <div id="formDriver" class="container tab-pane active">
            <div class="container-fluid bg-light py-3">
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="card card-body">
                            <h3 class="text-center mb-4">Sign-up</h3>
                            <%--<div class="alert alert-danger">
                                <a class="close font-weight-light" data-dismiss="alert" href="#">×</a>Password is too short.
                            </div>--%>
                            <form action="/registration" method="post">
                                <fieldset>
                                    <div class="form-group has-success">
                                        <input class="form-control input-lg" placeholder="E-mail Address" name="email" type="text">
                                    </div>
                                    <div class="form-group has-success">
                                        <input class="form-control input-lg" placeholder="Password" name="password" type="password">
                                    </div>
                                    <div class="form-group has-success">
                                        <input class="form-control input-lg" placeholder="Name" name="name" type="text">
                                    </div>
                                    <div class="form-group has-success">
                                        <input class="form-control input-lg" placeholder="Surname" name="surname" type="text">
                                    </div>

                                    <button type="submit" class="btn btn-lg btn-primary btn-block">Sign Me Up</button>
                                    <input type="hidden" name="role" value="driver">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </fieldset>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
    </div>
        <div id="formOwner" class="container tab-pane fade">
        <div class="container-fluid bg-light py-3">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card card-body">
                        <h3 class="text-center mb-4">Owner Sign-up</h3>
                        <%--<div class="alert alert-danger">
                            <a class="close font-weight-light" data-dismiss="alert" href="#">×</a>Password is too short.
                        </div>--%>
                        <form action="/registration" method="post">
                            <fieldset>
                                <div class="form-group has-success">
                                    <input class="form-control input-lg" placeholder="E-mail Address" name="email" type="text">
                                </div>
                                <div class="form-group has-success">
                                    <input class="form-control input-lg" placeholder="Password" name="password" type="password">
                                </div>
                                <div class="form-group has-success">
                                    <input class="form-control input-lg" placeholder="Name" name="name" type="text">
                                </div>
                                <div class="form-group has-success">
                                    <input class="form-control input-lg" placeholder="Surname" name="surname" type="text">
                                </div>

                                <button type="submit" class="btn btn-lg btn-primary btn-block">Sign Me Up</button>
                                <input type="hidden" name="role" value="owner">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </fieldset>
                        </form>

                    </div>
                </div>

            </div>
        </div>
        </div>
    </div>
    </div>
</div>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
