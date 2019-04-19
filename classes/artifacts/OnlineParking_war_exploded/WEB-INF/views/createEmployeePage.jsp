<%--
  Created by IntelliJ IDEA.
  User: Тынышбай Нуржан
  Date: 15.04.2019
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create employee</title>
</head>
<body>
    <form action="/Owner/createEmployee" method="post">
        <input type="text" name="name" placeholder="enter name">
        <input type="text" name="surname" placeholder="enter surname">
        <input type="hidden" name="parkingId" value="${parkingId}">
        <input type="email" name="email" placeholder="enter email">
        <input type="password" name="password" placeholder="password">
        <button type="submit">Add employee</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</body>
</html>
