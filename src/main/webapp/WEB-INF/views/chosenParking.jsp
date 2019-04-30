<%@ page import="java.sql.Time" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Chosen parking</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/modern-business.css" rel="stylesheet">

    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css'>

    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=54c2e55f-61d2-415d-9910-d0db37ea584f" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="/resources/js/initMap.js" type="text/javascript"></script>

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
                        <a class="dropdown-item" href="/Driver/driverPage">Dashboard</a>
                        <a class="dropdown-item" href="sidebar.html">Find Parking</a>
                        <a class="dropdown-item" href="sidebar.html">Bookings Made</a>
                        <a class="dropdown-item" href="faq.html">Profile Settings</a>
                        <a class="dropdown-item" href="faq.html">Vehicles</a>
                        <a class="dropdown-item" href="/faqPage">FAQ</a>
                        <form action="/logout" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="dropdown-item">Logout</button>
                        </form>
                    </div>
                </li>
                <%--<li class="nav-item">
                    <a class="btn btn-outline-success" href="login.html">Login</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-success" href="signup.html">Sign Up</a>
                </li>--%>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <%--<h1 class="mt-4 mb-3">Dashboard
        <small>Driver</small>
    </h1>--%>


    <!-- Content Row -->
    <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
            <div class="list-group">
                <a href="/Driver/driverPage" class="list-group-item">Dashboard</a>
                <a href="about.html" class="list-group-item">Find Parking</a>
                <a href="about.html" class="list-group-item">Bookings Made</a>
                <a href="portfolio-2-col.html" class="list-group-item">Profile Setting</a>
                <a href="portfolio-item.html" class="list-group-item">Vehicles</a>
                <a href="blog-home-2.html" class="list-group-item">Payment Sources</a>
                <a href="blog-post.html" class="list-group-item">Withdrawal Methods</a>
            </div>
        </div>
        <!-- Content Column -->
        <script type="text/javascript">
            $(document).ready(function(){
                $("select.time").change(function(){
                    var selectedDate = $("#date").val();
                    var hour = $(this).children("option:selected").val();
                    var date = new Date();
                    var currentHour = date.getHours();
                    var currentDate = formatDate(date.getDate(), date.getMonth() + 1, date.getFullYear());
                    if (selectedDate === currentDate && currentHour >= hour) {
                        alert("Please, select right time");
                        if (currentHour === 23) {
                            currentHour = 0;
                            currentDate = formatDate(date.getDate(), date.getMonth() + 1, date.getFullYear())
                        }
                        else currentHour = currentHour+1;
                        $(this).val(currentHour);
                    }
                });
            });
        </script>

        <form action="/Driver/checkTime" method="post">
            <input type="hidden" name="id" value="${parking.id}">
            <label for="date">Date:</label>
            <input id="date" data-provide="datepicker">
            <select name="time" class="time">
                <%

                    for(int i = 0; i < 24; i++){

                %>

                <option value="<%=i%>"><%=i%>:00</option>

                <%
                    }
                %>
            </select>
            <input type="number" name="hours">
            <button type="submit">Submit</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>



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
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js'></script>
<script src="/resources/js/datePicker.js"></script>

</body>

</html>
