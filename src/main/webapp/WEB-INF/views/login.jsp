<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
<html>
<head>
    <title>Login Page</title>
</head>
<body>

<a href="/registrationPage">Registration</a>
<a href="/index">Main Page</a>
<form action="/login" method="post">

    Email: <input type="email" name="email_parameter">
    Password: <input type="password" name="password_parameter">
    <button type="submit" class="btn btn-lg btn-success btn-block">Enter</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>


</body>
</html>--%>
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



   </head>

<body>
<%--<br><br><br>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default justify-content-center">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Log In</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="/login" method="post">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="E-mail" name="email_parameter" type="email" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password_parameter" type="password">
                            </div>--%>
                            <%--<div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                </label>
                            </div>--%>
                            <!-- Change this to a button or input when using this as a form -->
                            <%--<button type="submit" class="btn btn-lg btn-success btn-block">Login</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>--%>
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
                                    <input type="email" class="form-control" name="email_parameter" id="uname1" required="">
                                    <div class="invalid-feedback">Please enter your email</div>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" name="password_parameter" id="pwd1" required="" autocomplete="new-password">
                                    <div class="invalid-feedback">Please enter a password</div>
                                </div>
                                <div class="form-check small">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input"> <span>Remember me on this computer</span>
                                    </label>
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
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript
<script src="../vendor/metisMenu/metisMenu.min.js"></script>-->

<!-- Custom Theme JavaScript
<script src="../dist/js/sb-admin-2.js"></script>-->

</body>

</html>
