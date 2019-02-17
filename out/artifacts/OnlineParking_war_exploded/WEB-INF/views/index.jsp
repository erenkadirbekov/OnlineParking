<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 13.02.2019
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>

<a href="/registrationPage">Registration</a>

<form action="/login" method="post">

    Email: <input type="email" name="email">
    Password: <input type="password" name="password">
    <button type="submit">Enter</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>


</body>
</html>
