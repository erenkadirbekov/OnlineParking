<%--
  Created by IntelliJ IDEA.
  User: erbol
  Date: 17.02.2019
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Driver Page</title>
</head>
<body>

    <h1> Welcome, Driver, ${user.surname} ${user.name}</h1>

    <form action="/logout" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">Logout</button>
    </form>

</body>
</html>
