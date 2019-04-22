<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yeren
  Date: 19.04.2019
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Active Parkings</title>
    <link href="/resources/css/bootstrap.css">
</head>
<body>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Slots number</th>
            <th scope="col">Address</th>
            <th scope="col">Owner</th>
            <th scope="col">Cost</th>
            <th scope="col">Deactivate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="parking" items="${parkings}">
            <tr>
                <th scope="row">${parking.id}</th>
                <td>${parking.slots}</td>
                <td>${parking.city.name}, ${parking.street}, ${parking.houseNumber}</td>
                <td>${parking.owner.name} ${parking.owner.surname}</td>
                <td>${parking.cost}</td>
                <td>
                    <form action="/Admin/deactivateParking" method="post">
                        <input type="hidden" name="parkingId" value="${parking.id}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="btn btn-danger">Deactivate</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
