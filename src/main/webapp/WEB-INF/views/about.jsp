<%--
  Created by IntelliJ IDEA.
  User: Тынышбай Нуржан
  Date: 15.04.2019
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>About Page</title>

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
                <li class="nav-item active">
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
    <h1 class="mt-4 mb-3">About
    </h1>


    <!-- Intro Content -->
    <div class="row">
        <div class="col-lg-6">
            <img class="img-fluid rounded mb-4" src="https://cdn.cultofmac.com/wp-content/uploads/2016/07/FullSizeRender-2-1-780x431.jpg" alt="">
        </div>
        <div class="col-lg-6">
            <h2>Our Vision</h2>
            <p>Parking is one of the most difficult and dysfunctional parts of modern city life – and that’s no surprise, as it’s barely changed for decades.</p>
            <p>Over 23% of car journeys involve some kind of parking pain – that’s 190 million trips a month – with drivers suffering from both uncertainty (availability, prices, restrictions) and inconvenience (full car parks, slow payments, unfair fines) on a daily basis.</p>
            <p>Yet we have the technology to make parking function seamlessly – and so much space is lying underutilised. There has to be a better system…</p>
        </div>
    </div>
    <!-- /.row -->

    <!-- Team Members -->
    <!-- <h2>Our Team</h2>

    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="http://placehold.it/750x450" alt="">
          <div class="card-body">
            <h4 class="card-title">Team Member</h4>
            <h6 class="card-subtitle mb-2 text-muted">Position</h6>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
          </div>
          <div class="card-footer">
            <a href="#">name@example.com</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="http://placehold.it/750x450" alt="">
          <div class="card-body">
            <h4 class="card-title">Team Member</h4>
            <h6 class="card-subtitle mb-2 text-muted">Position</h6>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
          </div>
          <div class="card-footer">
            <a href="#">name@example.com</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="http://placehold.it/750x450" alt="">
          <div class="card-body">
            <h4 class="card-title">Team Member</h4>
            <h6 class="card-subtitle mb-2 text-muted">Position</h6>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
          </div>
          <div class="card-footer">
            <a href="#">name@example.com</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Our Customers -->
    <!-- <h2>Our Customers</h2>
    <div class="row">
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
    </div>  -->
    <!-- /.row -->

</div>
<!-- /.container -->
<br>
<br>
<br>
<br>
<br>
<br>

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

