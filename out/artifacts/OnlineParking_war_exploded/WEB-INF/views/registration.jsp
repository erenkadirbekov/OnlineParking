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
</head>
<body>

<a href="/index">Back to Index</a>

<form action="/registration" method="post">

    Email: <input type="email" name="email">
    Password: <input type="password" name="password">
    Name: <input type="text" name="name">
    Surname: <input type="text" name="surname">
    <button type="submit">Register</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>

</body>
</html>
