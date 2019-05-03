<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 22.04.2019
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employees Workplace</title>
</head>
<body>
    <form action="/Owner/editEmployee" method="post">
        Name: <input type="text" name="name" value="${employee.name}">
        Surname: <input type="text" name="surname" value="${employee.surname}">
        <input type="email" name="email" value="${employee.email}">
        <input type="password" name="password" placeholder="enter new password">
        <select name="parkingId">
            <c:forEach var="parking" items="${parkings}">
                <option value="${parking.id}">parking on ${parking.city.name}, ${parking.street}, ${parking.houseNumber}</option>
            </c:forEach>
        </select>
        <input type="hidden" name="employeeId" value="${employee.id}">
        <button type="submit">Accept</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</body>
</html>
