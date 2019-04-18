<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <button type="submit">Enter</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>


</body>
</html>