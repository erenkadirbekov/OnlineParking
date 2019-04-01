
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager Page</title>
</head>
<body>

<h1> Welcome, Manager, ${user.surname} ${user.name}</h1>

<form action="/logout" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button type="submit">Logout</button>
</form>

<a href="/Owner/createParkingPage">Create Parking</a>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Street</th>
        <th>House</th>
        <th>Cost</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${parkings}" var="park">
        <tr>
            <td>${park.id}</td>
            <td>${park.street}</td>
            <td>${park.houseNumber}</td>
            <td>${park.cost}</td>
            <td><a href="/Owner/ownerParkingPage?id=${park.id}">Go to Page</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>
