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
        <li class="nav-item">
            <a class="nav-link active" data-toggle="pill" href="#formDriver">For Drivers</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#formOwner">For Space Owners</a>
        </li>
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
                        <div class="checkbox">
                            <label class="small">
                                <input name="terms" type="checkbox">I have read and agree to the <a href="#">terms of service</a>
                            </label>
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
                                <div class="checkbox">
                                    <label class="small">
                                        <input name="terms" type="checkbox">I have read and agree to the <a href="#">terms of service</a>
                                    </label>
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
